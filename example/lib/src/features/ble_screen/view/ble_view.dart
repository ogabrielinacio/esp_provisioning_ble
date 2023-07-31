import 'package:app_settings/app_settings.dart';
import 'package:example/src/features/ble_screen/bloc/ble_bloc.dart';
import 'package:example/src/features/shared/scan_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BleView extends StatefulWidget {
  const BleView({super.key});

  @override
  State<BleView> createState() => _BleViewState();
}

class _BleViewState extends State<BleView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    BlocProvider.of<BleBloc>(context).add(BleInitialEvent());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);  
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // add event
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          "Ble Provisioning",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<BleBloc, BleState>(
        builder: (context, state) {
          if (state is BleDisabledState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  AppSettings.openAppSettings(type: AppSettingsType.bluetooth);
                },
                child: Text('Turn on bluetooth'),
              ),
            );
          } else if (state is BlePermissionDeniedForever) {
            return Text('ble permission deniedFOREVER');
          } else if (state is BlePermissionDeniedState) {
            return Text('ble permission denied');
          } else if (state is LocationDisabled) {
            return Text('location disabled');
          } else if (state is PermissionLocationDenied) {
            return Text('location permission denied');
          } else if (state is PermissionLocationDeniedForever) {
            return Text('location permission deniedForever');
          } else if (state is PermissionLocationUnableToDetermine) {
            return Text('location permission unable to determine');
          } else if (state is BleReadytoScan) {
            return Text('ble ready to scan');
          } else if (state is BleScanCompleted) {
            return ScanList(items: state.foundedDevices, icon: Icons.bluetooth,
                  onTap: (String item, BuildContext context) {
                // BlocProvider.of<BleBloc>(context).add(BleEventStopScanning());
                // BlocProvider.of<BleWifiBloc>(context)
                //     .add(BleWifiEventInitial(item));
                // Navigator.pushNamed(context, '/blePassword');
              });
          } else if (state is BleScanningError) {
            return Text('ble scan error');
          } else if (state is BleScanCompleted) {
            return Text('ble scan completed');
          } else if (state is BleEmptyList) {
            return Text('ble empty list');
          } else {
            return const SpinKitRipple(
              color: Colors.purple,
            );
          }
        },
      ),
    );
  }
}
