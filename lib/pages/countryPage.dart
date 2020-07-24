import 'dart:convert';
import 'package:covid19/pages/search.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData()async {
    http.Response response = await http.get(('https://corona.lmao.ninja/v2/countries'));
    setState(() {
      countryData=json.decode(response.body);

    });
  }
  @override
  void initState(){
    fetchCountryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Stats'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){
            showSearch(context: context, delegate: Search(countryData));
          },)
        ],

      ),
      body:countryData==null?CircularProgressIndicator(): ListView.builder(itemBuilder: (context,index){
        return Card(
          color: Theme.of(context).brightness==Brightness.light?Colors.grey[100]:Colors.blueGrey[800],
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                    Image.network(countryData[index]['countryInfo']['flag'],height: 50,width: 60,),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Text('CONFIRMED:'+countryData[index]['cases'].toString(),style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.red[400],
                      ),),
                    ),
                    Container(
                      child: Text('ACTIVE:'+countryData[index]['active'].toString(),style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.blue[400],
                      ),),
                    ),
                    Container(
                      child: Text('RECOVERED:'+countryData[index]['recovered'].toString(),style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.green[400],
                      ),),
                    ),
                    Container(
                      child: Text('DEATHS:'+countryData[index]['deaths'].toString(),style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),),
                    ),
                  ],
                )
              ],
            ),

          ),
        );
      },
        itemCount: countryData==null?0:countryData.length,),
    );


  }
}
