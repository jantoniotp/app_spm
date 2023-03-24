import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:san_pablo_del_monte/pages/PageContact.dart';

class PageHome extends StatelessWidget {
  List<String> images = [
    /*"https://scontent.fpbc2-1.fna.fbcdn.net/v/t39.30808-6/333520439_497884549034367_2015107795307104054_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=ma_UlLN0kJwAX_xTKPN&_nc_ht=scontent.fpbc2-1.fna&oh=00_AfCgVQAYDzFSEw7WKHkk-BEZqH6HkUHOilCD-CpnZ6U8cg&oe=641716CA",
    "https://scontent.fpbc2-4.fna.fbcdn.net/v/t39.30808-6/335146387_752879409750703_6350435857579820560_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=wlxrxxFdEs0AX8jjYiN&_nc_ht=scontent.fpbc2-4.fna&oh=00_AfD6EHfzkXcSSYglVaigUl7DkyahCiZ2ahbydY8ZeDxJgQ&oe=6416AFBE",
    "https://scontent.fpbc2-2.fna.fbcdn.net/v/t39.30808-6/335208031_739910721002316_4087718491966811549_n.jpg?stp=dst-jpg_p350x350&_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=kY2pHEipS7YAX9c6ZgV&_nc_ht=scontent.fpbc2-2.fna&oh=00_AfA1HKsJpTFnmqNRmiSyEb9WbgR8E8prAgzmQ6-4rCGerA&oe=6416AB85",
    "https://scontent.fpbc2-2.fna.fbcdn.net/v/t39.30808-6/335940171_235135438872853_745536060670967395_n.jpg?stp=cp6_dst-jpg&_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=rUKYcAWg0E8AX_cIE6o&_nc_ht=scontent.fpbc2-2.fna&oh=00_AfD5FBSIBL69kRAEmVAYG_gBm7wAg5KhnpxyMtmtsxSBBg&oe=6416E4EC",
    "https://scontent.fpbc2-2.fna.fbcdn.net/v/t39.30808-6/335444010_536740921819153_8068398634973264664_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=jyrkrg71_9EAX_2xp9S&_nc_ht=scontent.fpbc2-2.fna&oh=00_AfBmLhn9A2zE_gCGKKajjYse98E7DPVE6UNWmA4r8d39yQ&oe=6416F264"*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Portada_de_San_Pablo_del_Monte%2C_Tlaxcala_02.jpg/4096px-Mapcarta.jpg"),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            child: _swiper(images),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
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
    );
  }
}

Widget _swiper(images) {
  return Container(
    width: 370.0,
    height: 310.0,
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