# A Workout Tracker
I've developed a simple program designed to help me log and track my workouts. My ultimate goal is to transform this into a user-friendly app that will not only allow me to record my exercises but also provide interactive visuals to monitor my progress over time.

## Features
- **Add Workouts**: Log new workout sessions easily.
- **Track Progress** (Future Feature): Monitor your progress over time.
- **Interactive Visuals** (Future Feature): Visualize your workout data with dynamic charts and graphs.

# Project Structure
```
workout_tracker/
├── README.md
├── requirements.txt
├── data/
│   └── workout.db
├── pyvenv/  # Your python virtual environment here.
└── src/
    |── app.py
    ├── templates/
    │   └──  index.html
    └── static/
        ├── style.css
        └── script.js
```

# Setup Instructions
1. Clone the repository.
    ```bash
    git clone https://github.com/sandeepsanyal/workout_tracker.git
    cd workout_tracker
    ```
2. Create a virtual environment and activate it:
   - On Windows: `py -m venv pyvenv && pyvenv\Scripts\activate`
   - On macOS/Linux: `python3 -m venv pyvenv && source pyvenv/bin/activate`

3. Install the required packages.
    ```bash
    pip install -r requirements.txt
    ```
4. Run the application.
    ```bash
    python src/app.py
    ```
5. Open your browser and go to `http://127.0.0.1:5000/` to see the application in action.

# Future Enhancements
- Add interactive visuals using Plotly or Matplotlib.
- Allow exporting workout data to CSV/Excel.

