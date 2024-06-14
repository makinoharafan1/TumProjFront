import 'package:flutter/material.dart';
import 'package:puble_frontend/models/side_menu_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Home'),
    MenuModel(icon: Icons.logout, title: 'Sign out'),
  ];
}
