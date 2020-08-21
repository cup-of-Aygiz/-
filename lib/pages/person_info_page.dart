import 'package:flutter/material.dart';
import 'package:study1/model/chartec.dart';
//сделать поиск, Настроить Icon, Интернет

class PersonInfoPage extends StatelessWidget {
  final Pers pers;

  PersonInfoPage(this.pers);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: Colors.white,
      fontSize: 15,
      shadows: <Shadow>[
        Shadow(
          offset: Offset(2.0, 2.0),
          blurRadius: 2.0,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ],
    );
    return MaterialApp(
      home: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("images/logo.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Color(0x000000),
          appBar: AppBar(
            title: Text(pers.name),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: pers.id,
                  child: pers.image == null
                      ? Image.asset('images/unknown.jpg')
                      : Image.network(pers.image),
                ),
                Center(
                  child: Text(
                    '${pers.name}',
                    style: style.copyWith(fontSize: 30),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Gender:',
                      style: style,
                    ),
                    Text(
                      pers.gender,
                      style: style,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Status:',
                      style: style,
                    ),
                    Text(
                      pers.status,
                      style: style.copyWith(
                          color: pers.status == 'Alive'
                              ? Colors.green
                              : Colors.red),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Location: ${pers.location}',
                      style: style,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Origin: ${pers.origin}',
                      style: style,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
