import 'package:flutter/material.dart';
import 'package:velora/screens/detailed_page.dart';
class OffersPage extends StatelessWidget {
  final List<Offer> offers = [
    Offer(name: 'Lisa Bakker', ratings: 12, ratingStars: 5, price: 18, imagePath: 'images/lisa.png'),
    Offer(name: 'Anna Schmidt', ratings: 4, ratingStars: 5, price: 19, imagePath: 'images/anna.png'),
    Offer(name: 'Tim Wagner', ratings: 18, ratingStars: 5, price: 19, imagePath: 'images/tim.png'),
    Offer(name: 'Andre Becker', ratings: 12, ratingStars: 5, price: 21, imagePath: 'images/andre.png', isFaded: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text('Offers', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        leading: Icon(Icons.arrow_back),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('You received 6 offers!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: offers.length,
              itemBuilder: (context, index) {
                return OfferCard(offer: offers[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: ''),
        ],
        backgroundColor: Color(0xFF5B0060),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}

class Offer {
  final String name;
  final int ratings;
  final int ratingStars;
  final int price;
  final String imagePath;
  final bool isFaded;

  Offer({required this.name, required this.ratings, required this.ratingStars, required this.price, required this.imagePath, this.isFaded = false});
}

class OfferCard extends StatelessWidget {
  final Offer offer;

  const OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()), // Replace with the page you want to navigate to
        );
      },
      child: Opacity(
        opacity: offer.isFaded ? 0.3 : 1.0,
        child: Container(
          height: 150, // Set the minimum height of the card
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)
                , side: BorderSide(color: Colors.purple, width: 2)),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the children of the Row
              children: [
                CircleAvatar(
                  // align to the left and center vertically
                  backgroundImage: AssetImage(offer.imagePath),
                  radius: 50,
                ),
                SizedBox(width: 16), // Add some spacing between the photo and the text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the children of the Column
                  children: [
                    Text(offer.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text('${'⭐' * offer.ratingStars} ${offer.ratings} ratings', style: TextStyle(color: Colors.purple)),
                      ],
                    ),
                    Text('€${offer.price}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
