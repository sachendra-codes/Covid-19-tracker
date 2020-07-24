import 'dart:convert';
import 'package:covid19/pages/countryPage.dart';
import 'package:covid19/pages/statesPage.dart';
import 'package:covid19/panels/india.dart';
import 'package:covid19/panels/info.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'datasource.dart';
import 'package:covid19/panels/worldwidepanel.dart';
import 'package:covid19/panels/mosteffectedcountries.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  fetchWorldWideData()async {
    http.Response response = await http.get(('https://corona.lmao.ninja/v2/all'));
    setState(() {
      worldData=json.decode(response.body);

    });
  }

  List countryData;
  fetchCountryData()async {
    http.Response response = await http.get(('https://corona.lmao.ninja/v2/countries?sort=cases'));
    setState(() {
      countryData=json.decode(response.body);

    });
  }

  @override
  void initState(){
    fetchCountryData();
    fetchWorldWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19 Tracker"),
        actions: <Widget>[
          IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight), onPressed: (){
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Container(
                height: 100,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                color: Colors.orange[100],
                child: Text(DataSource.quote,style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("WorldWide",style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                      } ,
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(10.0)
                        ),

                        padding: const EdgeInsets.all(8.0),
                        child: Text("Regional",style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ],
                ),
            ),
            worldData==null?CircularProgressIndicator():WorldWidePanel(worldData: worldData,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("India",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StatesPage()));
                    } ,
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(10.0)
                      ),

                      padding: const EdgeInsets.all(8.0),
                      child: Text("Regional",style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                ],
              )
            ),
            countryData==null?Container():IndiaPanel(countryData: countryData,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("Most Affected Countries",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
            ),

            countryData==null?Container():MostEffectedPanel(countryData: countryData,),
            SizedBox(height: 20,),
            InfoPanel(),
            Container(
              margin: const EdgeInsets.only(top: 25,left: 40,right: 40,bottom: 20),
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              decoration: BoxDecoration(color: primaryBlack,borderRadius: BorderRadius.circular(20)),

              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("@SACHENDRA JAIN &",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("@SWAPNIL JAIN",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
