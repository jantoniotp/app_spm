import 'package:flutter/material.dart';

class PageContact extends StatelessWidget {
  const PageContact({super.key});

@override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Contacto'),
     ),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Column(
         children: [
           Text('¿Quiénes somos?',
           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),), SizedBox(height: 25,),
           Text('La app de San Pablo del Monte nace de la necesidad de tener información clara y precisa de una manera sencilla.',
           style: TextStyle(fontSize: 18), textAlign: TextAlign.justify,), SizedBox(height: 15,),
           Text('Sabemos que las aplicaciones móviles han venido a revolucionar la manera de comunicarnos y el cómo buscar y encontrar información.',
           style: TextStyle(fontSize: 18), textAlign: TextAlign.justify,), SizedBox(height: 15,),
           Text('Esta app nos ofrece información sobre eventos, noticias, comercios y empleos dentro y fuera de nuestra comunidad.',
           style: TextStyle(fontSize: 18), textAlign: TextAlign.justify,), SizedBox(height: 15,),
           Text('Si estás interesado en anunciar tu oferta laboral, comercio, evento, etc. no dudes en contactarnos al WhatsApp: 2221567310.',
           style: TextStyle(fontSize: 18), textAlign: TextAlign.justify,), SizedBox(height: 15,),
           Text('No olvides que este espacio fue hecho para el beneficio de toda nuestra comunidad, te pedimos que no difundas información falsa o perjudicial hacia algo o alguien, queremos que esto pueda ser de gran ayuda para todos y todas.',
           style: TextStyle(fontSize: 18), textAlign: TextAlign.justify,), SizedBox(height: 25,),
           Text('Gracias.',
           style: TextStyle(fontSize: 18), textAlign: TextAlign.justify,), SizedBox(height: 35,),
           ElevatedButton(
             style: TextButton.styleFrom(
               backgroundColor: Colors.red,
               padding: EdgeInsets.zero,
               minimumSize: Size(100, 45),
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.arrow_back_ios),
                 Text("Regresar", style: TextStyle(fontSize: 20.0),)
               ],
             ),
             onPressed: ()=>{
               Navigator.pop(context)
             })
         ],
       ),
     ),
   );
 }
}
