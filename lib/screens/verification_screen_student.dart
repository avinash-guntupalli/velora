import 'package:flutter/material.dart';
import 'package:velora/screens/student_welcome_screen.dart';

class VerificationScreenStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0xFFFFF1FD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.34,
                    top: 56,
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.75,
                    top: 40,
                    child: Container(
                      width: 62,
                      height: 62,
                      padding: const EdgeInsets.symmetric(horizontal: 10.33),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 223,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Attach Enrollment Certificate',
                          suffixIcon: Icon(Icons.attach_file, color: Color(0xFF7B5DB0)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 289,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Attach Identity Document',
                          suffixIcon: Icon(Icons.attach_file, color: Color(0xFF7B5DB0)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -15,
                    top: 144,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width + 31,
                      height: 34,
                      child: Text(
                        'Identity Verification',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.68),
                          fontSize: 17,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 21,
                    top: 574,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                        // Handle navigation or action on tap
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 42,
                        height: 54,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        decoration: ShapeDecoration(
                          color: Color(0xFF7C5DB0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Complete Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(color: Color(0xFF660055)),
                    ),
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
