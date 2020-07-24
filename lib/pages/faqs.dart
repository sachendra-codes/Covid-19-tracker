import 'package:covid19/datasource.dart';
import 'package:flutter/material.dart';
class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
          itemBuilder: (context,index){
            return ExpansionTile(
              title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.bold),),
              children: <Widget>[
                Container(padding: const EdgeInsets.all(5.0),child: Text(DataSource.questionAnswers[index]['answer']))
              ],
            );
          },
          itemCount: DataSource.questionAnswers.length
          ),
    );
  }
}
