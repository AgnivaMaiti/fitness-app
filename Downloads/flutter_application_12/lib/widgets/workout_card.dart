import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String duration;
  final String calories;
  final String imageUrl;

  WorkoutCard({
    required this.title,
    required this.duration,
    required this.calories,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          // Image background
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              width: 220, // Make the card more rectangular
              height: 250, // Increase the height for a more rectangular shape
              fit: BoxFit.cover,
            ),
          ),
          // Workout details over the image (title, calories, and duration)
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Adjusted title position to be a little higher
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                // Calories and Duration stacked on top of each other
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Calories in a white rounded rectangular box
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white, // White background for the box
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.local_fire_department,
                              size: 16, color: Colors.black),
                          SizedBox(width: 4),
                          Text(
                            calories,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    // Duration in a white rounded rectangular box
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white, // White background for the box
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.timer, size: 16, color: Colors.black),
                          SizedBox(width: 4),
                          Text(
                            duration,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
