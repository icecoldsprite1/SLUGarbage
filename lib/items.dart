import 'package:flutter/material.dart';

class Items {
  final String type;
  final String description;
  final Image? image;
  final String summary;
  final String instructions;

  Items(
      {required this.type,
      required this.description,
      this.image,
      required this.summary,
      required this.instructions});
}

final Map<String, dynamic> itemsList = {
  'Fruit': Items(
      type: 'Compost',
      description: 'Composting fruits can add nutrients to soil',
      image: Image.asset('assets/images/fruit.jpeg'),
      summary: 'Organic waste from fruits',
      instructions:
          'Throw fruit waste in a compost bin or designated compost pile. Do not include any non-organic materials.'),
  'Plastic Water Bottle': Items(
      type: 'Recycle',
      description: 'Recycle these, make sure they are clean',
      image: Image.asset('assets/images/plasticWaterBottle.jpeg'),
      summary: 'Plastic water bottle made of recyclable PET plastic',
      instructions:
          'Empty and rinse the bottle before recycling. Remove the cap and check local recycling guidelines for plastic disposal.'),
  'Battery': Items(
      type: 'Special',
      description: 'Check UCSC Environmental & Safety website',
      summary: 'Used battery',
      instructions:
          'Refer to UCSC Environmental & Safety website for proper disposal instructions.'),
  'Pizza Box': Items(
      type: 'Landfill',
      description: 'Boxes covered in grease and food should be thrown away',
      summary: 'Cardboard pizza box with grease and food residue',
      instructions:
          'Dispose of in the landfill. Do not recycle due to grease contamination.'),
  'Napkins': Items(
      type: 'Landfill',
      description: 'Used napkins should be thrown away',
      summary: 'Used paper napkins',
      instructions:
          'Place used napkins in the landfill bin. Do not attempt to recycle soiled napkins.'),
  'Cardboard Box': Items(
      type: 'Recycle',
      description:
          'Make sure it is clean first. Make sure the inside is empty. Break down the box so they are flat.',
      summary: 'Empty and clean cardboard box',
      instructions:
          'Ensure the box is clean and empty. Flatten the box before recycling.'),
  'Cooking Oil': Items(
      type: 'Landfill',
      description:
          'After it cools down, throw it away, don\'t put it down the drain',
      summary: 'Used cooking oil',
      instructions:
          'Allow the cooking oil to cool down, then dispose of it in the landfill bin. Do not pour it down the drain.'),
  'Metal Cans': Items(
      type: 'Recycle',
      description: 'Empty out food and liquid first',
      summary: 'Empty metal can',
      instructions:
          'Ensure the can is empty of food and liquids before recycling.'),
  'Glass Bottles': Items(
      type: 'Recycle',
      description:
          'Rinse the bottles, remove caps, and recycle to reduce environmental impact',
      summary: 'Rinsed glass bottle',
      instructions:
          'Rinse the bottle, remove the cap, and recycle according to local recycling guidelines.'),
  'Paper Towel Rolls': Items(
      type: 'Recycle',
      description:
          'Empty rolls can be recycled; ensure they are clean before disposing of them',
      summary: 'Empty paper towel roll',
      instructions:
          'Ensure the paper towel roll is empty and clean before recycling.'),
  'Electronics': Items(
      type: 'Special',
      description:
          'Check local electronic waste disposal guidelines or recycling programs',
      summary: 'Electronic devices or components',
      instructions:
          'Refer to local guidelines for proper disposal of electronic waste or consider recycling programs.'),
  'Aluminum Foil': Items(
      type: 'Recycle',
      description:
          'Clean and crumpled aluminum foil can be recycled with other metal items',
      summary: 'Clean and crumpled aluminum foil',
      instructions:
          'Clean and crumple aluminum foil before recycling with other metal items.'),
  'Coffee Grounds': Items(
      type: 'Compost',
      description:
          'Used coffee grounds are great for composting; add them to your compost bin',
      summary: 'Used coffee grounds',
      instructions:
          'Add used coffee grounds to your compost bin or designated compost pile.'),
  'Plastic Bags': Items(
      type: 'Recycle',
      description:
          'Many grocery stores accept plastic bags for recycling; check local collection points',
      summary: 'Plastic shopping bags',
      instructions:
          'Take plastic bags to designated recycling drop-off points, often found in grocery stores.'),
  'Glass Jars': Items(
      type: 'Recycle',
      description:
          'Remove labels, rinse, and recycle glass jars to promote sustainability',
      summary: 'Rinsed glass jar',
      instructions:
          'Remove labels, rinse the glass jar, and recycle it according to local recycling guidelines.'),
  'Light Bulbs': Items(
      type: 'Special',
      description:
          'Dispose of light bulbs properly, following local guidelines or recycling programs',
      summary: 'Used light bulb',
      instructions:
          'Dispose of used light bulbs following local guidelines or consider recycling programs.'),
  'Clothing': Items(
      type: 'Donate or Recycle',
      description:
          'Consider donating wearable items; damaged textiles can be recycled',
      summary: 'Used clothing or textiles',
      instructions:
          'Donate wearable items. Damaged textiles can be recycled at designated textile recycling centers.'),
  'Printer Cartridges': Items(
      type: 'Special',
      description:
          'Many office supply stores accept used printer cartridges for recycling',
      summary: 'Used printer cartridge',
      instructions:
          'Take used printer cartridges to office supply stores participating in recycling programs.')
};
