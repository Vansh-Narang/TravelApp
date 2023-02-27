//import 'dart:html';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_5/Data/Category.dart';
import 'package:flutter_application_5/Data/Data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageController = PageController(viewportFraction: 0.8);
  int index1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.trending_up,
              ),
              label: 'Trending'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favourites'),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        selectedFontSize: 16,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: index1,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Travelzee",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Explore the Nature",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  //    letterSpacing: 3,
                  //   wordSpacing: 6
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          child: DefaultTabController(
            length: 4,
            child: TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                tabs: [
                  Tab(
                    child: Container(
                      child: Text(
                        "Recommend",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        "Trending",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        "NewDestination",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        "Favourites",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        //List Generation for reccomedation
        Container(
            height: 218.8,
            margin: EdgeInsets.only(top: 16),
            child: PageView(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                recommendations.length,
                (int index) => Container(
                  margin: EdgeInsets.only(right: 28.8),
                  width: 333,
                  height: 218,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(recommendations[index].image)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 19.2,
                          left: 19.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.8),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaY: 19.2, sigmaX: 19.2),
                              child: Container(
                                height: 36,
                                padding:
                                    EdgeInsets.only(left: 16.72, right: 14.4),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      recommendations[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 16.8),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )),

        Padding(
            padding: EdgeInsets.only(left: 28.8, top: 28.8),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: recommendations.length,
              effect: ExpandingDotsEffect(
                  activeDotColor: Colors.grey,
                  dotColor: Colors.blue,
                  dotHeight: 4.8,
                  dotWidth: 6,
                  spacing: 4.8),
            )),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Popular Categories",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.grey),
                ),
                Text(
                  "Show All",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Colors.grey),
                )
              ]),
        ),
        Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Beach",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Islands",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Waterfalls",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ))
              ]),
        ),
        Expanded(
          child: Container(
            height: 200,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 28, right: 12),
              itemCount: reCategory.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _launchURLBrowser();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    height: 124,
                    width: 188,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(reCategory[index].image))),
                  ),
                );
              },
            ),
          ),
        )
      ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      index1 = index;
    });
  }
}

_launchURLBrowser() async {
  var url = Uri.parse("https://www.geeksforgeeks.org/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
