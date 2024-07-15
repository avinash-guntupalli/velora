// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final emailTextEditingController = TextEditingController();
//   final passwordTextEditingController = TextEditingController();
//   bool passwordVisible = false;
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     bool darkTheme = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           color: Color(0xFFFFF1FD),
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Stack(
//           children: [
//             Positioned(
//               left: 0,
//               top: 785,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 83,
//                 decoration: BoxDecoration(color: Color(0xFF660055)),
//               ),
//             ),
//             Positioned(
//               left: 170,
//               top: 799,
//               child: Container(
//                 width: 45,
//                 height: 40,
//                 child:  IconButton(
//                   icon: Icon(Icons.mic, color: Colors.white, size: 30,),
//                   onPressed: () {
//
//                     // place a microphone icon here ,
//                   },
//                 ),
//                 // place a microphone icon here ,
//
//
//
//
//
//
//                 // what is this flutter logo doing here
//                 //
//               ),
//             ),
//             Positioned(
//               left: 4,
//               top: 333,
//               child: SizedBox(
//                 width: 380,
//                 height: 39,
//                 child: Text(
//                   ' Please fill out the following information',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black.withOpacity(0.68),
//                     fontSize: 15,
//                     fontFamily: 'Comfortaa',
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 14,
//               top: 627,
//               child: SizedBox(
//                 width: 356,
//                 height: 34,
//                 child: Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Forgot your login details? ',
//                         style: TextStyle(
//                           color: Colors.black.withOpacity(0.68),
//                           fontSize: 13,
//                           fontFamily: 'Comfortaa',
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'Get help logging in',
//                         style: TextStyle(
//                           color: Color(0xFF7C5DB0),
//                           fontSize: 13,
//                           fontFamily: 'Comfortaa',
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 79,
//               top: 661,
//               child: SizedBox(
//                 width: 235,
//                 height: 38,
//                 child: Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Don’t have an account?',
//                         style: TextStyle(
//                           color: Colors.black.withOpacity(0.68),
//                           fontSize: 13,
//                           fontFamily: 'Comfortaa',
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       TextSpan(
//                         text: ' Sign up',
//                         style: TextStyle(
//                           color: Color(0xFF7C5DB0),
//                           fontSize: 15,
//                           fontFamily: 'Comfortaa',
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 16,
//               top: 396,
//               child: Container(
//                 width: 356,
//                 height: 50,
//                 child: TextFormField(
//                   controller: emailTextEditingController,
//                   decoration: InputDecoration(
//                     labelText: 'User name or phone number',
//                     labelStyle: TextStyle(
//                       color: Color(0xFFBDBDBD),
//                       fontSize: 16,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w500,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 16,
//               top: 467,
//               child: Container(
//                 width: 356,
//                 height: 50,
//                 child: TextFormField(
//                   controller: passwordTextEditingController,
//                   obscureText: !passwordVisible,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     labelStyle: TextStyle(
//                       color: Color(0xFFBDBDBD),
//                       fontSize: 16,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w500,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         passwordVisible ? Icons.visibility : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           passwordVisible = !passwordVisible;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 14,
//               top: 562,
//               child: GestureDetector(
//                 // _submit,
//                 child: Container(
//                   width: 356,
//                   height: 54,
//                   padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   decoration: ShapeDecoration(
//                     color: Color(0xFF7C5DB0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Log In',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 150,
//               top: 285,
//               child: Text(
//                 'Login',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF660056),
//                   fontSize: 28,
//                   fontFamily: 'Comfortaa',
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 40,
//               top: 526,
//               child: SizedBox(
//                 width: 332,
//                 height: 34,
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 18,
//                       height: 18,
//                       decoration: ShapeDecoration(
//                         color: Color(0xFFF6F6F6),
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(width: 1, color: Color(0xFFE7E7E7)),
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       'Stay signed in',
//                       style: TextStyle(
//                         color: Color(0xFF666666),
//                         fontSize: 14,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 88,
//               top: 49,
//               child: Container(
//                 width: 208,
//                 height: 178,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(darkTheme ? 'images/velora.png' : 'images/velora.png'),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  bool passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

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
                            TextSpan(
                              text: ' Sign up',
                              style: TextStyle(
                                color: Color(0xFF7C5DB0),
                                fontSize: 15,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
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
                      icon: Icon(Icons.mic, color: Colors.white, size: 30),
                      onPressed: () {
                        // Add your microphone functionality here
                      },
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

