import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop/json/constants.dart';
import 'package:online_shop/theme/colors.dart';
import 'package:online_shop/widgets/custom_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Container(
              height: 500,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(homeImg), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 28,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Icon(
                    FontAwesomeIcons.search,
                    size: 24,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Winter Collection',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'DISCOVER',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.white,
                          size: 18,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),

        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    'All',
                    style: TextStyle(
                      color: grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: grey,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categories.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: 180,
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(categories[index]['imgUrl']),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      Positioned(
                          bottom: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categories[index]['title'],
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended for you',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    'All',
                    style: TextStyle(
                      color: grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: grey,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                recommends.length,
                    (index) => Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 140,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                    recommends[index]['imgUrl']),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recommends[index]['title'],
                              style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                            Text(
                              "${recommends[index]['price']} \$ ",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),

        SizedBox(
          height: 30,
        ),
        CustomeCarouselHomePage(
          items: slider,
        ),


        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent viewed',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    'All',
                    style: TextStyle(
                      color: grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: grey,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                recommends.length,
                    (index) => Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 140,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                    recently[index]['imgUrl']),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recently[index]['title'],
                              style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                            Text(
                              "${recently[index]['price']} \$ ",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
