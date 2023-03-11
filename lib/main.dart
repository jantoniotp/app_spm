import 'package:flutter/material.dart';
import 'package:san_pablo_del_monte/pages/PageHome.dart';
import 'package:san_pablo_del_monte/pages/PageJobs.dart';
import 'pages/PageCommerce.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _pageCurrently = 1;

  List<Widget> _pages = [
    PageJobs(),
    PageHome(),
    PageCommerce()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: _pages[_pageCurrently],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _pageCurrently = index;
            });
          },
          currentIndex: _pageCurrently,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.manage_search), label: 'Empleos'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Comercios')
          ]
        ),
      ),
    );
  }
}