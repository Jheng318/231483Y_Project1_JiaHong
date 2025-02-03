class WorkoutsData {
  final String workoutName;
  final String instructorName;
  final String workoutDescription;
  final String imageUrl;
  final List<String> workouts;

  const WorkoutsData(
      {required this.workoutName,
      required this.instructorName,
      required this.workoutDescription,
      required this.imageUrl,
      required this.workouts});
}

List<WorkoutsData> workoutplans() {
  return [
    const WorkoutsData(
      workoutName: "The Beast Mode",
      instructorName: "Beastmaster Brock",
      workoutDescription:
          "The Beast Mode Strength/Size routine by doslifts is a 7 day workout plan. It is a intermediate level plan to achieve general fitness goals",
      workouts: [
        "Chest/Triceps",
        "Back/Biceps",
        "Legs",
        "Shoulders/Traps",
        "Cardio/Abs",
        "Rest",
        "Rest"
      ],
      imageUrl: "images/beast-mode-banner.jpg",
    ),
    const WorkoutsData(
        workoutName: "Push, Pull, Legs",
        instructorName: "Jeff Nippard",
        imageUrl: "images/ppl-jeff.jpg",
        workouts: [
          "Push",
          "Pull",
          "Legs",
          "Rest",
          "Push",
          "Pull",
          "Legs",
        ],
        workoutDescription:
            "A Push Pull Legs (PPL) workout split is a popular and effective training method that divides your workouts based on muscle group function"),
    const WorkoutsData(
        workoutName: "nSuns 5/3/1",
        instructorName: "Jim Wendler",
        imageUrl: "images/nsuns-banner.jpeg",
        workouts: [
          "Squat, Bench Press",
          "Deadlift, Overhead Press",
          "Rest",
          "Squat Bench Press",
          "Deadlift, Overhead Press",
          "Rest",
          "Rest",
        ],
        workoutDescription:
            "nSuns 5/3/1 is a popular strength training program known for its rapid progression and focus on compound lifts. It's a variation of Jim Wendler's 5/3/1 program, but with increased training frequency and volume."),
    const WorkoutsData(
        workoutName: "Candito 6 week Program",
        instructorName: "Jonnie Candito",
        workouts: [
          "Upper",
          "Lower",
          "Rest",
          "Lower",
          "Upper",
          "Rest",
          "Rest",
        ],
        imageUrl: "images/candito-banner.jpg",
        workoutDescription:
            "The Candito 6-Week Strength Program is a popular intermediate-level program designed for increasing overall strength, particularly in the squat, bench press, and deadlift. It's known for its periodization scheme, which combines linear progression with undulating periodization, and its emphasis on submaximal volume to drive progress without excessive fatigue."),
  ];
}
