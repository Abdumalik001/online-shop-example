import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/json/constants.dart';
import 'package:online_shop/pages/account_page.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/pages/store_page.dart';
import 'package:online_shop/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  AppBar appBar;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      bottomNavigationBar: getFooter(),
       // appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            itemsTab.length,
            (index) => IconButton(
              icon: Icon(itemsTab[index]['icon']),
              iconSize: itemsTab[index]['size'],
              color: activeTab == index ? accent : black,
              onPressed: () {
                setState(() {
                  activeTab = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget getAppBar() {
    switch (activeTab) {
      case 0:
        return AppBar(
          elevation: 0.8,
          title: Text(
            'HOME',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        );
        break;
      case 1:
        return AppBar(
          elevation: 0.8,
          title: Text(
            'LOCATION',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        );
        break;
      case 2:
        return AppBar(
          elevation: 0.8,
          title: Text(
            'ACCOUNT',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        );
        break;
      case 3:
        return AppBar(
          elevation: 0.8,
          title: Text(
            'CART',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        );
        break;
      case 4:
        return AppBar(
          elevation: 0.8,
          title: Text(
            'MORE',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        );
        break;
    }
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        StorePage(),
        AccountPage(),
        Container(
          child: Center(
            child: Text(
              'Cart',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Text(
              'More',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
