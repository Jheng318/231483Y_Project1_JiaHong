import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/users.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiahong_mad_project/pages/workout.dart';
import 'package:jiahong_mad_project/data/workouts.dart';
import 'favourite.dart';
import 'profile.dart';
import 'aboutus.dart';

class HomePage extends StatefulWidget {
  final User? data;
  const HomePage({super.key, this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Workouts> workouts = workoutplans();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtensions.gray,
      body: Center(
        widthFactor: MediaQuery.of(context).size.width * 0.9,
        child: Container(
          // to switch the screen/page of the
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorExtensions.purple,
        unselectedItemColor: ColorExtensions.gray,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svgs/discover_icon.svg"),
              label: "Discover",
              backgroundColor: ColorExtensions.purple),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svgs/heart_icon.svg"),
              label: "Favorites",
              backgroundColor: ColorExtensions.purple),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svgs/profile_icon.svg"),
              label: "profile",
              backgroundColor: ColorExtensions.purple),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svgs/information_icon.svg"),
              label: "About Us",
              backgroundColor: ColorExtensions.purple),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorExtensions.gray,
        onTap: _onItemTapped,
      ),
    );
  }

  late final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(workouts: workouts),
    const FavouriteScreen(),
    const ProfileScreen(),
    const AboutusPage(),
  ];
}

class HomeScreen extends StatelessWidget {
  final List<Workouts> workouts;
  const HomeScreen({super.key, required this.workouts});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Fit&Me",
          style: TextStyle(color: ColorExtensions.purple, fontSize: 24),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (BuildContext context, int index) {
              final workout = workouts[index];
              return Card(
                  elevation: 4.0,
                  color: ColorExtensions.gray,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OverviewPage(
                                  workoutName: workout.workoutName)));
                    },
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
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              workout.workoutName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(workout.instructorName),
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
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: ColorExtensions.black),
                                Text(workout.rating.toString())
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ));
            },
          ),
        )
      ],
    );
  }
}
