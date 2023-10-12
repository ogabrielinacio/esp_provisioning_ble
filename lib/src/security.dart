import 'dart:typed_data';

import 'protos/generated/session.pb.dart';

enum SecurityState {
  request1,
  response1Request2,
  response2,
  finish,
}

abstract class ProvSecurity {
  Future<Uint8List> encrypt(Uint8List data);

  Future<Uint8List> decrypt(Uint8List data);

  Future<SessionData?> securitySession(SessionData responseData);
}
