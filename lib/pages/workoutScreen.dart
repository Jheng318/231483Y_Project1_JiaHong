import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/workoutData.dart';

// ... (Your other imports and classes)

class WorkoutPage extends StatelessWidget {
  final String workoutName;
  const WorkoutPage({super.key, required this.workoutName});

  @override
  Widget build(BuildContext context) {
    final List<WorkoutsData> workoutPlans = workoutplans();
    final currentWorkout = workoutPlans.firstWhere(
      (workout) => workout.workoutName == workoutName,
    );

    return Scaffold(
      backgroundColor: ColorExtensions.gray,
      appBar: AppBar(
          // ... (Your app bar code)
          ),
      body: Center(
        widthFactor: MediaQuery.sizeOf(context).width * 0.9,
        child: SingleChildScrollView(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: currentWorkout.workouts.length,
          itemBuilder: (context, index) {
            return currentWorkout.workouts[index] == "Rest"
                ? Container()
                : Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Theme(
                      // Wrap with Theme to customize ExpansionTile
                      data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent), // Remove divider
                      child: ExpansionTile(
                        title: Text(
                          currentWorkout.workouts[index],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: ColorExtensions.purple),
                        ),
                        iconColor: ColorExtensions.purple,
                        collapsedIconColor: ColorExtensions.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        childrenPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        backgroundColor: Colors.white,
                        collapsedBackgroundColor: Colors.white,
                        expandedCrossAxisAlignment: CrossAxisAlignment
                            .start, // Align children to the start
                        children: <Widget>[
                          Padding(
                            // Add padding around the description
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'This is a 7-day strength and size routine designed to help you achieve your fitness goals.',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          // Add your exercise list here dynamically
                          // Example:
                          ListView.builder(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(), // Important for nested ListView
                            itemCount:
                                3, // Replace with your dynamic exercise count
                            itemBuilder: (context, exerciseIndex) {
                              return ListTile(
                                leading: const Icon(
                                  Icons.fitness_center,
                                  color: ColorExtensions.purple,
                                ), // Add icon
                                title: const Text(
                                    "Exercise Name"), // Replace with dynamic exercise name
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                        "3 sets"), // Replace with dynamic sets
                                    const SizedBox(width: 16),
                                    const Text(
                                        "12 reps"), // Replace with dynamic reps
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
          },
        )),
      ),
    );
  }
}
