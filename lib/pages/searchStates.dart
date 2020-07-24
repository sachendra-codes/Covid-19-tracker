import 'package:flutter/material.dart';
class SearchState extends SearchDelegate{
  final List statesList;

  SearchState(this.statesList);
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
  Widget buildSuggestions(BuildContext context) {
    final suggestionList1
    =
    query.isEmpty?
    statesList:
    statesList.where((element) => element['state'].toString().toLowerCase().startsWith(query)).toList();

    // TODO: implement buildSuggestions

    return  GridView.builder(
        itemCount: suggestionList1.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.3),
        itemBuilder: (context,index){
          return ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Card(
                color: Theme.of(context).brightness==Brightness.light?Colors.grey[100]:Colors.blueGrey[800],
                child: Container(
                  height: 115,
                  padding: const EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width/2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: <Widget>[
                          Expanded(child: Text(suggestionList1[index]['state'].toString().toUpperCase(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Theme.of(context).brightness==Brightness.light?Colors.indigo[600]:Colors.limeAccent,

                          ),))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('CONFIRMED:'+suggestionList1[index]['confirmed'].toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('RECOVERED:'+suggestionList1[index]['recovered'].toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('ACTIVE:'+suggestionList1[index]['active'].toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('DEATHS:'+suggestionList1[index]['deaths'].toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,

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
    );
  }

}