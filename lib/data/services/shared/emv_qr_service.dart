
import 'package:emv_qr_core/config/enums/shared/emv_qr_type.dart';
import 'package:emv_qr_core/config/helpers/emv_parser.dart';
import 'package:emv_qr_core/domain/entities/shared/tlv.dart';

///Colombia's Service to get data in her standart based
//Get formated data from Colombia Standart
class EmvQrService {

  ///Initial QR TAG - TAG00
  String getEmvIndicator(String value){
    if(value == '01') return value;
    throw Exception("The EMV indicator can't be defined.");
  }

  ///determine the type of QR code -TAG01
  EmvQrType getQrType(String value, int monto){
    if(value == '11') return EmvQrType.static;
    if(value == '12') return EmvQrType.dinamyc;
    if(value == '11' && monto > 0) return EmvQrType.static_hybrid;
    throw Exception("The QR Type can't be defined: ${value}, monto: ${monto}");
  }

  ///TAG63
  String getCRC(String value){
    return value;
  }


  ///Security Field - TAG91
  (TLV gui, TLV hash) getSecurityField(String value){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvHash = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvHash);
  }

  ///Security Field - TAG26
  (TLV gui, TLV id, TLV phone, TLV email, TLV numeric, TLV merchantId) getMultiKeyImmediatePayments(String value){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvId = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    final tlvPhone = tlvs.firstWhere((tlv) => tlv.tag == 2, orElse: () => TLV.empty());
    final tlvEmail = tlvs.firstWhere((tlv) => tlv.tag == 3, orElse: () => TLV.empty());
    final tlvNumeric = tlvs.firstWhere((tlv) => tlv.tag == 4, orElse: () => TLV.empty());
    final tlvMerchantId = tlvs.firstWhere((tlv) => tlv.tag == 5, orElse: () => TLV.empty());
    return (tlvGUI, tlvId, tlvPhone, tlvEmail, tlvNumeric, tlvMerchantId);
  }

  ///Security Field - TAG49
  (TLV gui, TLV red) getAcquirerNetworkId(String value){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvRed = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvRed);
  }

  ///Security Field - TAG50
  (TLV gui, TLV code) getMerchantCode(String value){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvCode = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvCode);
  }


  ///Security Field - TAG51
  (TLV gui, TLV code) getAggregatorMerchantCode(String value){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvCode = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvCode);
  }






}