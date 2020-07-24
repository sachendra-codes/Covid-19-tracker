import 'package:flutter/material.dart';


class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Theme.of(context).brightness==Brightness.light?Colors.grey[100]:Colors.blueGrey[800],
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query='';


      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList
    =
    query.isEmpty?
    countryList:
    countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
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
                      Text(suggestionList[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.network(suggestionList[index]['countryInfo']['flag'],height: 50,width: 60,),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text('CONFIRMED:'+suggestionList[index]['cases'].toString(),style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.red[400],
                        ),),
                      ),
                      Container(
                        child: Text('ACTIVE:'+suggestionList[index]['active'].toString(),style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.blue[400],
                        ),),
                      ),
                      Container(
                        child: Text('RECOVERED:'+suggestionList[index]['recovered'].toString(),style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.green[400],
                        ),),
                      ),
                      Container(
                        child: Text('DEATHS:'+suggestionList[index]['deaths'].toString(),style: TextStyle(
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
        });
  }

}