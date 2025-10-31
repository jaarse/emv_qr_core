import 'package:emv_qr_core/config/enums/shared/emv_gui_type.dart';
import 'package:emv_qr_core/config/enums/shared/emv_qr_type.dart';

///Specific entity from EMVCo Standart
class EmvQrEntity {
  ///Convenciones QR CODE EMVCo
  final EmvIndicator? emvIndicator;

  ///Convenciones QR CODE EMVCo
  final QrType? qrType;

  ///Convenciones QR CODE EMVCo
  final EmvChecksum? crc;

  ///Convenciones QR CODE EMVCo
  final EmvSecurityField? securityField;

  ///Trade Information - Información del comercio:
  ///Multi Key immediate payments
  final EmvMerchantAccountInformation? multiKeyImmediatePayments;

  ///Trade Information - Información del comercio:
  ///Identificador de la red del adquiriente - acquirer network identifier
  final AcquirerNetworkId? acquirerNetworkId;

  ///Trade Information - Información del comercio:
  ///Código del comercio
  final MerchantCode? merchantCode;

  ///Trade Information - Información del comercio:
  ///Código del comercio agrupado a partir de la razón social del comercio
  final AggregatorMerchantCode? aggregatorMerchantCode;

  EmvQrEntity({
    this.emvIndicator,
    this.qrType,
    this.crc,
    this.securityField,
    this.multiKeyImmediatePayments,
    this.acquirerNetworkId,
    this.merchantCode,
    this.aggregatorMerchantCode,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'emvIndicator': emvIndicator?.toMap(),
      'qrType': qrType?.toMap(),
      'crc': crc?.toMap(),
      'securityField': securityField?.toMap(),
      'multiKeyImmediatePayments': multiKeyImmediatePayments?.toMap(),
      'acquirerNetworkId': acquirerNetworkId?.toMap(),
      'merchantCode': merchantCode?.toMap(),
      'aggregatorMerchantCode': aggregatorMerchantCode?.toMap(),
    };
  }


  @override
  String toString() {
    return 'EmvQrEntity(emvIndicator: $emvIndicator, qrType: $qrType, crc: $crc, securityField: $securityField, multiKeyImmediatePayments: $multiKeyImmediatePayments, acquirerNetworkId: $acquirerNetworkId, merchantCode: $merchantCode, aggregatorMerchantCode: $aggregatorMerchantCode)';
  }

  @override
  int get hashCode {
    return emvIndicator.hashCode ^
      qrType.hashCode ^
      crc.hashCode ^
      securityField.hashCode ^
      multiKeyImmediatePayments.hashCode ^
      acquirerNetworkId.hashCode ^
      merchantCode.hashCode ^
      aggregatorMerchantCode.hashCode;
  }
}


///TAG00
class EmvIndicator {
  ///Always the value has been "01"
  final String? initialTag;

  EmvIndicator({
    this.initialTag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'initialTag': initialTag,
    };
  }

  @override
  String toString() => 'EmvIndicator(initialTag: $initialTag)';

  @override
  int get hashCode => initialTag.hashCode;
}

///TAG01
class QrType {
  ///Point of initiation Method
  final EmvQrType? type;

  QrType({required this.type});

  @override
  String toString() => 'QrType(type: $type)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type?.name,
    };
  }


  @override
  int get hashCode => type.hashCode;
}


///TAG63
class EmvChecksum {
  final String? crc;

  EmvChecksum({
    this.crc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'crc': crc,
    };
  }

  factory EmvChecksum.fromMap(Map<String, dynamic> map) {
    return EmvChecksum(
      crc: map['crc'] != null ? map['crc'] as String : null,
    );
  }

  @override
  String toString() => 'EmvChecksum(crc: $crc)';

  @override
  int get hashCode => crc.hashCode;
}

///TAG91
class EmvSecurityField {
  ///GUI: Globally Unique Indetifier SEC - 00
  final EmvGuiType? gui;

  ///Security Hash 256 - 01
  final String? hash;

  EmvSecurityField({
    required this.gui,
    required this.hash,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui': gui?.name,
      'hash': hash,
    };
  }

  @override
  String toString() => 'EmvSecurityField(gui: $gui, hash: $hash)';

  @override
  int get hashCode => gui.hashCode ^ hash.hashCode;
}

///TAG26
class EmvMerchantAccountInformation {
  ///Globbaly Unique Identification LLA - 00
  final EmvGuiType? gui;

  ///cc, ce, passport - 01
  final String? identification;

  ///Phone number - 02
  final String? phoneNumber;

  ///example@evm.com - 03
  final String? email;

  ///@key123 - 04
  final String? alphanumeric;

  ///Merchant id - 05 - if this TAG has not information, please, read TAG50 (merchant code)
  final String? merchantId;

  EmvMerchantAccountInformation({
    required this.gui,
    required this.identification,
    required this.phoneNumber,
    required this.email,
    required this.alphanumeric,
    required this.merchantId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui': gui?.name,
      'identification': identification,
      'phoneNumber': phoneNumber,
      'email': email,
      'alphanumeric': alphanumeric,
      'merchantId': merchantId,
    };
  }

  @override
  String toString() {
    return 'EmvMerchantAccountInformation(gui: $gui, identification: $identification, phoneNumber: $phoneNumber, email: $email, alphanumeric: $alphanumeric, merchantId: $merchantId)';
  }

  @override
  int get hashCode {
    return gui.hashCode ^
      identification.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      alphanumeric.hashCode ^
      merchantId.hashCode;
  }
}

///TAG49
class AcquirerNetworkId {
  ///Globbaly Unique Identification RED - 00
  final EmvGuiType? gui;

  ///4 characters red identification - 01
  final String? redId;

  AcquirerNetworkId({
    this.gui,
    this.redId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui': gui?.name,
      'redId': redId,
    };
  }

  @override
  String toString() => 'AcquirerNetworkId(gui: $gui, redId: $redId)';

  @override
  int get hashCode => gui.hashCode ^ redId.hashCode;
}

///TAG50
class MerchantCode {
  ///Globbaly Unique Identification CU - 00
  final EmvGuiType? gui;

  ///Commerce code - 01
  final String? merchantCode;

  MerchantCode({
    this.gui,
    this.merchantCode,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui': gui?.name,
      'merchantCode': merchantCode,
    };
  }

  @override
  String toString() => 'MerchantCode(gui: $gui, merchantCode: $merchantCode)';

  @override
  int get hashCode => gui.hashCode ^ merchantCode.hashCode;
}


///TAG51
class AggregatorMerchantCode {
  ///Globbaly Unique Identification CA - 00
  final EmvGuiType? gui;

  ///Commerce code group from social reason
  final String? merchantCodeGroup;

  AggregatorMerchantCode({
    this.gui,
    this.merchantCodeGroup,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui': gui?.name,
      'merchantCodeGroup': merchantCodeGroup,
    };
  }

  @override
  String toString() => 'AggregatorMerchantCode(gui: $gui, merchantCodeGroup: $merchantCodeGroup)';

  @override
  int get hashCode => gui.hashCode ^ merchantCodeGroup.hashCode;
}
