import 'package:flutter/material.dart';

class PageCommerce extends StatefulWidget {
  const PageCommerce({super.key});

  @override
  State<PageCommerce> createState() => _PageCommerceState();
}

class _PageCommerceState extends State<PageCommerce> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0.0,
          title:  Transform(
              // you can forcefully translate values left side using Transform
              transform:  Matrix4.translationValues(0.0, -30.0, 0.0),
              child: Text(
                "HOLIDAYS"
              ),
            ),
        ),
        body: Center(
          child: Container(
            child: Text('Listado de comercios'),
          ),
        )
      ),
    );
  }
}