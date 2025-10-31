import 'package:emv_qr_core/config/enums/shared/emv_gui_type.dart';
import 'package:emv_qr_core/config/helpers/emv_parser.dart';
import 'package:emv_qr_core/config/shared/debug_print.dart';
import 'package:emv_qr_core/domain/entities/shared/emv_qr_entity.dart';
import 'package:emv_qr_core/domain/repositories/emv_qr_repository.dart';

class EmvQrRepositoryImpl extends EmvQrRepository {


  EmvQrRepositoryImpl({required super.service});

  @override
  EmvQrEntity decode(String qrData) {
    try {
      debugPrint('Parsing EMV QR');
      final tlvs = EmvParser.parse(qrData); //Tag Length Values source fragmented by Tag

      EmvIndicator? emvIndicator;
      QrType? qrType;
      EmvChecksum? crc;
      EmvSecurityField? securityField;
      EmvMerchantAccountInformation? multiKeyImmediatePayments;
      AcquirerNetworkId? acquirerNetworkId;
      MerchantCode? merchantCode;
      AggregatorMerchantCode? aggregatorMerchantCode;

      tlvs.forEach((tlv) {
        debugPrint('\nParseando TLV internamente: $tlv : --> ');

        switch (tlv.tag) {

          case 0:
            emvIndicator = EmvIndicator(initialTag: service.getEmvIndicator(tlv.value));
            break;

          case 1:
            qrType = QrType(type: service.getQrType(tlv.value, 0) );
            break;

          case 63:
            crc = EmvChecksum(crc: service.getCRC(tlv.value));
            break;

          case 91:
            final (gui, hash) = service.getSecurityField(tlv.value);
            securityField = EmvSecurityField(
              gui: defineGUIType(gui.value),
              hash: hash.value,
            );
            break;

          case 26:
            final (gui, id, phone, email, numeric, merchantId) = service.getMultiKeyImmediatePayments(tlv.value);
            multiKeyImmediatePayments = EmvMerchantAccountInformation(
              gui: defineGUIType(gui.value),
              identification: id.value,
              phoneNumber: phone.value,
              email: email.value,
              alphanumeric: numeric.value,
              merchantId: merchantId.value,
            );
            break;

          case 49:
            final (gui, red) = service.getAcquirerNetworkId(tlv.value);
            acquirerNetworkId = AcquirerNetworkId(
              gui: defineGUIType(gui.value), 
              redId: red.value,
            );
            break;

          case 50:
            final (gui, code) = service.getMerchantCode(tlv.value);
            merchantCode = MerchantCode(
              gui: defineGUIType(gui.value), 
              merchantCode: code.value,
            );
            break;

          case 51:
            final (gui, code) = service.getAggregatorMerchantCode(tlv.value);
            aggregatorMerchantCode = AggregatorMerchantCode(
              gui: defineGUIType(gui.value), 
              merchantCodeGroup: code.value,
            );
            break;

          default:
            break;
        }
        debugPrint('\n');
      });

      final emvQr = EmvQrEntity(
        emvIndicator: emvIndicator,
        qrType: qrType,
        crc: crc,
        securityField: securityField,
        multiKeyImmediatePayments: multiKeyImmediatePayments,
        acquirerNetworkId: acquirerNetworkId,
        merchantCode: merchantCode,
        aggregatorMerchantCode: aggregatorMerchantCode,
      );
      
      return emvQr;

    } catch (e) {
      debugPrint('Error Parsing EMV QR: ${e.toString()}');
      throw Exception(e.toString());
    }
  }

  EmvGuiType defineGUIType(String gui){
    return gui.contains('CO.COM.RBM') ? EmvGuiType.RBM : EmvGuiType.CRB;
  }
}
