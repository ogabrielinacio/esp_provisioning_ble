import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ESP Ble Provisioning"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Start Provisioning",
          ),
        ),
      ),
    );
  }
}
