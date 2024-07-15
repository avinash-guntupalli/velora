
import 'package:flutter/material.dart';
import 'package:velora/screens/offers_page.dart';
class ExplainTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFF1FD),
      appBar: AppBar(
        // align the groceries text to the center of the app bar
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
                    // shadow of the border
                    borderSide: BorderSide(color: Color(0xFF660056)),
                  ),

                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Meeting Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF660056)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 150,
                decoration: BoxDecoration(

                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],

                ),
                child: Image.asset('images/map.png', fit: BoxFit.fill,),

                // add another image on the map at the center of the map






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
                // backgroundColor: Color(0XFF660056),

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
            icon: Icon(Icons.mic, color: Colors.white, size: 30,),
            label: '',
          ),
        ],
      ),
    );
  }
}