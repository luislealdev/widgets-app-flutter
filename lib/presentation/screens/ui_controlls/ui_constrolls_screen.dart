import 'package:flutter/material.dart';

class UiControllsScreen extends StatelessWidget {
  const UiControllsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controlls"),
      ),
      body: const _ControllersView(),
    );
  }
}

class _ControllersView extends StatefulWidget {
  const _ControllersView();

  @override
  State<_ControllersView> createState() => _ControllersViewState();
}

enum Transportation { car, plane, boat, submarine }

class _ControllersViewState extends State<_ControllersView> {
  bool isDeveloper = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  Transportation selectedTransportation = Transportation.car;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Developer Mode"),
          subtitle: const Text("Controles adicionales"),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text("Transportation"),
          subtitle: Text("Selected: $selectedTransportation"),
          children: [
            RadioListTile(
                title: const Text("By car"),
                subtitle: const Text("Travel by car"),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text("By plane"),
                subtitle: const Text("Travel by plane"),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.plane;
                    })),
            RadioListTile(
                title: const Text("By boat"),
                subtitle: const Text("Travel by boat"),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text("By submarine"),
                subtitle: const Text("Travel by submarine"),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.submarine;
                    })),
          ],
        ),
        CheckboxListTile(
            value: wantsBreakfast,
            title: const Text("Breakfast"),
            subtitle: const Text("Add breakfast to hotel bill"),
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),
        CheckboxListTile(
            value: wantsLunch,
            title: const Text("Lunch"),
            subtitle: const Text("Add lunch to hotel bill"),
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            value: wantsDinner,
            title: const Text("Dinner"),
            subtitle: const Text("Add dinner to hotel bill"),
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                }))
      ],
    );
  }
}
