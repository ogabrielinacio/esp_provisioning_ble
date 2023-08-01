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

  final _controller = TextEditingController(text: 'PROV_');

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
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
            return const Center(child: Text('ble permission deniedFOREVER'));
          } else if (state is BlePermissionDeniedState) {
            return const Center(child: Text('ble permission denied'));
          } else if (state is LocationDisabled) {
            return const Center(child: Text('location disabled'));
          } else if (state is PermissionLocationDenied) {
            return const Center(child: Text('location permission denied'));
          } else if (state is PermissionLocationDeniedForever) {
            return const Center(child: Text('location permission deniedForever'));
          } else if (state is PermissionLocationUnableToDetermine) {
            return const Center(child: Text('location permission unable to determine'));
          } else if (state is BleReadytoScan) {
            return const Center(child: Text('ble ready to scan'));
          } else if (state is BleScanCompleted) {
            return Column(
              children: [
                SizedBox(
          height: sizeHeight * 0.15,
          //TODO: form to change prefix and scan again button
          child: SizedBox(
            width: sizeWidth * 0.8,
            child: TextField(
              style: TextStyle(
                fontSize: sizeHeight * 0.03,
              ),
              onSubmitted: (value) async {},
              controller: _controller,
            ),
          ),
        ),
                ScanList(
                    items: state.foundedDevices,
                    icon: Icons.bluetooth,
                    onTap: (Map<String, dynamic> item, BuildContext context) {
                      Navigator.pushNamed(
                        context,
                        '/BlePasswordView',
                        arguments: {
                          'peripheralMap': item,
                        },
                      );
                    }),
              ],
            );
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
