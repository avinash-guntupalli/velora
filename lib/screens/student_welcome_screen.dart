import 'package:flutter/material.dart';
import 'package:velora/screens/elder_details_screen.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDEBF7),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                Spacer(),
                Icon(Icons.more_vert),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Your ongoing tasks',
              style: TextStyle(
                color: Color(0xFF775D96),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            TaskCard(
              imageUrl: 'images/profile1.png', // Replace with your image asset
              title: 'Grocery Support',
              distance: '50 m away',
              address: 'Arcisstraße, 80333',
              buttonText: 'Details',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Available tasks',
              style: TextStyle(
                color: Color(0xFF775D96),
                fontSize: 18,
              ),
            ),
            Text(
              'There are 46 tasks nearby',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10),
            TaskCard(
              imageUrl: 'images/profile2.png', // Replace with your image asset
              title: 'Medicine Pick-up',
              distance: '200 m away',
              address: 'Barer Straße, 80333',
              buttonText: 'Offer',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(title: 'Medicine Pick-up')),
                );
              },
            ),
            SizedBox(height: 10),
            TaskCard(
              imageUrl: 'images/profile3.png', // Replace with your image asset
              title: 'Bags Carriage',
              distance: '250 m away',
              address: 'Schellingstraße, 80799',
              buttonText: 'Offer',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(title: 'Bags Carriage')),
                );
              },
            ),
            SizedBox(height: 10),
            TaskCard(
              imageUrl: 'images/profile4.png', // Replace with your image asset
              title: 'Navigation Support',
              distance: '350 m away',
              address: 'Luisenstraße, 80333',
              buttonText: 'Offer',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(title: 'Navigation Support')),
                );
              },
            ),
            Spacer(),

          ],
        ),
      ),

      // i need just home button in the bottom navigation bar
      bottomNavigationBar: Container(
        color: Color(0xFF5B0060),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white, size:30),
              onPressed: () {
                // Handle button press
              },
            ),
          ],
        ),
      ),
    );


  }
}

class TaskCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String distance;
  final String address;
  final String buttonText;
  final VoidCallback onPressed;

  TaskCard({
    required this.imageUrl,
    required this.title,
    required this.distance,
    required this.address,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 30,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(distance),
                  Text(address),
                  TextButton(
                    onPressed: onPressed,
                    child: Text(buttonText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;

  DetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details for $title'),
      ),
    );
  }
}