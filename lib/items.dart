import 'package:flutter/material.dart';

class Items {
  final String type;
  final String description;
  final Image? image;

  Items({required this.type, required this.description, this.image});
}

final Map<String, dynamic> itemsList = {
  'Fruit': Items(
      type: 'Compost',
      description: 'Composting fruits can add nutrients to soil',
      image: Image.asset('assets/images/fruit.jpeg')),
  'Plastic Water Bottle': Items(
      type: 'Recycle',
      description: 'Recycle these, make sure they are clean',
      image: Image.asset('assets/images/plasticWaterBottle.jpeg')),
  'Battery': Items(
      type: 'Special',
      description: 'Check UCSC Environmental & Safety website'),
  'Pizza Box': Items(
      type: 'Landfill',
      description: 'Boxes covered in grease and food should be thrown away')
};
