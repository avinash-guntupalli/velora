import 'package:flutter/material.dart';
import 'package:velora/screens/verification_screen_student.dart';

class PasswordScreenStudent extends StatelessWidget {
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
                      'Sign-Up',
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
                    left: 22,
                    top: 37,
                    child: Container(
                      width: 62,
                      height: 62,
                      padding: const EdgeInsets.all(12.92),
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
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Create password',
                          suffixText: 'Show',
                          suffixStyle: TextStyle(
                            color: Color(0xFF7B5DB0),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
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
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm password',
                          suffixText: 'Show',
                          suffixStyle: TextStyle(
                            color: Color(0xFF7B5DB0),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
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
                        'Create your Password',
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
                  // Positioned(
                  //   left: 94,
                  //   top: 723,
                  //   child: Container(
                  //     width: 30,
                  //     height: 30,
                  //     decoration: ShapeDecoration(
                  //       color: Color(0xFF7C5DB0),
                  //       shape: OvalBorder(
                  //         side: BorderSide(width: 1, color: Color(0xFF7C5DB0)),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 177,
                  //   top: 723,
                  //   child: Container(
                  //     width: 30,
                  //     height: 30,
                  //     decoration: ShapeDecoration(
                  //       color: Color(0xFF7C5DB0),
                  //       shape: OvalBorder(),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 260,
                  //   top: 723,
                  //   child: Container(
                  //     width: 30,
                  //     height: 30,
                  //     decoration: ShapeDecoration(
                  //       color: Color(0xFF7C5DB0),
                  //       shape: OvalBorder(),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: MediaQuery.of(context).size.width / 2 - 41.5,
                  //   top: 738.27,
                  //   child: Container(
                  //     width: 83,
                  //     decoration: ShapeDecoration(
                  //       shape: RoundedRectangleBorder(
                  //         side: BorderSide(
                  //           width: 3,
                  //           strokeAlign: BorderSide.strokeAlignCenter,
                  //           color: Color(0xFF7C5DB0),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 162,
                  //   top: 698,
                  //   child: SizedBox(
                  //     width: 59,
                  //     height: 18,
                  //     child: Text(
                  //       'Payment Method',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //         color: Color(0xFF7C5DB0),
                  //         fontSize: 10,
                  //         fontFamily: 'Comfortaa',
                  //         fontWeight: FontWeight.w700,
                  //         height: 0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 242,
                  //   top: 698,
                  //   child: SizedBox(
                  //     width: 72,
                  //     height: 18,
                  //     child: Text(
                  //       'Password & Complete',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //         color: Color(0xFF7C5DB0),
                  //         fontSize: 10,
                  //         fontFamily: 'Comfortaa',
                  //         fontWeight: FontWeight.w700,
                  //         height: 0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 80,
                  //   top: 698,
                  //   child: SizedBox(
                  //     width: 59,
                  //     height: 18,
                  //     child: Text(
                  //       'Personal Info',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //         color: Color(0xFF7C5DB0),
                  //         fontSize: 10,
                  //         fontFamily: 'Comfortaa',
                  //         fontWeight: FontWeight.w700,
                  //         height: 0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    left: 21,
                    top: 574,
                    child: GestureDetector(
                      onTap: () {

                        Navigator.push(context,MaterialPageRoute(builder: (c) => VerificationScreenStudent()));
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
            'Next',
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
                  // Positioned(
                  //   left: 110,
                  //   top: 738,
                  //   child: Container(
                  //     width: 83,
                  //     decoration: ShapeDecoration(
                  //       shape: RoundedRectangleBorder(
                  //         side: BorderSide(
                  //           width: 3,
                  //           strokeAlign: BorderSide.strokeAlignCenter,
                  //           color: Color(0xFF7C5DB0),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    left: 0,
                    bottom:0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(color: Color(0xFF660055)),
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
                  // Positioned(
                  //   left: MediaQuery.of(context).size.width / 2 - 22.5,
                  //   bottom: 2, // Adjusted value
                  //   child: Container(
                  //     width: 45,
                  //     height: 40,
                  //     clipBehavior: Clip.antiAlias,
                  //     decoration: BoxDecoration(),
                  //     // child: Icon(
                  //     //   Icons.mic,
                  //     //   color: Colors.white,
                  //     //   size: 30,
                  //     // ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
