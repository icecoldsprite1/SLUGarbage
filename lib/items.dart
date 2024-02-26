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
      Items(type: 'Recycle', description: 'Empty out food and liquid first'),
  'Glass Bottles': Items(
      type: 'Recycle',
      description:
          'Rinse the bottles, remove caps, and recycle to reduce environmental impact'),
  'Paper Towel Rolls': Items(
      type: 'Recycle',
      description:
          'Empty rolls can be recycled; ensure they are clean before disposing of them'),
  'Electronics': Items(
      type: 'Special',
      description:
          'Check local electronic waste disposal guidelines or recycling programs'),
  'Aluminum Foil': Items(
      type: 'Recycle',
      description:
          'Clean and crumpled aluminum foil can be recycled with other metal items'),
  'Coffee Grounds': Items(
      type: 'Compost',
      description:
          'Used coffee grounds are great for composting; add them to your compost bin'),
  'Plastic Bags': Items(
      type: 'Recycle',
      description:
          'Many grocery stores accept plastic bags for recycling; check local collection points'),
  'Glass Jars': Items(
      type: 'Recycle',
      description:
          'Remove labels, rinse, and recycle glass jars to promote sustainability'),
  'Light Bulbs': Items(
      type: 'Special',
      description:
          'Dispose of light bulbs properly, following local guidelines or recycling programs'),
  'Clothing': Items(
      type: 'Donate or Recycle',
      description:
          'Consider donating wearable items; damaged textiles can be recycled'),
  'Printer Cartridges': Items(
      type: 'Special',
      description:
          'Many office supply stores accept used printer cartridges for recycling')
};
