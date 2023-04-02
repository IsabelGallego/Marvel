import 'package:flutter/material.dart';
import 'package:marvel/api/rutas_json/rutasPersonajes.dart';


class detalles extends StatelessWidget {
  final Personaje personaje;
  // Validación para cuando description sea nulo o esté vacío
  final descripcion = 'Este personaje no tiene descripción.';

  const detalles ({Key? key, required this.personaje})
      : super(key: key);

  Widget build1({
    
    required String text,
    required int value,
    Container
  }) =>
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
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
            )
          ],
        ),
      );
      
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(personaje.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Image.network(
              personaje.image,
              height: 300,
              fit: BoxFit.fill,
            ),
            
            Container(
              height: 21,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 67, 54),
                border: Border.all(width: 0, color: Colors.transparent),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 67, 54),
                border: Border.all(width: 0, color: Color.fromARGB(0, 0, 0, 0)),
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
                color: Color.fromARGB(255, 244, 67, 54),
                border: Border.all(width: 0, color: Colors.transparent),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    
                    'Tres primeras series: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
                color: Color.fromARGB(255, 255, 0, 0),
                border: Border.all(width: 10, color: Colors.transparent),
              ),
              child: Column(
                children: [
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      build1(text: "Comics", value: personaje.comicsCount),
                      build1(text: "Series", value: personaje.seriesCount),
                      build1(
                          text: "Histories", value: personaje.storiesCount),
                      build1(
                          text: "Events", value: personaje.eventsCount),
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