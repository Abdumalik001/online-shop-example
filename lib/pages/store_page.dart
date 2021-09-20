import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop/json/constants.dart';
import 'package:online_shop/theme/colors.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 35, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Phnom Penh',
                    style: TextStyle(color: black, fontSize: 16),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    FontAwesomeIcons.mapMarkerAlt,
                    size: 16,
                    color: black,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Find all \nstories here',
                style: TextStyle(
                    color: black,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    height: 1.5),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          cursorColor: primary,
                          decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                FontAwesomeIcons.search,
                                size: 20,
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                    child: Icon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: grey.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'All Stories',
                style: TextStyle(
                    color: black, fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Column(
              children: List.generate(
                  storeList.length,
                      (index) =>
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                        NetworkImage(storeList[index]['img']),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            top: 15, right: 15),
                                        child: Container(
                                          height: 25,
                                          width: 65,
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius: BorderRadius
                                                  .circular(5)),
                                          child: storeList[index]['open'] == 0
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'CLOSE',
                                                style: TextStyle(
                                                    color: black,
                                                    fontSize: 10,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.redAccent,
                                                    shape: BoxShape.circle),
                                              )
                                            ],
                                          )
                                              : Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'OPEN',
                                                style: TextStyle(
                                                    color: black,
                                                    fontSize: 10,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.greenAccent,
                                                    shape: BoxShape.circle),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(bottom:
                                      15, left: 15),
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_on, color:
                                          white,),
                                          Text(storeList[index]['name'],
                                            style: TextStyle(color: Colors
                                                .white, fontSize: 16),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
            )
          ],
        ));
  }
}
