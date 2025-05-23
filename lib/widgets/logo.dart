import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 175,
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image(image: AssetImage('assets/tag-logo-a.png')),
            ),
            SizedBox(height: 20),
            Text(
              titulo,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
