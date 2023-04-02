import 'package:flutter/material.dart';
import 'package:marvel/api/paginas/cards.dart';

class mainApi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mainApi(); 
  }
}

class _mainApi extends State<mainApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Marvel isa"),
        ),
    );
        
  }
}