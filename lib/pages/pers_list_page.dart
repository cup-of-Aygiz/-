import 'dart:math';

import 'package:flutter/material.dart';
import 'package:study1/model/chartec.dart';
import 'package:study1/pages/person_info_page.dart';
import 'package:study1/servises/rick_and_morty_api.dart';
import 'package:study1/widgets/person_widget.dart';

class PersListPage extends StatefulWidget {
  @override
  _PersListPageState createState() => _PersListPageState();
}

class _PersListPageState extends State<PersListPage> {
  List<Pers> pers;
  String search = "";
  dynamic error;

  //Widget title = Text('Rick and Morty');
  bool searchActive = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    setState(() {
      pers = null;
      error = null;
    });
    RickAndMortyApi.getPers().then((value) {
      setState(() {
        pers = value;
        error = null;
      });
    }).catchError((e) {
      setState(() {
        error = e;
        pers = null;
      });
    });
  }

  void searchByName(String text) {
    setState(() {
      pers = null;
      error = null;
    });
    RickAndMortyApi.findByName(text).then((value) {
      setState(() {
        pers = value;
        error = null;
      });
    }).catchError((e) {
      setState(() {
        error = e;
        pers = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (pers == null) {
      if (error != null) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text(error.toString()),
                IconButton(
                  icon: Icon(Icons.autorenew),
                  onPressed: loadData,
                )
              ],
            ),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading'),
        ),
      );
    }
    List<Pers> children = [];
    /*for (int i = 0; i < pers.length; i++) {
      children.add(PersonWidget(pers[i]));
    }*/
    pers.forEach((element) {
      if (element.name.toLowerCase().contains(search.toLowerCase())) {
        children.add(element);
      }
    });
    /*var onTextChanged = (String text) {
      setState(() {
        search = text;
      });
    };*/
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        /*title: searchActive
            ? Text('Rick and Morty')
            : TextField(
                onChanged: (String text) {
                  setState(() {
                    search = text;
                  });
                },
                decoration: InputDecoration(
                  //icon: Icon(Icons.search, color: Colors.black,),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),*/
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: searchActive
              ? Text('Rick and Morty')
              : TextField(
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  onSubmitted: (String text) {
                    if (text.isEmpty) {
                      setState(() {
                        search = text;
                      });
                      loadData();
                    } else {
                      searchByName(text);
                    }
                  },
                  onChanged: (String text) {
                    setState(() {
                      search = text;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

          /*crossFadeState: searchActive
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,*/
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  searchActive = !searchActive;
                });
              } /*{
              if (title is Text) {
                setState(() {
                  title = TextField(
                    onChanged: (String text) {
                      setState(() {
                        search = text;
                      });
                    },
                    decoration: InputDecoration(
                      //icon: Icon(Icons.search, color: Colors.black,),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  );
                });
              } else {
                setState(() {
                  title = Text('Rick and Morty');
                });
              }
            },*/
              )
        ],
      ),
      /*drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Important: Remove any padding from the ListView.
          //padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.red,
              //height: 56,
              child: (IconButton(
                icon: Image.asset('IconMore/RickandMortiIcon.png'),
              )),
            ),
            IconButton(
              icon: Image.asset('IconMore/RickandMortiIcon2.png'),
            ),
            IconButton(
              icon: Image.asset('IconMore/RickandMortiIcon.png'),
            ),
            IconButton(
                icon: Icon(Icons.brightness_6),
                onPressed: () {},
                padding: EdgeInsets.only(left: 0, top: 0, right: 4, bottom: 2)),
          ],
        ),
      ),
*/
      body: ListView.builder(
        /*children: pers.map((element) {
          return PersonWidget(element);
        }).toList(),*/
        itemBuilder: (c, int index) => PersonWidget(children[index]),
        itemCount: children.length,
      ),
    );
  }

/*void onTextChanged(String text) {
    setState(() {
  search = text;
  });
}*/
}
