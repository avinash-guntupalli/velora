import 'package:flutter/material.dart';
import 'package:velora/screens/password_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';


class PaymentScreenPhoto extends StatefulWidget {
  @override
  _PaymentScreenPhotoState createState() => _PaymentScreenPhotoState();
}

class _PaymentScreenPhotoState extends State<PaymentScreenPhoto> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cardHolderNameController = TextEditingController();

  Future<void> scanCard() async {
    if (await Permission.camera.request().isGranted) {
      var cardDetails = await CardScanner.scanCard(
        scanOptions: CardScanOptions(
          scanCardHolderName: true,
        ),
      );

      print('Card details: $cardDetails');

      if (cardDetails != null) {
        setState(() {
          _cardNumberController.text = cardDetails.cardNumber;
          _expiryDateController.text = cardDetails.expiryDate;
          _cardHolderNameController.text = cardDetails.cardHolderName;
        });
      }
    } else {
      // Handle if camera permission is denied
      print('Camera permission is denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/card_1.png'), context);
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
                    left: 16,
                    top: 56,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.35,
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
                    left: MediaQuery.of(context).size.width * 0.35,
                    top: 90,
                    child: Text(
                      'Add your card details',
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
                  Positioned(
                    left: 19,
                    top: 193,
                    child: SizedBox(
                      width: 137,
                      height: 23,
                      child: Text(
                        'Name on Card',
                        style: TextStyle(
                          color: Color(0xFF7B5DB0),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 19,
                    top: 221,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 38, // Adjusted width
                      height: 50,
                      child: TextField(
                        controller: _cardHolderNameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 19,
                    top: 298,
                    child: SizedBox(
                      width: 137,
                      height: 23,
                      child: Text(
                        'Card Number',
                        style: TextStyle(
                          color: Color(0xFF7B5DB0),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 19,
                    top: 323,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 38, // Adjusted width
                      height: 50,
                      child: TextField(
                        controller: _cardNumberController,
                        decoration: InputDecoration(
                          hintText: 'Card Number',
                          hintStyle: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 22,
                    top: 390,
                    child: SizedBox(
                      width: 115,
                      height: 23,
                      child: Text(
                        'Expiry Date',
                        style: TextStyle(
                          color: Color(0xFF7B5DB0),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 19,
                    top: 417,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 22, // Adjusted width
                      height: 50,
                      child: TextField(
                        controller: _expiryDateController,
                        decoration: InputDecoration(
                          hintText: 'MM/YY',
                          hintStyle: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 2 + 4,
                    top: 390,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 22, // Adjusted width
                      height: 23,
                      child: Text(
                        'Security Code',
                        style: TextStyle(
                          color: Color(0xFF7B5DB0),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 2 + 4,
                    top: 417,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 22, // Adjusted width
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'CVV',
                          hintStyle: TextStyle(
                            color: Color(0xFFBDBDBD),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 19,
                    top: 490,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 38, // Adjusted width
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Image.asset(
                              'images/card_1.png',
                              height: 40,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: scanCard,
                              child: Image.asset(
                                'images/scan_card.png',
                                height: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 21,
                    top: 574,
                    child: GestureDetector(
                      onTap: () {
                        // navigate to the passwordscreen
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen())); // Replace with actual route
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 42, // Adjusted width
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
                  Positioned(
                    left: 0,
                    top: 629,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen())); // Replace with actual route
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Skip for now',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFBDBDBD),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 21,
                    top: 703,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 42, // Adjusted width
                      height: 54,
                      child: Column(
                        children: [
                          // Text(
                          //   'Add your payment method',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.black.withOpacity(0.68),
                          //     fontSize: 17,
                          //     fontFamily: 'Comfortaa',
                          //     fontWeight: FontWeight.w700,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 785,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 83,
                      decoration: BoxDecoration(
                        color: Color(0xFF660055),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 2 - 22.5,
                    top: 799,
                    child: Container(
                      width: 45,
                      height: 40,
                      child: Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 30,
                      ),
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
