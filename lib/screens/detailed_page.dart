import 'package:flutter/material.dart';
import 'package:velora/screens/map_screen.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        actions: [Icon(Icons.more_vert, color: Colors.black)],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/lisa.png'),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Lisa Bakker',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.purple, size: 16),
                              Text(
                                '5.0',
                                style: TextStyle(color: Colors.purple, fontSize: 16),
                              ),
                              Text(
                                ' 12 ratings',
                                style: TextStyle(color: Colors.purple, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Introduction', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      height: 70,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a brief introduction',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Personal Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        DetailChip(label: 'Age: 23'),
                        DetailChip(label: 'Lives in: Neuried'),
                        DetailChip(label: 'Student at: Technical University of Munich'),
                        DetailChip(label: 'Nationality: German'),
                        DetailChip(label: 'Born: Augsburg'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text('Velora History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HistoryCard(label: '12', sublabel: 'Tasks Done'),
                        HistoryCard(label: '4.9', sublabel: 'Rating'),
                        HistoryCard(label: '100%', sublabel: 'Success'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text('Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter reviews',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
                },
                child: Text('Accept Offer'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.purple, // Text color
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

class DetailChip extends StatelessWidget {
  final String label;

  const DetailChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label, style: TextStyle(color: Colors.purple)),
      backgroundColor: Colors.purple.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String label;
  final String sublabel;

  const HistoryCard({required this.label, required this.sublabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple)),
          SizedBox(height: 8),
          Text(sublabel, style: TextStyle(color: Colors.purple)),
        ],
      ),
    );
  }
}
