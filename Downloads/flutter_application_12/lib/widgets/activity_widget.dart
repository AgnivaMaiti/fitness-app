import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green.withOpacity(0.2),
            child: Icon(Icons.directions_run, color: Colors.green),
          ),
          title: Text("Push Up"),
          subtitle: Text("100 Push-up a day"),
          trailing: Text("45%"),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green.withOpacity(0.2),
            child: Icon(Icons.directions_walk, color: Colors.green),
          ),
          title: Text("Sit Up"),
          subtitle: Text("20 Sit Up a day"),
          trailing: Text("60%"),
        ),
      ],
    );
  }
}
