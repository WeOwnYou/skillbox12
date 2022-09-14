import 'package:business/business.dart';
import 'package:clean_architecture/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  BlocFactory.instance.initialize();
  runApp(const MyApp());
}
