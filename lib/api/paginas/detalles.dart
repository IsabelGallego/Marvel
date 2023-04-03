import 'package:flutter/material.dart';
import 'package:marvel/api/rutas_json/rutasPersonajes.dart';

class detalles extends StatelessWidget {
  final Personaje personaje;
  const detalles({Key? key, required this.personaje}) : super(key: key);

  Widget build1({required String text, required int value, Container}) =>
      MaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.symmetric(vertical: 6),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '$value',
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(personaje.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              personaje.image,
              height: 350,
              fit: BoxFit.fill,
            ),
            Container(
              height: 21,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                border:
                    Border.all(width: 5, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              child: Text(
                personaje.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 17,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Las 3 primeras series son:  ',
                    textAlign: TextAlign.left ,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    
                  ),
                  const SizedBox(height: 15),
                  for (final seriesName in personaje.firstThreeSeriesNames)
                    Text(
                      seriesName,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                    ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(width: 30, color: Colors.transparent),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      build1(text: "Comics", value: personaje.comicsCount),
                      build1(text: "Series", value: personaje.seriesCount),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      build1(text: "Historias", value: personaje.storiesCount),
                      build1(text: "Eventos", value: personaje.eventsCount),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}