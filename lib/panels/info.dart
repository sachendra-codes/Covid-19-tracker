import 'package:covid19/datasource.dart';
import 'package:covid19/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(8),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('FAQ',style: TextStyle(
                    color: Colors.white,
                    fontWeight:FontWeight.bold,
                    fontSize: 18,
                  ),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(8),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('DONATE',style: TextStyle(
                    color: Colors.white,
                    fontWeight:FontWeight.bold,
                    fontSize: 18,
                  ),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://indianhelpline.com/');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(8),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('HELPLINE NUMBERS',style: TextStyle(
                    color: Colors.white,
                    fontWeight:FontWeight.bold,
                    fontSize: 18,
                  ),),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

