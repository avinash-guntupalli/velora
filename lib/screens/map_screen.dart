import 'package:flutter/material.dart';
import 'package:velora/screens/feedback_screen.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/map1.png', // Replace with your static map image
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: 50,
            left: 15,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
          Positioned(
            top: 50,
            left: 60,
            child: Text(
              'Status',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 300,
            left: 80,
            child: CircleAvatar(
              backgroundImage: AssetImage('images/lisa.png'), // Replace with actual image asset
              radius: 20,
            ),
          ),
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: Container(
              // Border should be black
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('images/lisa.png'), // Replace with actual image asset
                    radius: 30,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Lisa Bakker',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('5 min away'),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.call, color: Colors.green, size: 50),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          // Adding a button above the bottom navigation bar
          Positioned(
            bottom: 30, // Adjust this value as needed
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackScreen())
                );

                // Button action
              },
              child: Text('Completed Task'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),

                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: ''),
        ],
        backgroundColor: Color(0xFF5B0060),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
