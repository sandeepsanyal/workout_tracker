SELECT * from muscles;

SELECT * from exercises;

SELECT * from exercises_muscle_map;

SELECT
    workout_tracker."Date",
    exercises."Exercise Name",
    workout_tracker."Weight",
    workout_tracker."Reps"
FROM workout_tracker
LEFT JOIN exercises
    ON workout_tracker."Exercise ID" = exercises."Exercise ID"
ORDER BY
    workout_tracker."Date",
    exercises."Exercise Name"
;

-- In SQLite, delete rows from workout_tracker table where "exercise ID" = "e3"
DELETE FROM workout_tracker WHERE "Exercise ID" = 'e_pull_9';