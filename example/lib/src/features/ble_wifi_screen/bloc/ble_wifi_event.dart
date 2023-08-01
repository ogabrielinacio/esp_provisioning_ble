part of 'ble_wifi_bloc.dart';

@immutable
abstract class BleWifiEvent {}

class BleWifiInitialEvent extends BleWifiEvent {
  final Peripheral peripheral;
  final String? pop;
  BleWifiInitialEvent({required this.peripheral, this.pop = 'abcd1234'});
}

class BleWifiStartProvisioningEvent extends BleWifiEvent {}

class BleWifiScanWifiNetworksEvent extends BleWifiEvent {}

class BleWifiSendConfigEvent extends BleWifiEvent {
  final String ssid;
  final String password;
  BleWifiSendConfigEvent({required this.ssid, required this.password});
}
