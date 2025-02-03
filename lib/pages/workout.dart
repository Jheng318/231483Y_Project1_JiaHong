import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/workoutData.dart';

class OverviewPage extends StatefulWidget {
  final String workoutName;
  const OverviewPage({super.key, required this.workoutName});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final List<WorkoutsData> workoutPlans = workoutplans();
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
        ), // Or your title
        // actions: [
        //   TextButton(
        //     child: const Text(
        //       "Workouts",
        //       style: TextStyle(color: ColorExtensions.gray),
        //     ),
        //     onPressed: () {
        //       print("workouts is being pressed");
        //     },
        //   ),
        // ],
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
                  height: 500,
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
                        "Program Description",
                        style: TextStyle(color: ColorExtensions.purple),
                      ),
                    ],
                  ),
                ),
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
