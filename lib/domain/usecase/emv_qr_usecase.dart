import 'package:emv_qr_core/domain/entities/shared/emv_qr_entity.dart';
import 'package:emv_qr_core/domain/repositories/emv_qr_repository.dart';

class EmvQrUseCase {

  final EmvQrRepository repository;

  EmvQrUseCase({required this.repository});

  EmvQrEntity decode(String qrData) {
    return repository.decode(qrData);
  }


}