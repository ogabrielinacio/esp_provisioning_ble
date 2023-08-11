import 'package:example/src/features/ble_wifi_screen/bloc/ble_wifi_bloc.dart';
import 'package:example/src/features/ble_wifi_screen/components/scan_again_wifi_button.dart';
import 'package:example/src/features/ble_wifi_screen/components/wifi_dialog.dart';
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

  void _showDialog({required String wifi, required String deviceName, required String devicePassword,
      required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WifiDialog(
          selectedDevice: deviceName,
          passDevice: devicePassword,
          wifiName: wifi,
        );
      },
    );
  }

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
                width: sizeWidth * 0.8,
                child: const ScanAgainWifiButton(),
              ),
            );
          }else if (state is BleWifiScannedNetworksState){
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'List of founded Networks',
                    style: TextStyle(
                      fontSize: sizeHeight * 0.023,
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.6,
                    child: ScanList(
                      icon: Icons.wifi,
                      items: state.foundedNetworks,
                      onTap: (Map<String, dynamic> item, BuildContext context) {
                          _showDialog(
                            wifi: "wifi",
                            deviceName: "name",
                            devicePassword: "devicePass",
                            context: context,
                          );
                      }),
                    ),
                  SizedBox(
                    width: sizeWidth * 0.8,
                    child: const ScanAgainWifiButton(),
                  ),
                ],
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
