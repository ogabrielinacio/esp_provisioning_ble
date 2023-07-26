import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ble_event.dart';
part 'ble_state.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  BleBloc() : super(BleInitial()) {
    on<BleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
