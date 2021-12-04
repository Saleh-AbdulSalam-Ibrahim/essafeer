
import 'package:essafeer/authentication/terms_of_use.dart';
import 'package:essafeer/screens/web_page.dart';
import 'package:flutter/material.dart';
import 'web_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: kToolbarHeight * 2),
                    Text(
                      "Welcome to",
                      style: textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                child: new Image.asset(
                 'images/appstore-removebg-preview.png',
                  //'images/icon_essafeer.png'
                  // color: Colors.teal,
                  // size: 40.0,
                ),
              ),
              Column(
                children: <Widget>[
                  smallHeightSpacing,
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Essafeer_Web_Page(),),);
                    }, // push to sign up
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Shopping Now",
                        style: textTheme.headline6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.tealAccent,
                        boxShadow: [
                          BoxShadow(color: Colors.green, spreadRadius: 3),
                        ],
                      ),
                      height: 50,
                    ),
                  ),

                  SizedBox(height: 74),
                   TermsOfUse(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get smallHeightSpacing => SizedBox(height: 12);
}