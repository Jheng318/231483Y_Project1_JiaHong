class Workouts {
  final String workoutName;
  final String instructorName;
  final String categoryTag;
  final String imageUrl;
  final double rating;

  const Workouts(
      {required this.workoutName,
      required this.instructorName,
      required this.categoryTag,
      required this.imageUrl,
      required this.rating});
}

List<Workouts> workoutplans() {
  return [
    const Workouts(
        workoutName: "The Beast Mode",
        instructorName: "Beastmaster Brock",
        rating: 4.8,
        imageUrl: "images/beast-mode.jpg",
        categoryTag: "Powerlifting"),
    const Workouts(
        workoutName: "Push, Pull, Legs",
        instructorName: "Jeff Nippard",
        rating: 4.5,
        imageUrl: "images/push-pull-leg.webp",
        categoryTag: "BodyBuilding"),
    const Workouts(
        workoutName: "nSuns 5/3/1",
        instructorName: "Jim Wendler",
        rating: 4.3,
        imageUrl: "images/nsuns.png",
        categoryTag: "Powerlifting"),
    const Workouts(
        workoutName: "Candito 6 week Program",
        instructorName: "Jonnie Candito",
        rating: 4.45,
        imageUrl: "images/candito.webp",
        categoryTag: "Powerlifting"),
  ];
}
