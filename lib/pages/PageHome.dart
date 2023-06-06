import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:san_pablo_del_monte/pages/PageContact.dart';
import 'package:flutter/cupertino.dart';

class PageHome extends StatelessWidget {
  List<String> images = [
    "https://i.pinimg.com/564x/f2/c7/a2/f2c7a226f72470281bb34171c994c387.jpg",
    "https://i.pinimg.com/564x/b8/e6/89/b8e689b380d54b3dc013ec0266488fa3.jpg",
    "https://i.pinimg.com/564x/26/64/2a/26642aa1db9a7dbcaca2bf8e2e174462.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 25, 70, 147),
        child: Column(
          children: [
            Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Portada_de_San_Pablo_del_Monte%2C_Tlaxcala_02.jpg/4096px-Mapcarta.jpg"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: _swiper(images),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 104, 27, 21),
                    ),
                    onPressed: ()=>{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageContact() )
                        )
                    },
                    child: Text("Contacto", style: TextStyle(fontSize: 18.0))
                    )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

Widget _swiper(images) {
  return Container(
    width: 400.0,
    height: 320.0,
    child: Swiper(
      viewportFraction: 0.6,
      scale: 0.9,
      itemBuilder: (BuildContext context,int index){
        return Image.network(
          images[index],
          fit: BoxFit.fill,
        );
      },
      itemCount: images.length,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    ),
  );
}