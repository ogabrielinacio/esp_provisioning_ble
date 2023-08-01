import 'package:example/src/features/ble_wifi_screen/bloc/ble_wifi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BleWifiView extends StatelessWidget {
  const BleWifiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<BleWifiBloc>(context)
                  .add(BleWifiScanWifiNetworksEvent());
            },
            child: const Text('*'),
          ),
          ElevatedButton(
            onPressed: () {
              //Put here your ssis and pass
              BlocProvider.of<BleWifiBloc>(context)
                  .add(BleWifiSendConfigEvent(ssid: "ssid", password: "pass"));
            },
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}