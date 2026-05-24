import 'package:flutter/material.dart';

class ServiceModel {
  final String id;
  final String name;
  final String tagline;
  final String description;
  final List<String> features;
  final IconData icon;
  final Color color;
  final Color gradientEnd;

  const ServiceModel({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.features,
    required this.icon,
    required this.color,
    required this.gradientEnd,
  });
}
