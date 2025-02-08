class WorkoutsData {
  final String workoutName;
  final String instructorName;
  final String workoutDescription;
  final String imageUrl;
  final List<String> workouts;
  final Map<String, List<WorkoutExercises>> exercises;

  const WorkoutsData(
      {required this.workoutName,
      required this.instructorName,
      required this.workoutDescription,
      required this.imageUrl,
      required this.workouts,
      required this.exercises});
}

class WorkoutExercises {
  final String exercise;
  final int sets;
  final dynamic reps;

  WorkoutExercises(this.exercise, this.sets, this.reps);
}

List<WorkoutsData> workoutplans() {
  return [
    WorkoutsData(
      workoutName: "The Beast Mode",
      instructorName: "Beastmaster Brock",
      workoutDescription:
          "The Beast Mode Strength/Size routine by doslifts is a 7 day workout plan. It is a intermediate level plan to achieve general fitness goals",
      workouts: const [
        "Chest/Triceps",
        "Back/Biceps",
        "Legs",
        "Shoulders/Traps",
        "Cardio/Abs",
        "Rest",
        "Rest"
      ],
      imageUrl: "images/beast-mode-banner.jpg",
      exercises: {
        "Chest/Triceps": [
          WorkoutExercises("Flat Barbell Bench Press", 4, "6-8"),
          WorkoutExercises("Incline Dumbbell Press", 4, "8-10"),
          WorkoutExercises("Tricep Dips", 3, "10-12"),
          WorkoutExercises("Cable Flys", 3, "12-15"),
          WorkoutExercises("Overhead Triceps Extension", 3, "12-15"),
        ],
        "Back/Biceps": [
          WorkoutExercises("Deadlifts", 4, "5-6"),
          WorkoutExercises("Lat Pulldown", 4, "10-12"),
          WorkoutExercises("Seated Cable Row", 4, "10-12"),
          WorkoutExercises("Barbell Curl", 3, "12-15"),
          WorkoutExercises("Hammer Curl", 3, "12-15"),
        ],
        "Legs": [
          WorkoutExercises("Squat", 4, "5-6"),
          WorkoutExercises("Leg Press", 4, "10-12"),
          WorkoutExercises("Lunges", 3, "12-15"),
          WorkoutExercises("Leg Curl", 4, "12-15"),
          WorkoutExercises("Standing Calf Raise", 4, "12-15"),
        ],
        "Shoulders/Traps": [
          WorkoutExercises("Overhead Press", 4, "8-10"),
          WorkoutExercises("Lateral Raises", 4, "12-15"),
          WorkoutExercises("Front Raises", 3, "12-15"),
          WorkoutExercises("Shrugs", 4, "12-15"),
        ],
        "Cardio/Abs": [
          WorkoutExercises("Treadmill Sprints", 5, "30 sec on/1 min off"),
          WorkoutExercises("Plank", 4, "60 sec"),
          WorkoutExercises("Russian Twists", 4, "20 reps"),
          WorkoutExercises("Hanging Leg Raises", 4, "15-20"),
        ],
        "Rest 1": [],
        "Rest 2": [],
      },
    ),
    WorkoutsData(
        workoutName: "Push, Pull, Legs",
        instructorName: "Jeff Nippard",
        imageUrl: "images/ppl-jeff.jpg",
        workouts: const [
          "Push",
          "Pull",
          "Legs",
          "Rest",
          "Push",
          "Pull",
          "Legs",
        ],
        exercises: {
          "Push": [
            WorkoutExercises("Barbell Bench Press", 4, "6-8"),
            WorkoutExercises("Overhead Barbell Press", 3, "8-10"),
            WorkoutExercises("Incline Dumbbell Press", 3, "10-12"),
            WorkoutExercises("Lateral Raises", 4, "12-15"),
            WorkoutExercises("Cable Triceps Pushdowns", 3, "10-12"),
            WorkoutExercises("Triceps Extension", 3, "12-15"),
          ],
          "Pull": [
            WorkoutExercises("Conventional Deadlift", 4, "5-6"),
            WorkoutExercises("Weighted Pull-Ups", 4, "8-10"),
            WorkoutExercises("Chest-Supported Row", 3, "10-12"),
            WorkoutExercises("Face Pulls", 4, "12-15"),
            WorkoutExercises("Barbell Curls", 3, "10-12"),
            WorkoutExercises("Hammer Curls", 3, "12-15"),
          ],
          "Legs": [
            WorkoutExercises("Barbell Squats", 4, "6-8"),
            WorkoutExercises("Romanian Deadlifts", 4, "8-10"),
            WorkoutExercises("Leg Press", 3, "10-12"),
            WorkoutExercises("Leg Curls", 4, "12-15"),
            WorkoutExercises("Standing Calf Raises", 4, "12-15"),
            WorkoutExercises("Seated Calf Raises", 3, "15-20"),
          ],
          "Rest 1": [],
          "Push": [
            WorkoutExercises("Barbell Bench Press", 4, "6-8"),
            WorkoutExercises("Overhead Barbell Press", 3, "8-10"),
            WorkoutExercises("Incline Dumbbell Press", 3, "10-12"),
            WorkoutExercises("Lateral Raises", 4, "12-15"),
            WorkoutExercises("Cable Triceps Pushdowns", 3, "10-12"),
            WorkoutExercises("Triceps Extension", 3, "12-15"),
          ],
          "Pull": [
            WorkoutExercises("Conventional Deadlift", 4, "5-6"),
            WorkoutExercises("Weighted Pull-Ups", 4, "8-10"),
            WorkoutExercises("Chest-Supported Row", 3, "10-12"),
            WorkoutExercises("Face Pulls", 4, "12-15"),
            WorkoutExercises("Barbell Curls", 3, "10-12"),
            WorkoutExercises("Hammer Curls", 3, "12-15"),
          ],
          "Legs": [
            WorkoutExercises("Barbell Squats", 4, "6-8"),
            WorkoutExercises("Romanian Deadlifts", 4, "8-10"),
            WorkoutExercises("Leg Press", 3, "10-12"),
            WorkoutExercises("Leg Curls", 4, "12-15"),
            WorkoutExercises("Standing Calf Raises", 4, "12-15"),
            WorkoutExercises("Seated Calf Raises", 3, "15-20"),
          ],
        },
        workoutDescription:
            "A Push Pull Legs (PPL) workout split is a popular and effective training method that divides your workouts based on muscle group function"),
    WorkoutsData(
        workoutName: "nSuns 5/3/1",
        instructorName: "Jim Wendler",
        imageUrl: "images/nsuns-banner.jpeg",
        workouts: const [
          "Squat, Bench Press",
          "Deadlift, Overhead Press",
          "Rest",
          "Squat, Bench Press",
          "Deadlift, Overhead Press",
          "Rest",
          "Rest",
        ],
        exercises: {
          "Squat, Bench Press": [
            WorkoutExercises("Back Squat", 5, "5-3-1 scheme"),
            WorkoutExercises("Bench Press", 5, "5-3-1 scheme"),
            WorkoutExercises("Barbell Row", 4, "8-10"),
            WorkoutExercises("Triceps Pushdown", 4, "12-15"),
          ],
          "Deadlift, Overhead Press": [
            WorkoutExercises("Deadlift", 5, "5-3-1 scheme"),
            WorkoutExercises("Overhead Press", 5, "5-3-1 scheme"),
            WorkoutExercises("Chin-Ups", 4, "10-12"),
            WorkoutExercises("Face Pulls", 4, "12-15"),
          ],
          "Rest 1": [],
          "Squat, Bench Press": [
            WorkoutExercises("Back Squat", 5, "5-3-1 scheme"),
            WorkoutExercises("Bench Press", 5, "5-3-1 scheme"),
            WorkoutExercises("Barbell Row", 4, "8-10"),
            WorkoutExercises("Triceps Pushdown", 4, "12-15"),
          ],
          "Deadlift, Overhead Press": [
            WorkoutExercises("Deadlift", 5, "5-3-1 scheme"),
            WorkoutExercises("Overhead Press", 5, "5-3-1 scheme"),
            WorkoutExercises("Chin-Ups", 4, "10-12"),
            WorkoutExercises("Face Pulls", 4, "12-15"),
          ],
          "Rest 2": [],
          "Rest 3": [],
        },
        workoutDescription:
            "nSuns 5/3/1 is a popular strength training program known for its rapid progression and focus on compound lifts. It's a variation of Jim Wendler's 5/3/1 program, but with increased training frequency and volume."),
    WorkoutsData(
        workoutName: "Candito 6 week Program",
        instructorName: "Jonnie Candito",
        workouts: const [
          "Upper",
          "Lower",
          "Rest",
          "Upper",
          "Lower",
          "Rest",
          "Rest",
        ],
        imageUrl: "images/candito-banner.jpg",
        exercises: {
          "Upper": [
            WorkoutExercises("Bench Press", 4, "6-8"),
            WorkoutExercises("Overhead Press", 4, "8-10"),
            WorkoutExercises("Pull-Ups", 4, "10-12"),
            WorkoutExercises("Dumbbell Row", 4, "10-12"),
            WorkoutExercises("Bicep Curl", 3, "12-15"),
            WorkoutExercises("Triceps Pushdown", 3, "12-15"),
          ],
          "Lower": [
            WorkoutExercises("Squat", 4, "5-6"),
            WorkoutExercises("Romanian Deadlift", 4, "8-10"),
            WorkoutExercises("Leg Press", 4, "10-12"),
            WorkoutExercises("Leg Curl", 4, "12-15"),
            WorkoutExercises("Calf Raises", 4, "15-20"),
          ],
          "Rest 1": [],
          "Upper": [
            WorkoutExercises("Bench Press", 4, "6-8"),
            WorkoutExercises("Overhead Press", 4, "8-10"),
            WorkoutExercises("Pull-Ups", 4, "10-12"),
            WorkoutExercises("Dumbbell Row", 4, "10-12"),
            WorkoutExercises("Bicep Curl", 3, "12-15"),
            WorkoutExercises("Triceps Pushdown", 3, "12-15"),
          ],
          "Lower": [
            WorkoutExercises("Squat", 4, "5-6"),
            WorkoutExercises("Romanian Deadlift", 4, "8-10"),
            WorkoutExercises("Leg Press", 4, "10-12"),
            WorkoutExercises("Leg Curl", 4, "12-15"),
            WorkoutExercises("Calf Raises", 4, "15-20"),
          ],
          "Rest 2": [],
          "Rest 3": [],
        },
        workoutDescription:
            "The Candito 6-Week Strength Program is a popular intermediate-level program designed for increasing overall strength, particularly in the squat, bench press, and deadlift. It's known for its periodization scheme, which combines linear progression with undulating periodization, and its emphasis on submaximal volume to drive progress without excessive fatigue."),
  ];
}
