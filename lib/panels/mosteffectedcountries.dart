import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MostEffectedPanel extends StatelessWidget {
  final List countryData;

  const MostEffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics:NeverScrollableScrollPhysics() ,
        itemBuilder: (context,index){
        return Card(
          color: Theme.of(context).brightness==Brightness.light?Colors.grey[100]:Colors.blueGrey[800],
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.network(countryData[index]['countryInfo']['flag'],height: 30,width: 40,),
                Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                Text('Deaths: '+countryData[index]['deaths'].toString(),style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.red,
                ),)
              ],
            ),
          ),
        );
      },
      itemCount: 5,
      ),

    );
  }
}
