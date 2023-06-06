import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:san_pablo_del_monte/models/Job.dart';

class PageJobs extends StatefulWidget {
  const PageJobs({super.key});

  @override
  State<PageJobs> createState() => _PageJobsState();
}

class _PageJobsState extends State<PageJobs> {
  Future<List<Job>> _listingJobs = Future( () => [Job('', '', '')]);

  Future<List<Job>> _getJobs() async {
    final response = await
    http.get(Uri.parse("https://mx.mercadojobs.com/anuncios/getCpcAdsBySearch?start=0&limit=10&co=mx&search=director"));

    List<Job> jobs = [];

    //if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      for (var item in jsonData['results']) {

        jobs.add(Job(item['jobtitle'], item['snippet'], item['company']));
      }
      return jobs;
   /*} else {

     throw Exception("Falló la conexión");
   }*/
  }
   
  @override
  void initState() {
    super.initState();
    _listingJobs = _getJobs();
  }

   Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: "Material App",
     home: Scaffold(
       body: Column(
        children: [
          Container(
            height: 30,
            color: Colors.blue,
         child: Text("Empleos de hoy")
          ),
          Container(
            height: 650,
            color: Colors.red,
         child: FutureBuilder(
           future: _listingJobs,
           builder: (context, snapshot) {
             if (snapshot.hasData) {
               return GridView.count(
                 crossAxisCount: 1,
                 children: _listJobs(snapshot.data),
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
          )
        ]
       ),
       ),
     );
   }
}

List<Widget> _listJobs(data) {
  List<Widget> jobs = [];

  for (var job in data) {
    jobs.add(
      Card(
        margin: const EdgeInsets.only(bottom: 300),
        child: Column(
        children: [
          ListTile(
            title: Text(job.title),
            subtitle: Text(job.description.trim()),
            leading: CircleAvatar(
              child: Text(job.company),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          )
        ],
      ))
    );
  }

  return jobs;
}
