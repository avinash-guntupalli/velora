import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt; // Add speech_to_text import
import 'package:velora/screens/offers_page.dart'; // Adjust path as per your project structure

class ExplainTaskMap extends StatefulWidget {
  @override
  _ExplainTaskMapState createState() => _ExplainTaskMapState();
}

class _ExplainTaskMapState extends State<ExplainTaskMap> {

  TextEditingController _taskExplanationController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  LatLng? _currentLocation;
  String _meetingAddress = '';
  String _taskExplanation = ''; // Store the speech recognized text
  bool _isListening = false;
  stt.SpeechToText _speech = stt.SpeechToText();

  @override
  void initState() {
    super.initState();
    _initSpeechToText();
    _getCurrentLocation();
  }

  void _initSpeechToText() {
    _speech.initialize(
      onError: (error) => print('Error: $error'),
      onStatus: (status) => print('Status: $status'),
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });

      // Fetch address from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(_currentLocation!.latitude, _currentLocation!.longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        setState(() {
          _meetingAddress = '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';
        });
      }

      // Animate the camera to the current location
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLng(_currentLocation!));
    } catch (e) {
      print("Error getting current location: $e");
      // Default to a location (e.g., London) if location services are disabled or permissions are not granted
      setState(() {
        _currentLocation = LatLng(51.5, -0.09); // Default to a location (e.g., London)
        _meetingAddress = 'London, UK'; // Default address
      });
    }
  }

  void _startListening() {
    _speech.listen(
      onResult: (result) {
        setState(() {
          _taskExplanation = result.recognizedWords;
          _taskExplanationController.text = _taskExplanation;
          print('Listening result: $_taskExplanation'); // Update controller text
        });
      },
    );
    setState(() {
      _isListening = true;
    });
  }

  void _stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
      _taskExplanationController.text = _taskExplanation;
      print('Stop listening: $_taskExplanation'); // Update controller text
    });
  }

  @override
  void dispose() {
    _speech.cancel();
    super.dispose();
  }

  Color _micColor() {
    return _isListening ? Colors.red : Colors.white;
  }

  void _navigateToHome() {
    // Implement navigation logic for the home button here
    // For example:
    Navigator.push(context, MaterialPageRoute(builder: (context) => OffersPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFF1FD),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Groceries', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Explain the Task',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF660056)),
                  ),
                ),
                maxLines: 3,
                controller: _taskExplanationController,
              ),
              SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: _meetingAddress),
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Meeting Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF660056)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Handle tap to expand map
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenMap(_currentLocation)));
                },
                child: Container(
                  height: 300, // Adjust height as needed
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation ?? LatLng(51.5, -0.09),
                      zoom: 15.0, // Adjust zoom level as needed
                    ),
                    markers: _currentLocation != null ? Set<Marker>.from([
                      Marker(
                        markerId: MarkerId('currentLocation'),
                        position: _currentLocation!,
                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                      ),
                    ]) : Set<Marker>(),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Type of Task'),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 'One-Time',
                            groupValue: 'taskType',
                            onChanged: (value) {},
                          ),
                          Text('One-Time'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'Recurring',
                            groupValue: 'taskType',
                            onChanged: (value) {},
                          ),
                          Text('Recurring'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Time of Task'),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 'Now',
                            groupValue: 'taskTime',
                            onChanged: (value) {},
                          ),
                          Text('Now'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'Later',
                            groupValue: 'taskTime',
                            onChanged: (value) {},
                          ),
                          Text('Later'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Budget',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Duration',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text('€15-21 suggested based on similar tasks posted', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OffersPage()));
                },
                child: Text('Post the Task', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), backgroundColor: Color(0XFF7C5DB0),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0XFF660056),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                setState(() {
                  if (!_isListening) {
                    _startListening();
                  } else {
                    _stopListening();
                  }
                });
              },
              child: Icon(Icons.mic, color: _micColor(), size: 30,),
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            _navigateToHome();
          }
        },
      ),
    );
  }
}
