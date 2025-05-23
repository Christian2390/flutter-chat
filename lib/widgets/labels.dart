import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String titulo;
  final String subTitulo;

  const Labels({
    super.key,
    required this.ruta,
    required this.titulo,
    required this.subTitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            titulo,
            style: TextStyle(
              color: Colors.brown,
              fontStyle: FontStyle.normal,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
            child: Text(
              subTitulo,
              style: TextStyle(
                color: Colors.deepOrange,
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
