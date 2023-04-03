import 'package:flutter/material.dart';

class ficha extends StatelessWidget {
  final Map<String, dynamic> personajes;
  final VoidCallback onTap;

  const ficha({Key? key, required this.personajes, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = personajes['name'];
    final thumbnail = personajes['thumbnail']['path'] +
        '.' +
        personajes['thumbnail']['extension'];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
