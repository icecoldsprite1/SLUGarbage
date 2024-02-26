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
      description: 'Boxes covered in grease and food should be thrown away'),
  'Napkins': Items(
      type: 'Landfill', description: 'Used napkins should be thrown away'),
  'Cardboard Box': Items(
      type: 'Recycle',
      description:
          'Make sure it is clean first. Make sure the inside is empty. Break down the box so they are flat.'),
  'Cooking Oil': Items(
      type: 'Landfill',
      description:
          'After its cools down, throw it away, don\'t put it down the drain'),
  'Metal Cans':
      Items(type: 'Recycle', description: 'Empty out food and liquid first')
};
