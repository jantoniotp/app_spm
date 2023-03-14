import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            //padding: EdgeInsets.all(10.0),
            child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Portada_de_San_Pablo_del_Monte%2C_Tlaxcala_02.jpg/4096px-Mapcarta.jpg"),
          ),
          Container(
            child: _swiper(),
          ),
        ],
      ),
    );
  }
}

Widget _swiper() {
  return Container(
    width: double.infinity,
    height: 250.0,
    child: Swiper(
      viewportFraction: 0.8,
      scale: 0.9,
      itemBuilder: (BuildContext context,int index){
        return Image.network("https://via.placeholder.com/350x150",fit: BoxFit.fill,);
      },
      itemCount: 3,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    ),
  );
}