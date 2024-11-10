
import 'package:flutter/material.dart';

class MenuItems{
  static const profile = MenuItem(name: "profile", icon: Icons.person);
  static const home= MenuItem(name: "Home ", icon: Icons.home);
  static const setting= MenuItem(name: "Setting", icon: Icons.settings);
  static const info= MenuItem(name: "info", icon: Icons.info);
  static const all = <MenuItem>[
    home,profile,setting,info
  ];
}
class MenuItem{
  final String name;
  final IconData icon;

  const MenuItem({required this.name, required this.icon});
}
