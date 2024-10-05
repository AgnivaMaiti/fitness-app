import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Explore Workouts', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image Banner
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(12),
                    right: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/cc06c470415e0b66e580e753ccd395d9.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(12),
                      right: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Text(
                    'Best Quarantine Workout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Best for You Section
              Text(
                'Best for you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: MediaQuery.of(context).size.width < 400
                    ? 1
                    : 2, // Responsive to screen width
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: MediaQuery.of(context).size.width < 400
                    ? 3
                    : 2.5, // Adjust aspect ratio based on screen width
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildWorkoutCard('Belly fat burner', '10 min', 'Beginner',
                      'assets/2b2a163d3db57d4898c9a370dbb6e5c7.png'),
                  buildWorkoutCard('Lose Fat', '10 min', 'Beginner',
                      'assets/3f29ea1c17deb74c58f3f775fb2d9542.png'),
                  buildWorkoutCard('Plank', '5 min', 'Expert',
                      'assets/ba20f035adc783da72f22894d09729b9.png'),
                  buildWorkoutCard('Build Wide Chest', '30 min', 'Intermediate',
                      'assets/cb6fff5c27d57e26d0f6b9cf277bb560.jpeg'),
                ],
              ),
              SizedBox(height: 16),

              // Challenge Section
              Text(
                'Challenge',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8, // Adjust spacing between challenge cards
                runSpacing: 8,
                children: [
                  buildChallengeCard(
                      'Plank Challenge', Colors.lightGreen, context),
                  buildChallengeCard('Sprint Challenge', Colors.black, context),
                  buildChallengeCard(
                      'Squat Challenge', Colors.greenAccent, context),
                ],
              ),
              SizedBox(height: 16),

              // Fast Warmup Section
              Text(
                'Fast Warmup',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: buildWorkoutCard(
                        'Leg exercises',
                        '10 min',
                        'Beginner',
                        'assets/72ec8aa7fe1dcafdbef048cd0e96a3e1.png'),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: buildWorkoutCard(
                        'Backward lunges',
                        '5 min',
                        'Beginner',
                        'assets/8e2703d6a7227e9fef215f6abaa71662.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for building workout cards
  Widget buildWorkoutCard(
      String title, String time, String level, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
          right: Radius.circular(8),
        ),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2, // Ensure the image maintains a good aspect ratio
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(8),
                right: Radius.circular(8),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('$time • $level', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // Helper method for building challenge cards
  Widget buildChallengeCard(String title, Color bgColor, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cardSize = (width - 48) / 3;

    return Container(
      width:
          cardSize > 150 ? cardSize : 100, // Ensure cards don't shrink too much
      height: cardSize > 150 ? cardSize : 100,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
          right: Radius.circular(8),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: bgColor == Colors.black ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
