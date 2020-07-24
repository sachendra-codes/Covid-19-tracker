import 'dart:convert';

import 'package:covid19/pages/searchStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class StatesPage extends StatefulWidget {
  @override
  _StatesPageState createState() => _StatesPageState();
}

class _StatesPageState extends State<StatesPage> {
  Map statesData;
  List statesDataList;
  fetchStatesData()async {
    http.Response response = await http.get(('https://api.covid19india.org/data.json'));
    setState(() {
      statesData=json.decode(response.body);
      statesDataList=statesData['statewise'].sublist(1);
    });
  }
  @override
  void initState(){
    fetchStatesData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Stats'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){
            showSearch(context: context, delegate: SearchState(statesDataList));
          },)
        ],

      ),
      body: statesData==null?CircularProgressIndicator():GridView.builder(
          itemCount: statesDataList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.4),
          itemBuilder: (context,index){
            return ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Card(
                  color: Theme.of(context).brightness==Brightness.light?Colors.grey[100]:Colors.blueGrey[800],
                  child: Container(
                    height: 112,
                    padding: const EdgeInsets.all(2),
                    width: MediaQuery.of(context).size.width/2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: <Widget>[
                            Expanded(child: Text(statesDataList[index]['state'].toString().toUpperCase(),style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Theme.of(context).brightness==Brightness.light?Colors.indigo[600]:Colors.white,

                            ),))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('CONFIRMED:'+statesDataList[index]['confirmed'].toString(),style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('RECOVERED:'+statesDataList[index]['recovered'].toString(),style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('ACTIVE:'+statesDataList[index]['active'].toString(),style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('DEATHS:'+statesDataList[index]['deaths'].toString(),style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness==Brightness.light?Colors.black87:Colors.limeAccent,

                            ),)
                          ],
                        )
                      ],
                    ),
                  ),
                ) ,
              ],
            );
          }
      )
    );
  }
}
