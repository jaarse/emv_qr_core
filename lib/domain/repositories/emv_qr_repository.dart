import 'package:emv_qr_core/data/services/shared/emv_qr_service.dart';
import 'package:emv_qr_core/domain/entities/shared/emv_qr_entity.dart';

abstract class EmvQrRepository {

  final EmvQrService service;
  EmvQrRepository({required this.service});

  EmvQrEntity decode(String qrData);



}