import 'package:flutter/material.dart';

class WorkoutScheduleScreen extends StatefulWidget {
  const WorkoutScheduleScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScheduleScreen> createState() => _WorkoutScheduleScreenState();
}

class _WorkoutScheduleScreenState extends State<WorkoutScheduleScreen> {
  // Sample workout data (replace with your actual data)
  final Map<String, List<Workout>> workouts = {
    'Day 1: Upper': [
      Workout('bench press', 3, 12),
      Workout('pull ups', 3, 'max'),
      Workout('dips', 3, 'max'),
    ],
    'Day 2: Upper': [
      Workout('barbell rows', 3, 10),
      Workout('seated cable rows', 3, 12),
    ],
    'Day 3: Upper': [
      Workout('overhead press', 3, 8),
      Workout('lateral raises', 3, 12),
    ],
    'Day 4: Upper': [
      Workout('incline dumbbell press', 3, 10),
      Workout('dumbbell curls', 3, 12),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text('Overview'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle "Workouts" button press
            },
            child: const Text(
              'Workouts',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        backgroundColor: const Color(0xFF6F42C1), // Purple app bar
      ),
      body: SingleChildScrollView(
        // For scrollable content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Workout Days
              ...workouts.entries.map((entry) {
                String day = entry.key;
                List<Workout> workoutList = entry.value;

                return ExpansionTile(
                  title: Text(day),
                  children: workoutList.map((workout) {
                    return ListTile(
                      title: Text(workout.exercise),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${workout.sets} sets'),
                          const SizedBox(width: 16),
                          Text('${workout.reps} reps'),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }).toList(),

              const SizedBox(height: 20),

              // Add to Favorites Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle "Add To Favorites" press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6F42C1), // Purple button
                  ),
                  child: const Text('Add To Favorites'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Workout {
  final String exercise;
  final int sets;
  final dynamic reps; // Can be int or String ('max')

  Workout(this.exercise, this.sets, this.reps);
}
