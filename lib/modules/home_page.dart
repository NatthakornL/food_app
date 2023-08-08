import 'package:flutter/material.dart';
import 'package:food_app/components/cuisine_items_card.dart';
import 'package:food_app/components/home_title.dart';
import 'package:food_app/components/nearby_items_card.dart';
import 'package:food_app/components/popular_items_card.dart';
import 'package:food_app/models/cuisineitems.dart';
import 'package:food_app/models/popularitems.dart';
import 'package:food_app/models/nearbyitems.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  List<CuisineItems> cuisineItems = [
    CuisineItems(
        text: "Pizza & Pasta",
        secondaryText: "28 reviews",
        image: "images/pizza.jpeg"),
    CuisineItems(
        text: "Sushi", secondaryText: "26 reviews", image: "images/sushi.jpeg"),
    CuisineItems(
        text: "Mexican",
        secondaryText: "33 reviews",
        image: "images/mexican.jpeg"),
  ];
  List<PopularItems> popularItems = [
    PopularItems(
        text: "Thai Me Up Restaurant &\nBrewery", image: "images/brewery.jpeg"),
    PopularItems(
        text: "Tequila Mackingbir\nGreenpoint",
        image: "images/greenpoint.jpeg"),
  ];
  List<NearByItems> nearByItems = [
    NearByItems(
        text: "Sotto || Ponte Pizza\nPasta Tradizionali",
        image: "images/ponte_pizza.jpeg"),
    NearByItems(
        text: "Delicious Pizza & Pasta\nTraditionaly",
        image: "images/delicious.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2FFC5),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey.shade400,
                    ),
                    contentPadding: EdgeInsets.all(8),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            HomeTitle(text: "Cuisine"),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: cuisineItems.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CuisineItemsCard(cuisineItems: cuisineItems[index]);
                },
              ),
            ),
            //===============================================
            SizedBox(
              height: 20,
            ),
            HomeTitle(text: "Popular"),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: popularItems.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return PopularItemsCard(popularItems: popularItems[index]);
                },
              ),
            ),
            //===============================================
            SizedBox(
              height: 20,
            ),
            HomeTitle(text: "Nearby"),
            SizedBox(
              height: 16,
            ),
            ListView.builder(
              itemCount: nearByItems.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return NearByItemsCard(
                  nearByItems: nearByItems[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
