DROP TABLE IF EXISTS exercises;
DROP TABLE IF EXISTS muscles;
DROP TABLE IF EXISTS exercises_muscle_map;
DROP TABLE IF EXISTS workout_tracker;

-- Create tables
CREATE TABLE IF NOT EXISTS muscles (
    "Muscle ID" TEXT PRIMARY KEY,
    "Muscle Name" TEXT,
    "Body Area" TEXT,
    "Sub-area" TEXT
);
CREATE TABLE IF NOT EXISTS exercises (
    "Exercise ID" TEXT PRIMARY KEY,
    "Exercise Name" TEXT
);
CREATE TABLE IF NOT EXISTS exercises_muscle_map (
    "Exercise ID" TEXT,
    "Muscle ID" TEXT,
    FOREIGN KEY("Exercise ID") REFERENCES exercises("Exercise ID"),
    FOREIGN KEY("Muscle ID") REFERENCES muscles("Muscle ID")
);
CREATE TABLE IF NOT EXISTS workout_tracker (
    "Date" TEXT,
    "Exercise ID" TEXT,
    "Weight" INTEGER,
    "Reps" INTEGER,
    FOREIGN KEY("Exercise ID") REFERENCES exercises("Exercise ID")
);

INSERT INTO muscles VALUES ('m1', 'Front Deltoids', 'Upper Body', 'Shoulder');
INSERT INTO muscles VALUES ('m2', 'Middle Deltoids', 'Upper Body', 'Shoulder');
INSERT INTO muscles VALUES ('m3', 'Rear Deltoids', 'Upper Body', 'Shoulder');
INSERT INTO muscles VALUES ('m4', 'Pectoralis Major', 'Upper Body', 'Chest');
INSERT INTO muscles VALUES ('m5', 'Pectoralis Minor', 'Upper Body', 'Chest');
INSERT INTO muscles VALUES ('m6', 'Serratus Anterior', 'Upper Body', 'Chest');
INSERT INTO muscles VALUES ('m7', 'Latissimus Dorsi', 'Back', 'Mid-Back');
INSERT INTO muscles VALUES ('m8', 'Rhomboids', 'Back', 'Mid-Back');
INSERT INTO muscles VALUES ('m9', 'Trapezius (Upper)', 'Back', 'Upper Back');
INSERT INTO muscles VALUES ('m10', 'Trapezius (Middle)', 'Back', 'Upper Back');
INSERT INTO muscles VALUES ('m11', 'Trapezius (Lower)', 'Back', 'Upper Back');
INSERT INTO muscles VALUES ('m12', 'Biceps Brachii', 'Arms', 'Forearm');
INSERT INTO muscles VALUES ('m13', 'Triceps Brachii', 'Arms', 'Forearm');
INSERT INTO muscles VALUES ('m14', 'Brachialis', 'Arms', 'Forearm');
INSERT INTO muscles VALUES ('m15', 'Brachioradialis', 'Arms', 'Forearm');
INSERT INTO muscles VALUES ('m16', 'Rectus Abdominis', 'Core', 'Abdominals');
INSERT INTO muscles VALUES ('m17', 'Obliques (External)', 'Core', 'Abdominals');
INSERT INTO muscles VALUES ('m18', 'Obliques (Internal)', 'Core', 'Abdominals');
INSERT INTO muscles VALUES ('m19', 'Transverse Abdominis', 'Core', 'Abdominals');
INSERT INTO muscles VALUES ('m20', 'Erector Spinae', 'Back', 'Lower Back');
INSERT INTO muscles VALUES ('m21', 'Quadratus Lumborum', 'Core', 'Lower Back');
INSERT INTO muscles VALUES ('m22', 'Gluteus Maximus', 'Lower Body', 'Buttocks');
INSERT INTO muscles VALUES ('m23', 'Gluteus Medius', 'Lower Body', 'Hips');
INSERT INTO muscles VALUES ('m24', 'Gluteus Minimus', 'Lower Body', 'Hips');
INSERT INTO muscles VALUES ('m25', 'Hamstrings (Biceps Femoris)', 'Lower Body', 'Thighs');
INSERT INTO muscles VALUES ('m26', 'Hamstrings (Semimembranosus)', 'Lower Body', 'Thighs');
INSERT INTO muscles VALUES ('m27', 'Hamstrings (Semitendinosus)', 'Lower Body', 'Thighs');
INSERT INTO muscles VALUES ('m28', 'Quadriceps (Rectus Femoris)', 'Lower Body', 'Thighs');
INSERT INTO muscles VALUES ('m29', 'Quadriceps (Vastus Lateralis)', 'Lower Body', 'Thighs');
INSERT INTO muscles VALUES ('m30', 'Quadriceps (Vastus Medialis)', 'Lower Body', 'Thighs');
INSERT INTO muscles VALUES ('m31', 'Quadriceps (Vastus Intermedius)', 'Lower Body', 'Thighs');
INSERT INTO muscles VALUES ('m32', 'Gastrocnemius', 'Lower Body', 'Calves');
INSERT INTO muscles VALUES ('m33', 'Soleus', 'Lower Body', 'Calves');
INSERT INTO muscles VALUES ('m34', 'Tibialis Anterior', 'Lower Body', 'Shins');


INSERT INTO exercises VALUES ('e1', 'Shoulder Press');
INSERT INTO exercises VALUES ('e2', 'Arnold Press');
INSERT INTO exercises VALUES ('e3', 'Lateral Raises');
INSERT INTO exercises VALUES ('e4', 'Rear Delt Flyes');
INSERT INTO exercises VALUES ('e5', 'Push-Ups');
INSERT INTO exercises VALUES ('e6', 'Bench Press');
INSERT INTO exercises VALUES ('e7', 'Cable Flyes');
INSERT INTO exercises VALUES ('e8', 'Dumbbell Pullover');
INSERT INTO exercises VALUES ('e9', 'Pull-Ups');
INSERT INTO exercises VALUES ('e10', 'Bent-Over Rows');
INSERT INTO exercises VALUES ('e11', 'Seated Cable Rows');
INSERT INTO exercises VALUES ('e12', 'Face Pulls');
INSERT INTO exercises VALUES ('e13', 'Shrugs');
INSERT INTO exercises VALUES ('e14', 'Barbell Curls');
INSERT INTO exercises VALUES ('e15', 'Hammer Curls');
INSERT INTO exercises VALUES ('e16', 'Tricep Dips');
INSERT INTO exercises VALUES ('e17', 'Skull Crushers');
INSERT INTO exercises VALUES ('e18', 'Planks');
INSERT INTO exercises VALUES ('e19', 'Crunches');
INSERT INTO exercises VALUES ('e20', 'Russian Twists');
INSERT INTO exercises VALUES ('e21', 'Deadlifts');
INSERT INTO exercises VALUES ('e22', 'Back Extensions');
INSERT INTO exercises VALUES ('e23', 'Glute Bridges');
INSERT INTO exercises VALUES ('e24', 'Squats');
INSERT INTO exercises VALUES ('e25', 'Leg Press');
INSERT INTO exercises VALUES ('e26', 'Walking Lunges');
INSERT INTO exercises VALUES ('e27', 'Stiff-Legged Deadlifts');
INSERT INTO exercises VALUES ('e28', 'Calf Raises');
INSERT INTO exercises VALUES ('e29', 'Shin Raises');
INSERT INTO exercises VALUES ('e30', 'Incline Dumbbell Flyes');
INSERT INTO exercises VALUES ('e31', 'Cable Crossover (Low Pulley)');
INSERT INTO exercises VALUES ('e32', 'Barbell Shrugs Behind Back');
INSERT INTO exercises VALUES ('e34', 'Prone Reverse Flyes');
INSERT INTO exercises VALUES ('e35', 'Preacher Curls');
INSERT INTO exercises VALUES ('e36', 'Concentration Curls');
INSERT INTO exercises VALUES ('e37', 'Hammer Curl with Resistance Band');
INSERT INTO exercises VALUES ('e38', 'Rope Hammer Curls');
INSERT INTO exercises VALUES ('e39', 'Side Planks');
INSERT INTO exercises VALUES ('e40', 'Bicycle Crunches');
INSERT INTO exercises VALUES ('e41', 'Reverse Crunches');
INSERT INTO exercises VALUES ('e42', 'Leg Raises');
INSERT INTO exercises VALUES ('e43', 'Good Mornings');
INSERT INTO exercises VALUES ('e44', 'Bulgarian Split Squats');
INSERT INTO exercises VALUES ('e45', 'Step-Ups');
INSERT INTO exercises VALUES ('e46', 'Sumo Deadlifts');
INSERT INTO exercises VALUES ('e47', 'Pistol Squats');
INSERT INTO exercises VALUES ('e48', 'Leg Curls');
INSERT INTO exercises VALUES ('e49', 'Glute-Ham Raises');
INSERT INTO exercises VALUES ('e50', 'Romanian Deadlifts (RDLs)');
INSERT INTO exercises VALUES ('e51', 'Leg Extensions');
INSERT INTO exercises VALUES ('e52', 'Hack Squats');
INSERT INTO exercises VALUES ('e53', 'Leg Press (Feet High)');
INSERT INTO exercises VALUES ('e54', 'Sissy Squats');
INSERT INTO exercises VALUES ('e55', 'Front Squats');
INSERT INTO exercises VALUES ('e56', 'Calf Launchers');
INSERT INTO exercises VALUES ('e57', 'Lateral Lunges');
INSERT INTO exercises VALUES ('e58', 'Curtsy Lunges');


INSERT INTO exercises_muscle_map VALUES ('e1', 'm1');
INSERT INTO exercises_muscle_map VALUES ('e2', 'm1');
INSERT INTO exercises_muscle_map VALUES ('e3', 'm2');
INSERT INTO exercises_muscle_map VALUES ('e4', 'm3');
INSERT INTO exercises_muscle_map VALUES ('e5', 'm4');
INSERT INTO exercises_muscle_map VALUES ('e6', 'm4');
INSERT INTO exercises_muscle_map VALUES ('e7', 'm4');
INSERT INTO exercises_muscle_map VALUES ('e8', 'm6');
INSERT INTO exercises_muscle_map VALUES ('e9', 'm7');
INSERT INTO exercises_muscle_map VALUES ('e10', 'm7');
INSERT INTO exercises_muscle_map VALUES ('e11', 'm8');
INSERT INTO exercises_muscle_map VALUES ('e12', 'm3');
INSERT INTO exercises_muscle_map VALUES ('e12', 'm10');
INSERT INTO exercises_muscle_map VALUES ('e13', 'm9');
INSERT INTO exercises_muscle_map VALUES ('e14', 'm12');
INSERT INTO exercises_muscle_map VALUES ('e15', 'm13');
INSERT INTO exercises_muscle_map VALUES ('e16', 'm13');
INSERT INTO exercises_muscle_map VALUES ('e17', 'm13');
INSERT INTO exercises_muscle_map VALUES ('e18', 'm16');
INSERT INTO exercises_muscle_map VALUES ('e19', 'm16');
INSERT INTO exercises_muscle_map VALUES ('e20', 'm17');
INSERT INTO exercises_muscle_map VALUES ('e20', 'm18');
INSERT INTO exercises_muscle_map VALUES ('e21', 'm20');
INSERT INTO exercises_muscle_map VALUES ('e22', 'm20');
INSERT INTO exercises_muscle_map VALUES ('e22', 'm21');
INSERT INTO exercises_muscle_map VALUES ('e23', 'm22');
INSERT INTO exercises_muscle_map VALUES ('e24', 'm28');
INSERT INTO exercises_muscle_map VALUES ('e24', 'm31');
INSERT INTO exercises_muscle_map VALUES ('e25', 'm28');
INSERT INTO exercises_muscle_map VALUES ('e26', 'm28');
INSERT INTO exercises_muscle_map VALUES ('e26', 'm31');
INSERT INTO exercises_muscle_map VALUES ('e27', 'm27');
INSERT INTO exercises_muscle_map VALUES ('e28', 'm32');
INSERT INTO exercises_muscle_map VALUES ('e29', 'm34');
INSERT INTO exercises_muscle_map VALUES ('e30', 'm5');
INSERT INTO exercises_muscle_map VALUES ('e31', 'm5');
INSERT INTO exercises_muscle_map VALUES ('e32', 'm10');
INSERT INTO exercises_muscle_map VALUES ('e34', 'm11');
INSERT INTO exercises_muscle_map VALUES ('e35', 'm14');
INSERT INTO exercises_muscle_map VALUES ('e36', 'm14');
INSERT INTO exercises_muscle_map VALUES ('e37', 'm15');
INSERT INTO exercises_muscle_map VALUES ('e38', 'm15');
INSERT INTO exercises_muscle_map VALUES ('e39', 'm18');
INSERT INTO exercises_muscle_map VALUES ('e40', 'm17');
INSERT INTO exercises_muscle_map VALUES ('e40', 'm18');
INSERT INTO exercises_muscle_map VALUES ('e41', 'm19');
INSERT INTO exercises_muscle_map VALUES ('e42', 'm19');
INSERT INTO exercises_muscle_map VALUES ('e43', 'm21');
INSERT INTO exercises_muscle_map VALUES ('e43', 'm25');
INSERT INTO exercises_muscle_map VALUES ('e43', 'm26');
INSERT INTO exercises_muscle_map VALUES ('e43', 'm27');
INSERT INTO exercises_muscle_map VALUES ('e44', 'm23');
INSERT INTO exercises_muscle_map VALUES ('e45', 'm23');
INSERT INTO exercises_muscle_map VALUES ('e46', 'm22');
INSERT INTO exercises_muscle_map VALUES ('e46', 'm23');
INSERT INTO exercises_muscle_map VALUES ('e46', 'm24');
INSERT INTO exercises_muscle_map VALUES ('e46', 'm28');
INSERT INTO exercises_muscle_map VALUES ('e46', 'm29');
INSERT INTO exercises_muscle_map VALUES ('e46', 'm30');
INSERT INTO exercises_muscle_map VALUES ('e46', 'm31');
INSERT INTO exercises_muscle_map VALUES ('e47', 'm24');
INSERT INTO exercises_muscle_map VALUES ('e48', 'm25');
INSERT INTO exercises_muscle_map VALUES ('e49', 'm25');
INSERT INTO exercises_muscle_map VALUES ('e49', 'm26');
INSERT INTO exercises_muscle_map VALUES ('e49', 'm27');
INSERT INTO exercises_muscle_map VALUES ('e50', 'm26');
INSERT INTO exercises_muscle_map VALUES ('e51', 'm29');
INSERT INTO exercises_muscle_map VALUES ('e52', 'm30');
INSERT INTO exercises_muscle_map VALUES ('e53', 'm30');
INSERT INTO exercises_muscle_map VALUES ('e54', 'm28');
INSERT INTO exercises_muscle_map VALUES ('e54', 'm31');
INSERT INTO exercises_muscle_map VALUES ('e55', 'm11');
INSERT INTO exercises_muscle_map VALUES ('e55', 'm16');
INSERT INTO exercises_muscle_map VALUES ('e55', 'm19');
INSERT INTO exercises_muscle_map VALUES ('e55', 'm28');
INSERT INTO exercises_muscle_map VALUES ('e55', 'm31');
INSERT INTO exercises_muscle_map VALUES ('e56', 'm33');
INSERT INTO exercises_muscle_map VALUES ('e57', 'm23');
INSERT INTO exercises_muscle_map VALUES ('e58', 'm23');
INSERT INTO exercises_muscle_map VALUES ('e58', 'm24');