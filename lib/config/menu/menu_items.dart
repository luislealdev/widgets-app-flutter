import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String description;
  final String url;
  final IconData icon;

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
      icon: Icons.business_center_outlined),
  MenuItem(
      title: 'Cards',
      description: 'Some Material UI 3 cards',
      url: '/cards',
      icon: Icons.card_membership_outlined),
  MenuItem(
      title: 'Progress Indicators',
      description: 'Some progress indicators examples',
      url: '/progress-indicators',
      icon: Icons.replay_outlined),
  MenuItem(
      title: 'Snackbars',
      description: 'Snackbars and dialogs',
      url: '/snackbars',
      icon: Icons.info_outline_rounded),
  MenuItem(
      title: 'Animated',
      description:
          'A widget that is animated when changing one of his properties',
      url: '/animated',
      icon: Icons.rectangle_outlined),
  MenuItem(
      title: 'UI Controlls',
      description: 'Some checkbox and switchers',
      url: '/ui-controlls',
      icon: Icons.settings_power_outlined),
  MenuItem(
      title: 'Tutorial',
      description: 'A quick app tutorial to start using the app',
      url: '/tutorial',
      icon: Icons.home),
  MenuItem(
      title: 'Infinite scroll',
      description: 'An infinite scroll with refresher',
      url: '/infinite-scroll',
      icon: Icons.list_alt_outlined),
  MenuItem(
      title: 'Counter',
      description: 'Initial UI for a counter using Riverpood',
      url: '/counter',
      icon: Icons.numbers),
];
