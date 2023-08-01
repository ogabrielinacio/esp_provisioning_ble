import 'package:example/src/features/ble_wifi_screen/bloc/ble_wifi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BleWifiView extends StatelessWidget {
  const BleWifiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<BleWifiBloc>(context)
              .add(BleWifiScanWifiNetworksEvent());
        },
        child: Text('*'),
      ),
    );
  }
}