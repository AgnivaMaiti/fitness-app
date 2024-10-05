import 'package:flutter/material.dart';
import '../widgets/workout_card.dart';
import '../widgets/today_plan_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy workout data
    final workoutList = [
      {
        'title': 'Lower Body Training',
        'duration': '50 Min',
        'calories': '500 Kcal',
        'imageUrl': 'assets/cd9933411c6b5eaf08283408f5361651.jpeg',
      },
      {
        'title': 'Upper Body Training',
        'duration': '45 Min',
        'calories': '450 Kcal',
        'imageUrl': 'assets/demetrious-johnson-exercise-dumbbell.jpg',
      },
      // Add more workout entries as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning 🔥',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Agniva Maiti',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Popular Workouts',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Horizontal List of Workout Cards
              Container(
                height: 180, // Set a fixed height for the cards
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      workoutList.length, // Based on the dummy workout data
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: WorkoutCard(
                        title: workoutList[index]['title']!,
                        duration: workoutList[index]['duration']!,
                        calories: workoutList[index]['calories']!,
                        imageUrl: workoutList[index]['imageUrl']!,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Today Plan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TodayPlanCard(),
            ],
          ),
        ),
      ),
    );
  }
}
