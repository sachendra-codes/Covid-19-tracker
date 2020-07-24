import 'package:flutter/material.dart';
class IndiaPanel extends StatelessWidget {
  final List countryData;

  const IndiaPanel({Key key, this.countryData}) : super(key: key);
  findIndia(){
    for(var t=0; t<countryData.length; t++){
      if(countryData[t]['country']=="India"){
        return t;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            title: "CONFIRMED",
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count:countryData[findIndia()]['cases'].toString(),
          ),
          StatusPanel(
            title: "ACTIVE",
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count:countryData[findIndia()]['active'].toString(),
          ),
          StatusPanel(
            title: "RECOVERED",
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count:countryData[findIndia()]['recovered'].toString(),
          ),
          StatusPanel(
            title: "DEATHS",
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count:countryData[findIndia()]['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(10),
      height:80,
      width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 16,color: textColor,
          ),),
          Text(count,style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 16,color: textColor,
          ),)
        ],
      ),
    );
  }
}

