import 'package:example/src/features/ble_wifi_screen/bloc/ble_wifi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlePasswordView extends StatefulWidget {
  const BlePasswordView({Key? key}) : super(key: key);

  @override
  State<BlePasswordView> createState() => _BlePasswordViewState();
}

class _BlePasswordViewState extends State<BlePasswordView> {
  final _controller = TextEditingController(text: 'abcd1234');

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    Map<String, dynamic> peripheralMap = args['peripheralMap'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          "Ble Provisioning Password",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: sizeHeight * 0.2,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: sizeWidth * 0.1,
              left: sizeWidth * 0.1,
            ),
            child: Text(
              'Enter your proof of possession PIN for the device:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sizeHeight * 0.03,
              ),
            ),
          ),
          SizedBox(
            height: sizeHeight * 0.04,
          ),
          SizedBox(
            width: sizeWidth * 0.8,
            child: TextField(
              style: TextStyle(
                fontSize: sizeHeight * 0.03,
              ),
              onSubmitted: (value) async {},
              controller: _controller,
            ),
          ),
          SizedBox(
            height: sizeHeight * 0.04,
          ),
          SizedBox(
            width: sizeWidth * 0.7,
            height: sizeHeight * 0.08,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () {
                BlocProvider.of<BleWifiBloc>(context).add(BleWifiInitialEvent(
                    peripheral: peripheralMap['instance'], pop: 'abcd1234'));
                BlocProvider.of<BleWifiBloc>(context)
                    .add(BleWifiStartProvisioningEvent());
                Navigator.pushNamed(context, '/bleWifiScreen');
              },
              child: Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: sizeHeight * 0.023,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
