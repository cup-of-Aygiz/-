import 'package:flutter/material.dart';
import 'package:study1/model/chartec.dart';
import 'package:study1/pages/person_info_page.dart';

class PersonWidget extends StatelessWidget {
  final Pers pers;

  PersonWidget(this.pers);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFFedeef1),
            blurRadius: 1.0,
            spreadRadius: 2.0,
          )
        ]),
        padding: EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: Center(
                child: Hero(
                    tag: pers.id,
                    child: pers.image == null
                        ? Image.asset('images/unknown.jpg')
                        : Image.network(pers.image)),

              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return PersonInfoPage(pers);
                }));
              },
            ),
            Center(
              child: Text(
                '${pers.name}',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
