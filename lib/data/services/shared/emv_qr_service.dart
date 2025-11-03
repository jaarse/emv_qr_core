
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
  String getQrType(String value) => value;

  ///TAG63
  String getCRC(String value){
    return value;
  }

  ///TAG64
  (TLV language, TLV name, TLV city) getMerchantInfoLanguage(String value){
    final tlvs = EmvParser.parse(value);
    final tlvLanguage = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvName = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    final tlvCity = tlvs.firstWhere((tlv) => tlv.tag == 2, orElse: () => TLV.empty());
    return (tlvLanguage, tlvName, tlvCity);
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

  ///TAG52
  int getMerchantCategoryCode(String value) => int.parse(value);

  ///TAG58
  String getCountryCode(String value) => value;

  ///TAG59
  String getMerchantName(String value) => value;

  ///TAG60
  String getMerchantCity(String value) => value;

  ///TAG61
  int getPostalCode(String value) => int.parse(value);

  ///TAG80
  (TLV gui, TLV channel) getChannel(String value){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvChannel = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvChannel);
  }



  ///IVA Condition - TAG81
  (TLV gui, TLV condition) getIvaCondition(String value, ){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvConditional = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvConditional);
  }

  //Percent or Value IVA - TAG82
  (TLV gui, TLV percent) getIvaPercent(String value, ){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvPercent = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvPercent);
  }

  ///IVA Base TAG83
  (TLV gui, TLV percent) getIvaBase(String value, ){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvBase = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvBase);
  }


  ///INC Condition - TAG84
  (TLV gui, TLV condition) getIncCondition(String value, ){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvCondition = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvCondition);
  }

  ///INC Percent - TAG85
  (TLV gui, TLV percent) getIncPercent(String value, ){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvPercent = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvPercent);
  }

  ///Consecutivo de transaccion - TAG85
  (TLV gui, TLV id) getTransactionSequentialId(String value){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvTransactionId = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    return (tlvGUI, tlvTransactionId);
  }


  ///Código del Servicio para Recaudo o Recarga - TAG92
  String getServiceCodeForCollection(String value) => value;

  ///Referencia para Recaudo o Número Celular para Recarga - TAG93
  String getReferencePaymentOrPhoneNumber(String value) => value;

  ///Tipo de Producto para Recaudo - TAG94
  String getCollectedProductType(String value) => value;

  ///Cuenta de origen - TAG95
  String getOriginAccount(String value) => value;

  ///Cuenta de destino para transferencia - TAG96
  String getDestinationAccount(String value) => value;

  ///Referencia adicional de Cuenta Destino para Transferencia - TAG97
  String getAdditionalRefDestinationAccount(String value) => value;

  ///Tipo de producto Transferencia - TAG98
  int? getTransferenceProductType(String value) => int.tryParse(value);

  ///Campo Aplicación de Descuento - TAG99
  (TLV gui, TLV indicatorDesc, TLV amountDesc, TLV ivaDesc, TLV percentDesc, TLV valueDesc, TLV inquiryDesc) getDiscountApp(String value){
    final tlvs = EmvParser.parse(value);
    final tlvGUI = tlvs.firstWhere((tlv) => tlv.tag == 0, orElse: () => TLV.empty());
    final tlvIndicatorDesc = tlvs.firstWhere((tlv) => tlv.tag == 1, orElse: () => TLV.empty());
    final tlvAmountDesc = tlvs.firstWhere((tlv) => tlv.tag == 2, orElse: () => TLV.empty());
    final tlvIvaDesc = tlvs.firstWhere((tlv) => tlv.tag == 3, orElse: () => TLV.empty());
    final tlvPercentDesc = tlvs.firstWhere((tlv) => tlv.tag == 4, orElse: () => TLV.empty());
    final tlvValueDesc = tlvs.firstWhere((tlv) => tlv.tag == 5, orElse: () => TLV.empty());
    final tlvInquiryDesc = tlvs.firstWhere((tlv) => tlv.tag == 6, orElse: () => TLV.empty());
    return (tlvGUI, tlvIndicatorDesc, tlvAmountDesc, tlvIvaDesc, tlvPercentDesc, tlvValueDesc, tlvInquiryDesc);
  }



  ///Valor de transacción _ TAG54
  int? getTransactionAmount(String value) => int.tryParse(value);





}