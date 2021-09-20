import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:online_shop/json/constants.dart';
import 'package:online_shop/theme/colors.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      appBar: AppBar(
        title: Center(
            child: Text(
          'ACCOUNT',
          style: TextStyle(
              color: black, fontSize: 20, fontWeight: FontWeight.bold),
        )),
        backgroundColor: white,
      ),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(profileUrl), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daniel',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Member since 2011',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7), fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),

                FlatButton(
                    onPressed: null,
                    child: Container(
                      decoration: BoxDecoration(
                          color: black, borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'EDIT ACCOUNT',
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ))
              ],
            )
          ],
        )
      ],
    );
  }
}
