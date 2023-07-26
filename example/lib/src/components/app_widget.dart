import 'package:flutter/material.dart';

import 'package:example/src/components/home_screen.dart';
import 'package:example/src/features/ble_screen/bloc/ble_bloc.dart';
import 'package:example/src/features/ble_wifi_screen/bloc/ble_wifi_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => BleBloc()),
          BlocProvider(create: (BuildContext context) => BleWifiBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (_) => const HomeScreen(),
          },
        ),);
  }
}
