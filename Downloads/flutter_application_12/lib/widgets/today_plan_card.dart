import 'package:flutter/material.dart';

class TodayPlanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWorkoutCard(
          context,
          'assets/b4c1f6bb0bf626d57331b346fd1b4c32.jpeg',
          'Push Up',
          '100 Push Ups a Day',
          'Intermediate',
          0.45,
        ),
        SizedBox(height: 10),
        _buildWorkoutCard(
          context,
          'assets/c0e2222a665e1974643e7b4742092b41.jpeg',
          'Sit Up',
          '20 Sit Ups a Day',
          'Beginner',
          0.79,
        ),
        SizedBox(height: 10),
        _buildWorkoutCard(
          context,
          'assets/0fdac9c3f99b55fd4cb0457f522ce3ff.jpeg',
          'Knee Push Up',
          '50 Knee Push Ups',
          'Beginner',
          0.60,
        ),
      ],
    );
  }

  Widget _buildWorkoutCard(BuildContext context, String imagePath, String title,
      String subtitle, String level, double progress) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
            SizedBox(height: 6),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
          ],
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            level,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
