part of 'ble_bloc.dart';

@immutable
abstract class BleEvent {}

class BleInitialEvent extends BleEvent {}

class BleStatusEvent extends BleEvent {}

class BleEnabledEvent extends BleEvent {}

class BleDisabledEvent extends BleEvent {}

class BlePermissionStatusEvent extends BleEvent {
  final PermissionStatus? permissionbleStatus;
  BlePermissionStatusEvent({this.permissionbleStatus});
}

class BlePermissionRequestEvent extends BleEvent {}

class BleViewHiddenEvent extends BleEvent {}

class LocationStatusEvent extends BleEvent {}

class LocationEnabledEvent extends BleEvent {}

class LocationDisabledEvent extends BleEvent {}

class LocationPermissionStatusEvent extends BleEvent {
  final geo.LocationPermission? permissionLocationStatus;
  LocationPermissionStatusEvent({this.permissionLocationStatus});
}

class LocationPermissionRequestEvent extends BleEvent {}

class BleReadytoScanEvent extends BleEvent {}

class BleScanningEvent extends BleEvent {
  String? prefix;
  BleScanningEvent({this.prefix});
}

class BleStopScanEvent extends BleEvent {}

class BleRestartingScanEvent extends BleEvent {}

class BleScanningErrorEvent extends BleEvent {}

class BleScanCompletedEvent extends BleEvent {
  final List<String> devices;
  BleScanCompletedEvent({required this.devices});
}

class BleEmptyListEvent extends BleEvent {}