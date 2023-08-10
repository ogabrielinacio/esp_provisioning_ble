import 'package:example/src/features/ble_wifi_screen/bloc/ble_wifi_bloc.dart';
import 'package:example/src/features/shared/scan_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BleWifiView extends StatefulWidget {
  const BleWifiView({super.key});

  @override
  State<BleWifiView> createState() => _BleWifiViewState();
}

class _BleWifiViewState extends State<BleWifiView> {

  @override
  void initState() {
    super.initState();
    //BlocProvider.of<BleWifiBloc>(context).add(BleWifiScanWifiNetworksEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Wifi'),
      ),
      body: BlocBuilder<BleWifiBloc, BleWifiState>(
        builder: (context, state) {
          return ScanList(
            icon: Icons.wifi,
            items: [],
          );
        },
      ),
    );
  }
}
