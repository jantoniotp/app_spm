import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:san_pablo_del_monte/models/Gif.dart';

class PageJobs extends StatefulWidget {
  const PageJobs({super.key});

  @override
  State<PageJobs> createState() => _PageJobsState();
}

class _PageJobsState extends State<PageJobs> {
  Future<List<Gif>> _listingGifs = Future( () => [Gif('', '')]);

  Future<List<Gif>> _getGifs() async {
    final response = await
    http.get(Uri.parse("https://api.giphy.com/v1/gifs/trending?api_key=SPpsJ34obaRiEAM4DX5LVX3SX3M4EMS8&limit=10&rating=g"));

    List<Gif> gifs = [];


   if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      for (var item in jsonData['data']) {
        if (item['images']['downsized']['url'] == null) {
          continue;
        }
        gifs.add(Gif(item['title'], item['images']['downsized']['url']));
      }
      return gifs;
   } else {

     throw Exception("Falló la conexión");
   }
  }
   
  @override
  void initState() {
    super.initState();
    _listingGifs = _getGifs();
  }

   Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: "Material App",
     home: Scaffold(
       appBar: AppBar(
         title: Text('Empleos de hoy'),
       ),
       body: FutureBuilder(
         future: _listingGifs,
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             return GridView.count(
               crossAxisCount: 1,
               children: _listGifs(snapshot.data),
             );
           } else if (snapshot.hasError) {
             print(snapshot.error);
             return Text('Error');
           }


           return Center(
             child: CircularProgressIndicator(),
           );
         },
         ),
       ),
     );
   }
}

List<Widget> _listGifs(data) {
  List<Widget> gifs = [];

  for (var gif in data) {
    gifs.add(
      Card(child: Column(
        children: [
          Image.network(gif.url),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(gif.name),
          )
        ],
      ))
    );
  }

  return gifs;
}
