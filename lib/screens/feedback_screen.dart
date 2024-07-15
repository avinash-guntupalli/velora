import 'package:flutter/material.dart';
class FeedbackScreen extends StatelessWidget {
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
                  'Feedback',
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
            Center(
              child: Text(
                'Would you like to mark \nthe task as Done?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF775D96),
                  fontSize: 18, fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  FeedbackOption(
                    icon: Icons.thumb_up,
                    color: Colors.green,
                    text: 'Yes, all went well',


                  ),
                  SizedBox(height: 10),
                  FeedbackOption(
                    icon: Icons.thumb_down,
                    color: Colors.red,
                    text: 'No, I still need help',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Rate your experience',
                style: TextStyle(
                  color: Color(0xFF775D96),
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return Icon(
                    index < 4 ? Icons.star : Icons.star_border,
                    color: Colors.yellow.shade700,
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your comments here or use microphone',
              ),
              maxLines: 2,
            ),
            Spacer(),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 40,), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.mic, size: 40,), label: ''),
        ],
        backgroundColor: Color(0xFF5B0060),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );

  }
}

class FeedbackOption extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  FeedbackOption({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Icon(icon, color: color, size: 32),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}