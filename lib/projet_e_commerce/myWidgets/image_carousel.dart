import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/const/images.dart';

class ImageCarrousel extends StatelessWidget {
  const ImageCarrousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.8,
          child: CarouselSlider(
            options: CarouselOptions(autoPlay: true, viewportFraction: 1.0),
            items: [
              Image.asset(listeImageCarrousel[0], fit: BoxFit.cover),
              Image.asset(listeImageCarrousel[1], fit: BoxFit.cover),
              Image.asset(listeImageCarrousel[2], fit: BoxFit.cover),
              Image.asset(listeImageCarrousel[3], fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}
