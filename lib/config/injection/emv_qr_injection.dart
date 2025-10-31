import 'package:emv_qr_core/data/implementations/emv_qr_repository_impl.dart';
import 'package:emv_qr_core/data/services/shared/emv_qr_service.dart';
import 'package:emv_qr_core/domain/usecase/emv_qr_usecase.dart';

final _service = EmvQrService();

final _repository = EmvQrRepositoryImpl(service: _service);

final emvQrUseCase = EmvQrUseCase(repository: _repository);