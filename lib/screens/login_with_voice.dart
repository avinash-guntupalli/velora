import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:velora/screens/register_screen_final.dart';
import 'package:velora/screens/register_with_voice.dart';
import 'register_screen.dart'; // Import the register screen

class LoginScreenVoice extends StatefulWidget {
  const LoginScreenVoice({Key? key}) : super(key: key);

  @override
  State<LoginScreenVoice> createState() => _LoginScreenVoiceState();
}

class _LoginScreenVoiceState extends State<LoginScreenVoice> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  bool passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _command = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done') {
          _stopListening();
        }
      },
      onError: (error) => print('Error: $error'),
    );
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(onResult: (result) {
        setState(() {
          _command = result.recognizedWords;
          print('Command: $_command');
          if (_command.toLowerCase().contains('sign up')) {
            _navigateToRegister();
          }
        });
      });
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreenFinal()), // Navigate to RegisterScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFFF1FD),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 50),
                    Center(
                      child: Container(
                        width: 208,
                        height: 178,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(darkTheme ? 'images/velora.png' : 'images/velora.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF660056),
                          fontSize: 28,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Please fill out the following information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.68),
                        fontSize: 15,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailTextEditingController,
                      decoration: InputDecoration(
                        labelText: 'User name or phone number',
                        labelStyle: TextStyle(
                          color: Color(0xFFBDBDBD),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordTextEditingController,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color(0xFFBDBDBD),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: false, // you can add functionality here
                          onChanged: (value) {},
                        ),
                        Text(
                          'Stay signed in',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // Add your submit functionality here
                      },
                      child: Container(
                        width: double.infinity,
                        height: 54,
                        decoration: ShapeDecoration(
                          color: Color(0xFF7C5DB0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Forgot your login details? ',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.68),
                                fontSize: 13,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'Get help logging in',
                              style: TextStyle(
                                color: Color(0xFF7C5DB0),
                                fontSize: 13,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don’t have an account?',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.68),
                                fontSize: 13,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            // TextSpan(
                            //   text: ' Sign up',
                            //   style: TextStyle(
                            //     color: Color(0xFF7C5DB0),
                            //     fontSize: 15,
                            //     fontFamily: 'Comfortaa',
                            //     fontWeight: FontWeight.w700,
                            //   ),
                            //   recognizer: TapGestureRecognizer()
                            //     ..onTap = () {
                            //       _navigateToRegister();
                            //     },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _navigateToRegister,
                        child: Text('Sign Up'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Color(0xFF7C5DB0), // foreground (text) color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100), // To make space for the mic container
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 83,
                  decoration: BoxDecoration(
                    color: Color(0xFF660055),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(_isListening ? Icons.mic : Icons.mic_none, color: Colors.white, size: 30),
                      onPressed: _isListening ? _stopListening : _startListening,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
