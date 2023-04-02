import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel/api/paginas/detalles.dart';
import 'package:marvel/api/rutas_json/rutasPersonajes.dart';


class listapersonaje extends StatefulWidget {
  @override
  estadoListaPersonaje createState() => estadoListaPersonaje();
}

class estadoListaPersonaje extends State<listapersonaje> {
  List<dynamic> personajes = [];

  Future<void> getPersonaje() async {
    final ts = '19';
    final apiKey = '46dd98ec576f050534a06b0d638bc093';
    final hash = 'e0649a8e490dad62e55368a2f8b170a7';

    final url =
        'https://gateway.marvel.com:443/v1/public/characters?ts=19&apikey=$apiKey&hash=$hash&limit=50&offset=500';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        personajes = jsonData['data']['results'];
      });
    } else {
      throw Exception('Fallo al cargar personajes');
    }
  }

  @override
  void initState() {
    super.initState();
    getPersonaje();
  }

  void _mostrarDetallesPersonaje(int index) {
    final personaje = personajes[index];
    final name = personaje['name'];
    final thumbnail = personaje['thumbnail']['path'] +
        '.' +
        personaje['thumbnail']['extension'];
    final description = personaje['description'];
    // Validación para cuando description sea nulo o esté vacío
    final defaultDescription = 'Este personaje no tiene descripción.';
    final validDescription = (description == null || description.isEmpty)
        ? defaultDescription
        : description;
    final comics = personaje['comics']['available'];
    final series = personaje['series']['available'];
    final stories = personaje['stories']['available'];
    final events = personaje['events']['available'];
    final List<dynamic> seriesList = personaje['series']['items'];
    final seriesCount = min(seriesList.length, 3); // Validación para seriesList
    final List<String> seriesNames = seriesList
        .sublist(0, seriesCount)
        .map((item) => item['name'].toString())
        .toList();
    final Personaje selectPersonaje = Personaje(
        name: name,
        image: thumbnail,
        thumbnail: thumbnail,
        description: validDescription,
        comicsCount: comics,
        seriesCount: series,
        storiesCount: stories,
        eventsCount: events,
        firstThreeSeriesNames: seriesNames);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => detalles(
                personaje: selectPersonaje,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: personajes.isEmpty
            ? CircularProgressIndicator ()
            : ListView.builder(
                padding: EdgeInsets.symmetric (),
                itemCount: personajes.length ,
                itemBuilder: (context, index) {
                  final Personaje = personajes[index];
                  final thumbnail = Personaje['thumbnail']['path'] +
                      '.' +
                      Personaje['thumbnail']['extension'];
                  final name = Personaje['name'];
                  return GestureDetector(
                    onTap: () {
                      _mostrarDetallesPersonaje(index);
                    },
                    child: ListTile (
                      leading: CircleAvatar (
                        backgroundImage: NetworkImage(thumbnail),
                      ),
                      title: Text(name),
                      onTap: () {
                        _mostrarDetallesPersonaje(index);
                      },
                    ),
                  );
                },
            )
      ),
    );
  }
}
