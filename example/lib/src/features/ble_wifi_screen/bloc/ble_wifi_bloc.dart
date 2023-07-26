import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ble_wifi_event.dart';
part 'ble_wifi_state.dart';

class BleWifiBloc extends Bloc<BleWifiEvent, BleWifiState> {
  BleWifiBloc() : super(BleWifiInitial()) {
    on<BleWifiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
