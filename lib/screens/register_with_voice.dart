import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:velora/screens/login_screen.dart';
import 'package:velora/screens/password_screen_student.dart';
import 'package:velora/screens/payment_screen.dart';

class RegisterScreenWithVoice extends StatefulWidget {
  @override
  _RegisterScreenWithVoiceState createState() => _RegisterScreenWithVoiceState();
}

class _RegisterScreenWithVoiceState extends State<RegisterScreenWithVoice> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _currentText = "";

  bool _isInitializing = true;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _familyNameController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _ortController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  Future<void> _initializeSpeech() async {
    _speech = stt.SpeechToText();
    bool available = await _speech.initialize();
    if (available) {
      setState(() {
        _isInitializing = false;
      });
    } else {
      setState(() {
        _isInitializing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Speech recognition initialization failed'))
      );
    }
  }

  Future<void> _startListening() async {
    if (await Permission.microphone.request().isGranted) {
      setState(() {
        _isListening = true;
      });
      _speech.listen(
        onResult: (val) => setState(() {
          _currentText = val.recognizedWords;
          
        }),
        listenFor: Duration(minutes: 1),
        localeId: 'en_US',
        onSoundLevelChange: (level) {
          // Optionally handle sound level change
        },
        cancelOnError: true,
        listenMode: stt.ListenMode.confirmation,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Microphone permission denied'))
      );
    }
  }

  void _stopListening() {
    setState(() {
      _isListening = false;
    });
    _speech.stop();
    print("Total Speech Text: $_currentText");
    _parseSpeechResult();
  }

  void _parseSpeechResult() {
    RegExp nameExp = RegExp(r"my name is ([a-zA-Z\s]+?) my", caseSensitive: false);
    RegExp familyNameExp = RegExp(r"my family name is ([a-zA-Z\s]+?) my", caseSensitive: false);
    RegExp streetExp = RegExp(r"my address is ([\w\s]+?) my", caseSensitive: false);
    RegExp ortExp = RegExp(r"my city is ([\w\s]+?) my", caseSensitive: false);
    RegExp zipCodeExp = RegExp(r"my zip code is (\d+)", caseSensitive: false);

    var nameMatch = nameExp.firstMatch(_currentText);
    var familyNameMatch = familyNameExp.firstMatch(_currentText);
    var streetMatch = streetExp.firstMatch(_currentText);
    var ortMatch = ortExp.firstMatch(_currentText);
    var zipCodeMatch = zipCodeExp.firstMatch(_currentText);

    if (nameMatch != null) {
      _firstNameController.text = nameMatch.group(1)?.trim() ?? "";
    }
    if (familyNameMatch != null) {
      _familyNameController.text = familyNameMatch.group(1)?.trim() ?? "";
    }
    if (streetMatch != null) {
      _streetController.text = streetMatch.group(1)?.trim() ?? "";
    }
    if (ortMatch != null) {
      _ortController.text = ortMatch.group(1)?.trim() ?? "";
    }
    if (zipCodeMatch != null) {
      _zipCodeController.text = zipCodeMatch.group(1) ?? "";
    }
  }



  @override
  void dispose() {
    _speech.stop();
    _firstNameController.dispose();
    _familyNameController.dispose();
    _streetController.dispose();
    _ortController.dispose();
    _zipCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0xFFFFF1FD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: _isInitializing
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                    ),
                    Text(
                      'Sign-Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      //backgroundImage: AssetImage('assets/profile_placeholder.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Let's setup the profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Upload Profile Pic',
                      style: TextStyle(
                        color: Color(0xFFBDBDBD),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _familyNameController,
                      decoration: InputDecoration(
                        labelText: 'Family Name',
                        labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _streetController,
                      decoration: InputDecoration(
                        labelText: 'Street',
                        labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _ortController,
                      decoration: InputDecoration(
                        labelText: 'Ort',
                        labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _zipCodeController,
                      decoration: InputDecoration(
                        labelText: 'ZIP Code',
                        labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: '+49',
                              labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Phone',
                              labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color(0xFFBDBDBD)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7C5DB0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreenStudent()));
                  },
                  child: Text(
                    'Click here to sign up as Helper',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 83,
                width: double.infinity,
                padding: EdgeInsets.all(5),
                color: Color(0xFF660055),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      _isListening ? Icons.mic : Icons.mic_none,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      if (_isListening) {
                        _stopListening();
                      } else {
                        _startListening();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
