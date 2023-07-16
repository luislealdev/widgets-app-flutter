import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String description;
  final String url;
  final Icon icon;

  const MenuItem(
      {required this.title,
      required this.description,
      required this.url,
      required this.icon});
}

const menuItems = <MenuItem>[
  MenuItem(
      title: 'Buttons',
      description: 'Some Material UI 3 buttons',
      url: '/buttons',
      icon: Icon(Icons.radio_button_checked_rounded)),
  MenuItem(
      title: 'Cards',
      description: 'Some Material UI 3 cards',
      url: '/cards',
      icon: Icon(Icons.card_membership_outlined))
];
