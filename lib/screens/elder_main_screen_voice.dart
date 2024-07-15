import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:velora/screens/explain_task.dart';
import 'package:velora/screens/explain_task_map.dart';

class ElderMainscreenVoice extends StatefulWidget {
  @override
  _ElderMainscreenVoiceState createState() => _ElderMainscreenVoiceState();
}

class _ElderMainscreenVoiceState extends State<ElderMainscreenVoice> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  void _initializeSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        print('Speech status: $status');
      },
      onError: (errorNotification) {
        print('Speech error: $errorNotification');
      },
    );
    if (available) {
      setState(() => _isListening = true);
      _startListening();
    } else {
      print('Speech recognition is not available');
    }
  }

  void _startListening() {
    _speech.listen(
      onResult: (result) {
        setState(() {
          _text = result.recognizedWords.toLowerCase();
        });
        if (_text.contains('groceries')) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExplainTaskMap()),
          );
        }
      },
    );
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  @override
  void dispose() {
    _speech.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2D4D4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        // Handle back button press
                      },
                    ),
                    Spacer(),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Spacer(),
                    Container(width: 40), // To balance the back button
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Post a task',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 20),

              // First row of task categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildTaskCategory(
                    context,
                    'Groceries',
                    Icons.shopping_cart,
                    Color(0xFF5AFF9C),
                    ExplainTaskMap(),
                  ),
                  buildTaskCategory(
                    context,
                    'Pickup',
                    Icons.delivery_dining,
                    Color(0xFFFF5AD1),
                    ExplainTaskMap(),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Second row of task categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildTaskCategory(
                    context,
                    'Navigation',
                    Icons.navigation,
                    Color(0xFFFFE55A),
                    ExplainTask(),
                  ),
                  buildTaskCategory(
                    context,
                    'Tech',
                    Icons.computer,
                    Color(0xFF5AFFFF),
                    ExplainTaskMap(),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Third row of task categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildTaskCategory(
                    context,
                    'Medical',
                    Icons.local_hospital,
                    Color(0xFFFF5A5A),
                    ExplainTaskMap(),
                  ),
                  buildTaskCategory(
                    context,
                    'Carriage',
                    Icons.directions_car,
                    Color(0xFF8FFF5A),
                    ExplainTaskMap(),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Container for "Another Task"
              buildTaskCategory(
                context,
                'Another Task',
                Icons.add,
                Color(0xFF5AFF9C),
                ExplainTaskMap(),
              ),

              SizedBox(height: 60),

              // Bottom row of navigation icons
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildNavigationIcon(context, Icons.home, Color(0xFF660056)),
                    GestureDetector(
                      onTap: () {
                        if (_isListening) {
                          _stopListening();
                        } else {
                          _startListening();
                        }
                      },
                      child: Container(
                        height: 80,
                        width: (MediaQuery.of(context).size.width - 5) / 2,
                        decoration: BoxDecoration(
                          color: Color(0xFF660056),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          _isListening ? Icons.mic_off : Icons.mic,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTaskCategory(BuildContext context, String title, IconData icon, Color color, Widget destination) {
    return Container(
      height: 150,
      width: 150,
      child: GestureDetector(
        onTap: () {
          if (destination != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
          }
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.black,
                size: 40,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavigationIcon(BuildContext context, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Handle navigation based on the icon tapped (if needed)
      },
      child: Container(
        height: 80,
        width: (MediaQuery.of(context).size.width - 5) / 2,
        decoration: BoxDecoration(
          color: Color(0xFF660056),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
