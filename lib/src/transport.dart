import 'dart:typed_data';

/// A set of necessary methods to implement with a Bluetooth package
/// and provide the provisioning transport functionality to [EspProv].
abstract class ProvTransport {
  Future<bool> connect();

  Future<bool> checkConnect();

  Future<bool> disconnect();

  Future<Uint8List> sendReceive(String epName, Uint8List data);
}
