import 'package:flutter/material.dart';
import 'package:velora/screens/explain_task.dart';
class ElderMainscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2D4D4),

      body: SafeArea(
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

            SizedBox(height: 20,),



            // create two container per row with height 150 and width 150 which are gesture detector in side the container
            // it should have groceries and the second should have pickup

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push( context, MaterialPageRoute(builder: (context) => ExplainTask()));
                      // Handle groceries tap
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Color(0xFF5AFF9C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                            size: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Groceries',
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
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      // Handle pickup tap
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF5AD1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.delivery_dining,
                            color: Colors.black,
                            size: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Pickup',
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
                ),
              ],

            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      // Handle groceries tap
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE55A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/navigation.png', height: 40, width: 40, color: Colors.black,), // Image.asset('images/navigation.png', height: 40, width: 40, color: Colors.white,
                          SizedBox(height: 10),
                          Text(
                            'Navigation',
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
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      // Handle pickup tap
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Color(0xFF5AFFFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/tech.png', height: 40, width: 40, color: Colors.black,),
                          SizedBox(height: 10),
                          Text(
                            'Tech',
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
                ),
              ],

            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      // Handle groceries tap
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF5A5A), // hex color code 5AFF9C,

                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/doctor.png', height: 40, width: 40, color: Colors.black,),
                          SizedBox(height: 10),
                          Text(
                            'Medical',
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
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      // Handle pickup tap
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Color(0xFF8FFF5A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/carriage.png', height: 40, width: 40, color: Colors.black,),
                          SizedBox(height: 10),
                          Text(
                            'carriage',
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
                ),
              ],

            ),

            SizedBox(height: 20,),

            // create a single container with height 100 and width 350 which is a gesture detector
            // it should be aligned to the centre  and it should have the icon + and text another

            Container(
              height: 60,
              width: 350,
              child: GestureDetector(
                onTap: () {
                  // Handle add task tap
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Color(0xFF5AFF9C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 40,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Another Task',
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
            ),

            // from the bottom padding of 5 i need two container in aroow with height 80 and spacing between them is 10
            // one should have home sign and other should have mic sign with white colour and no text

            SizedBox(height: 60,),

            // add a row with two containers at the bottom of the screen

            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Handle home tap
                    },
                    child: Container(
                      height: 80,
                      width: (MediaQuery.of(context).size.width -5)/2,
                      decoration: BoxDecoration(
                        color: Color(0xFF660056),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle mic tap
                    },
                    child: Container(
                      height: 80,
                      width: (MediaQuery.of(context).size.width -5) / 2,
                      decoration: BoxDecoration(
                        color: Color(0xFF660056),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.mic,
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
    );
  }
}