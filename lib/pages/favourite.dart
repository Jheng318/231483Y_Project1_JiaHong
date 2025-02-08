import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/workouts.dart';
import 'package:jiahong_mad_project/data/users.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    var userFavouriteList =
        context.read<UserModel>().getUser?.favouriteWorkouts;
    final List<Workouts> workoutPlans = workoutplans();
    return Scaffold(
      backgroundColor: ColorExtensions.gray,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Favorited Workouts",
                style: TextStyle(
                    color: ColorExtensions.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                  itemCount: userFavouriteList?.length,
                  itemBuilder: (context, index) {
                    final workoutName = userFavouriteList![index];
                    final workout = workoutPlans
                        .firstWhere((el) => el.workoutName == workoutName);
                    return Card(
                      elevation: 4.0,
                      color: ColorExtensions.gray,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(workout.imageUrl),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                workoutName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorExtensions.purple),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 58,
                                height: 18,
                                decoration: BoxDecoration(
                                    color: ColorExtensions.purple,
                                    borderRadius: BorderRadius.circular(4)),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  workout.categoryTag,
                                  style: const TextStyle(
                                      color: ColorExtensions.gray, fontSize: 8),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                context
                                    .read<UserModel>()
                                    .removeWorkout(workoutName);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Workout Removed')),
                                );
                              },
                              child: const Text("Remove")),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
