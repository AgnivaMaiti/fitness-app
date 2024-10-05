import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    List<DateTime> dates = List.generate(
      33,
      (index) => today.subtract(Duration(days: 2)).add(Duration(days: index)),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat('MMMM yyyy').format(today),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                separatorBuilder: (context, index) => SizedBox(width: 4),
                itemBuilder: (context, index) {
                  bool isToday = dates[index].day == today.day &&
                      dates[index].month == today.month &&
                      dates[index].year == today.year;
                  return _buildCalendarTile(isToday, dates[index]);
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Today Report',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildReportCard(
                    title: 'Active Calories',
                    data: '645 Cal',
                    color: Colors.grey[200]!,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildTrainingTimeCard(),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildCyclingReport(),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildLargeReportCard(
                    title: 'Heart Rate',
                    icon: Icons.favorite,
                    data: '79 Bpm',
                    color: Colors.red[50]!,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildLargeReportCard(
                    title: 'Steps',
                    icon: Icons.directions_walk,
                    data: '999/2000',
                    color: Colors.orange[100]!,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildLargeReportCard(
                    title: 'Sleep',
                    icon: Icons.bedtime,
                    data: '',
                    color: Colors.purple[50]!,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildLargeReportCard(
                    title: 'Water',
                    icon: Icons.water,
                    data: '6/8 Cups',
                    color: Colors.blue[50]!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarTile(bool isToday, DateTime date) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isToday ? Colors.black : Colors.green[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            DateFormat('E').format(date),
            style: TextStyle(
              fontSize: 16,
              color: isToday ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            date.day.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isToday ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportCard(
      {required String title, required String data, required Color color}) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              data,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrainingTimeCard() {
    return Card(
      color: Colors.grey[200]!,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Training Time',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 8.0,
              percent: 0.8,
              center: Text(
                "80%",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              progressColor: const Color.fromRGBO(164, 138, 237, 1),
              backgroundColor: Colors.grey[200]!,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCyclingReport() {
    return Card(
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Cycling',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/a8036b4fcdcc34621761cd166b92e596.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLargeReportCard({
    required String title,
    required IconData icon,
    required String data,
    required Color color,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            if (data.isNotEmpty) ...[
              SizedBox(height: 8),
              Text(
                data,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
