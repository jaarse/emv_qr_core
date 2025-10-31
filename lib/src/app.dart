import 'package:emv_qr_core/config/injection/emv_qr_injection.dart';
import 'package:emv_qr_core/domain/entities/shared/emv_qr_entity.dart';

class EmvQR {

  EmvQR._();

  ///Initialize for Colombia, Brasil, México
  //static init(){}

  static EmvQrEntity decode(String emvQr){
    return emvQrUseCase.decode(emvQr);
  }


}