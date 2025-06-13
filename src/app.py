import sys
import os
from flask import Flask, render_template, jsonify, request, redirect, url_for
import sqlite3

python_path = os.path.dirname(sys.executable)
split_python_path = python_path.split(sep=r"/")
home_folder = r"/".join(split_python_path[:len(split_python_path)-2])
py_env = split_python_path[len(split_python_path)-2]


app = Flask(
    __name__,
    template_folder=home_folder + r'/src/templates',
    static_folder=home_folder + r'/src/static'
)

def get_db_connection():
    conn = sqlite3.connect(home_folder + r'/data/workout.db')
    conn.row_factory = sqlite3.Row
    return conn

def get_exercise_id(exercise_name):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT "Exercise ID" FROM exercises WHERE "Exercise Name" = ?', (exercise_name,))
    exercise_id = cur.fetchone()[0]
    conn.close()
    return exercise_id

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/get_body_areas', methods=['GET'])
def get_body_areas():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT DISTINCT "Body Area" FROM muscles')
    body_areas = [row[0] for row in cur.fetchall()]
    conn.close()
    return jsonify(body_areas)

@app.route('/get_sub_areas', methods=['GET'])
def get_sub_areas():
    body_area = request.args.get('body_area')
    if not body_area:
        return jsonify({'error': 'Body area is required'}), 400
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT DISTINCT "Sub-area" FROM muscles WHERE "Body Area" = ?', (body_area,))
    sub_areas = [row[0] for row in cur.fetchall()]
    conn.close()
    return jsonify(sub_areas)

@app.route('/get_exercises', methods=['GET'])
def get_exercises():
    sub_area = request.args.get('sub_area')
    if not sub_area:
        return jsonify({'error': 'Sub area is required'}), 400
    conn = get_db_connection()
    cur = conn.cursor()
    query = """
    SELECT DISTINCT e."Exercise Name"
    FROM exercises e
    JOIN exercises_muscle_map em ON e."Exercise ID" = em."Exercise ID"
    JOIN muscles m ON em."Muscle ID" = m."Muscle ID"
    WHERE m."Sub-area" = ?
    """
    cur.execute(query, (sub_area,))
    exercises = [row[0] for row in cur.fetchall()]
    conn.close()
    return jsonify(exercises)

@app.route('/submit_workout', methods=['POST'])
def submit_workout():
    data = request.form
    date = data.get('date')
    body_area = data.get('bodyArea')
    sub_area = data.get('subArea')
    exercise = data.get('exercise')
    weight_str = data.get('weight')  # Get weight as string
    reps = data.get('reps')

    # Validate input (basic example)
    if not all([date, body_area, sub_area, exercise, weight_str, reps]):
        return jsonify({'success': False, 'message': 'All fields are required'}), 400

    try:
        weight = float(weight_str)  # Convert weight to float
    except ValueError:
        return jsonify({'success': False, 'message': 'Weight must be a number'}), 400

    try:
        exercise_id = get_exercise_id(exercise)
    except Exception as e:
        print(e)  # Log error
        return jsonify({'success': False, 'message': str(e)}), 500

    conn = get_db_connection()
    cur = conn.cursor()

    # Insert workout into the database (example query)
    insert_query = """
    INSERT INTO workout_tracker ("Date", "Exercise ID", "Weight", "Reps")
    VALUES (?, ?, ?, ?);
    """
    try:
        cur.execute(insert_query, (date, exercise_id, weight, reps))
        conn.commit()
        return jsonify({'success': True})
    except Exception as e:
        conn.rollback()
        print(e)  # Log error
        return jsonify({'success': False, 'message': str(e)}), 500
    finally:
        conn.close()

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=1094, debug=True)