import 'package:example/src/features/ble_wifi_screen/bloc/ble_wifi_bloc.dart';
import 'package:example/src/features/shared/scan_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BleWifiView extends StatefulWidget {
  const BleWifiView({super.key});

  @override
  State<BleWifiView> createState() => _BleWifiViewState();
}

class _BleWifiViewState extends State<BleWifiView> {

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Scan Wifi',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<BleWifiBloc, BleWifiState>(
        builder: (context, state) {
          if(state is BleWifiEstablishedConnectionState){
          return Center(
            child: SizedBox(
              height: sizeHeight /2,
              child: const ScanList(
                icon: Icons.wifi,
                items: [],
              ),
            ),
          );
          }else if (state is BleWifiEstablishedConnectionFailedState){
            return const Center(child: Text("connection failed"));
          }else{
            return const SpinKitRipple(
              color: Colors.purple,
            );
          }
        },
      ),
    );
  }
}
