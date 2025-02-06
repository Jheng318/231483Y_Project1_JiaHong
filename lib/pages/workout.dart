import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/data/users.dart';
import 'package:provider/provider.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/workoutData.dart';
import 'package:flutter_rating/flutter_rating.dart';

class OverviewPage extends StatefulWidget {
  final String workoutName;
  const OverviewPage({super.key, required this.workoutName});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  double rating = 0;
  final List<WorkoutsData> workoutPlans = workoutplans();
  final List<String> workoutDay = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtensions.gray,
      appBar: AppBar(
        foregroundColor: ColorExtensions.gray,
        backgroundColor: ColorExtensions.purple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OverviewPage(
                                workoutName: widget.workoutName,
                              )));
                },
                child: const Text(
                  "Overview",
                  style: TextStyle(color: ColorExtensions.gray, fontSize: 14),
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WorkoutPage()));
                },
                child: const Text(
                  "Workouts",
                  style: TextStyle(color: ColorExtensions.gray, fontSize: 14),
                )),
          ],
        ),
      ),
      body: Center(
        widthFactor: MediaQuery.of(context).size.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 165,
                child: Image.asset(
                    workoutPlans
                        .firstWhere(
                            (el) => el.workoutName == widget.workoutName)
                        .imageUrl,
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 30,
              ),
              Material(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    // Use RoundedRectangleBorder
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            "images/superhero.jpg",
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        workoutPlans
                            .firstWhere(
                                (el) => el.workoutName == widget.workoutName)
                            .instructorName,
                        style: const TextStyle(color: ColorExtensions.purple),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Material(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.workoutName,
                        style: const TextStyle(
                            color: ColorExtensions.purple, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Program Description",
                        style: TextStyle(color: ColorExtensions.purple),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        workoutPlans
                            .firstWhere(
                                (el) => el.workoutName == widget.workoutName)
                            .workoutDescription,
                        style: const TextStyle(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Program Schedule",
                        style: TextStyle(color: ColorExtensions.purple),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 120,
                        child: ListView.builder(
                          itemCount: workoutDay.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      workoutDay[index],
                                      style: const TextStyle(fontSize: 12),
                                    )),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    workoutPlans
                                        .firstWhere((el) =>
                                            el.workoutName ==
                                            widget.workoutName)
                                        .workouts[index],
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Rate this workout",
                  style: TextStyle(color: ColorExtensions.purple, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              StarRating(
                rating: rating,
                size: 40,
                filledIcon: Icons.star,
                halfFilledIcon: Icons.star_half,
                emptyIcon: Icons.star_outline,
                color: ColorExtensions.purple,
                borderColor: Colors.grey, // Color for empty icons
                onRatingChanged: (rating) =>
                    setState(() => this.rating = rating),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    if (!context
                        .read<UserModel>()
                        .getUser!
                        .favouriteWorkouts!
                        .contains(widget.workoutName)) {
                      context.read<UserModel>().addWorkout(widget.workoutName);
                    }
                    print("already in the favorite list");
                    // to add the workou ttitle to the list of workouts for that user
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorExtensions.purple,
                    foregroundColor: ColorExtensions.gray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                    ),
                  ),
                  child: const Text("Add To Favourites"),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorExtensions.black,
      ),
    );
  }
}
