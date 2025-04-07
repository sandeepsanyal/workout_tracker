$(document).ready(function() {
    // Fetch body areas on page load
    fetchBodyAreas();

    $('#bodyArea').change(function() {
        var selectedBodyArea = $(this).val();
        if (selectedBodyArea) {
            fetchSubAreas(selectedBodyArea);
        } else {
            $('#subArea').empty().append('<option value="">Select Sub-area</option>');
            $('#exercise').empty().append('<option value="">Select Exercise</option>');
        }
    });

    $('#subArea').change(function() {
        var selectedSubArea = $(this).val();
        if (selectedSubArea) {
            fetchExercises(selectedSubArea);
        } else {
            $('#exercise').empty().append('<option value="">Select Exercise</option>');
        }
    });

    document.getElementById('workoutForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const formData = new FormData(this);
        fetch('/submit_workout', {
            method: 'POST',
            body: formData,
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Workout submitted successfully!');
                this.reset();
            } else {
                alert('Failed to submit workout.');
            }
        });
    });
});

function fetchBodyAreas() {
    $.getJSON('/get_body_areas', function(data) {
        console.log("Fetched body areas:", data);  // Debugging line
        var bodyAreaSelect = $('#bodyArea');
        bodyAreaSelect.empty().append('<option value="">Select Body Area</option>');
        data.forEach(function(bodyArea) {
            bodyAreaSelect.append($('<option></option>').val(bodyArea).text(bodyArea));
        });
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error("Error fetching body areas:", textStatus, errorThrown);
    });
}

function fetchSubAreas(bodyArea) {
    $.getJSON('/get_sub_areas', {body_area: bodyArea}, function(data) {
        console.log("Fetched sub-areas for " + bodyArea + ":", data);  // Debugging line
        var subAreaSelect = $('#subArea');
        subAreaSelect.empty().append('<option value="">Select Sub-area</option>');
        data.forEach(function(subArea) {
            subAreaSelect.append($('<option></option>').val(subArea).text(subArea));
        });
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error("Error fetching sub-areas:", textStatus, errorThrown);
    });
}

function fetchExercises(subArea) {
    $.getJSON('/get_exercises', {sub_area: subArea}, function(data) {
        console.log("Fetched exercises for " + subArea + ":", data);  // Debugging line
        var exerciseSelect = $('#exercise');
        exerciseSelect.empty().append('<option value="">Select Exercise</option>');
        data.forEach(function(exercise) {
            exerciseSelect.append($('<option></option>').val(exercise).text(exercise));
        });
    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error("Error fetching exercises:", textStatus, errorThrown);
    });
}
