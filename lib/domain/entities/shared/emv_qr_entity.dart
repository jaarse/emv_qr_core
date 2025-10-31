import 'package:emv_qr_core/config/enums/shared/emv_channel_type.dart';
import 'package:emv_qr_core/config/enums/shared/emv_gui_type.dart';
import 'package:emv_qr_core/config/enums/shared/emv_condition_type.dart';
import 'package:emv_qr_core/config/enums/shared/emv_qr_type.dart';

///Specific entity from EMVCo Standart
class EmvQrEntity {
  ///1.Convenciones QR CODE EMVCo
  ///
  ///[TAG00]
  final EmvIndicator? emvIndicator;

  ///1.Convenciones QR CODE EMVCo
  ///
  ///[TAG01]
  final QrType? qrType;

  ///1.Convenciones QR CODE EMVCo
  ///
  ///[TAG63]
  final EmvChecksum? crc;

  ///1.Convenciones QR CODE EMVCo
  ///
  ///[TAG91]
  final EmvSecurityField? securityField;

  ///2. Merchant Information - Información del comercio:
  ///Multi Key immediate payments
  ///
  ///[TAG26]
  final EmvMerchantAccountInformation? multiKeyImmediatePayments;

  ///2. Merchant Information - Información del comercio:
  ///Identificador de la red del adquiriente - acquirer network identifier
  ///
  ///[TAG49]
  final AcquirerNetworkId? acquirerNetworkId;

  ///2. Merchant Information - Información del comercio:
  ///Código del comercio
  ///
  ///[TAG50]
  final MerchantCode? merchantCode;

  ///2. Merchant Information - Información del comercio:
  ///Código del comercio agrupado a partir de la razón social del comercio
  ///
  ///[TAG51]
  final AggregatorMerchantCode? aggregatorMerchantCode;

  ///3. Información adicional del comercio
  ///MCC - Código de categoría del comercio
  ///
  ///[TAG52]
  final MerchantCategoryCode? merchantCategoryCode;

  ///3. Información adicional del comercio
  ///Código del país
  ///
  ///[TAG58]
  final CountryCode? countryCode;

  ///3. Información adicional del comercio
  ///Nombre del comercio
  ///
  ///[TAG59]
  final MerchantName? merchantName;

  ///3. Información adicional del comercio
  ///Nombre del comercio
  ///
  ///[TAG060]
  final MerchantCity? merchantCity;

  ///3. Información adicional del comercio
  ///Geo-referencia del comercio
  ///
  ///[TAG61]
  final PostalCode? postalCode;

  ///4. Información adicional del comercio
  ///Identificación del canal que realizó la petición para el QR
  ///Coexiste con subTAG 11 del TAG62 "Canal de origen" (Mismo fin)
  ///
  ///[TAG80]
  final Channel? channel;

  ///4. Información adicional del comercio
  ///Condición del IVA
  ///Si 'condition' es '03' y TAG82 es 0, no soporta IVA
  ///
  ///[TAG81]
  final IvaCondition? ivaCondition;

  ///4. Información adicional del comercio
  ///IVA - Valor o porcentaje del IVA
  ///
  ///[TAG82]
  final IvaPercent? ivaPercent;

  ///4. Información adicional del comercio
  ///IVA - Valor de la base del iva
  ///
  ///[TAG83]
  final IvaBase? ivaBase;

  ///4. Información adicional del comercio
  ///INC - Condicional del impuesto INC
  ///Si 'condition' es '03' y TAG85 es 0, no soporta INC
  ///
  ///[TAG84]
  final IncCondition? incCondition;

  ///4. Información adicional del comercio
  ///Inc - Valor o porcentaje del impuesto del INC
  ///
  ///[TAG85]
  final IncPercent? incPercent;

  ///4. Información adicional del comercio
  ///Consecutivo de transacción - Id de transacción. para QR estático 000000
  ///
  ///[TAG90]
  final TransactionSequentialId? transactionSequentialId;





  ///5. Detalle de la transacción
  ///Valor de la transacción
  ///Valor bruto, no incluye impuestos, propina, etc.
  final TransactionAmount? transactionAmount;



  EmvQrEntity({
    this.emvIndicator,
    this.qrType,
    this.crc,
    this.securityField,
    this.multiKeyImmediatePayments,
    this.acquirerNetworkId,
    this.merchantCode,
    this.aggregatorMerchantCode,
    this.merchantCategoryCode,
    this.countryCode,
    this.merchantName,
    this.merchantCity,
    this.postalCode,
    this.channel,
    this.ivaCondition,
    this.ivaPercent,
    this.ivaBase, 
    this.incCondition, 
    this.incPercent, 
    this.transactionSequentialId,




    this.transactionAmount,
  });

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


///TAG52
class MerchantCategoryCode {
  int? code;

  MerchantCategoryCode({
    this.code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
    };
  }
  @override
  String toString() => 'MerchantCategoryCode(code: $code)';

  @override
  int get hashCode => code.hashCode;
}

///TAG58
class CountryCode {
  String? code;

  CountryCode({
    this.code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
    };
  }
  @override
  String toString() => 'CountryCode(code: $code)';

  @override
  int get hashCode => code.hashCode;
}


///TAG59
class MerchantName {
  String? name;

  MerchantName({
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }
  @override
  String toString() => 'MerchantName(name: $name)';

  @override
  int get hashCode => name.hashCode;
}


///TAG60
class MerchantCity {
  String? city;

  MerchantCity({
    this.city,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
    };
  }
  @override
  String toString() => 'MerchantCity(city: $city)';

  @override
  int get hashCode => city.hashCode;
}

///TAG61
class PostalCode {
  int? code;

  PostalCode({
    this.code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
    };
  }
  @override
  String toString() => 'PostalCode(code: $code)';

  @override
  int get hashCode => code.hashCode;
}


///TAG80
class Channel {
  EmvGuiType? gui;
  EmvChannelType? channel;

  Channel({
    this.gui,
    this.channel
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui': gui?.name,
      'channel': channel?.name,
    };
  }
  @override
  String toString() => 'Channel(gui: $gui, channel: ${channel?.name})';

  @override
  int get hashCode => gui.hashCode ^ channel.hashCode;
}


///TAG81
class IvaCondition {
  EmvGuiType? gui;
  EmvConditionType? condition;

  IvaCondition({
    this.gui,
    this.condition
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui': gui?.name,
      'condition': condition?.name,
    };
  }
  @override
  String toString() => 'IvaCondition(gui: $gui, IvaConconditiondition: ${condition?.name})';

  @override
  int get hashCode => gui.hashCode ^ condition.hashCode;
}


///TAG82
class IvaPercent {
  EmvGuiType? gui;
  int? percent;

  IvaPercent({
    this.gui,
    this.percent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui' : gui,
      'percent': percent,
    };
  }
  @override
  String toString() => 'IvaPercent(gui: $gui, percent: $percent)';

  @override
  int get hashCode => gui.hashCode ^ percent.hashCode;
}


///TAG83
class IvaBase {
  EmvGuiType? gui;
  int? base;

  IvaBase({
    this.gui,
    this.base,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui' : gui,
      'base': base,
    };
  }
  @override
  String toString() => 'IvaBase(gui: $gui, base: $base)';

  @override
  int get hashCode => gui.hashCode ^ base.hashCode;
}



///TAG84
class IncCondition {
  EmvGuiType? gui;
  EmvConditionType? condition;

  IncCondition({
    this.gui,
    this.condition
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui': gui?.name,
      'condition': condition?.name,
    };
  }
  @override
  String toString() => 'IncCondition(gui: $gui, : ${condition?.name})';

  @override
  int get hashCode => gui.hashCode ^ condition.hashCode;
}

///TAG85
class IncPercent {
  EmvGuiType? gui;
  int? percent;

  IncPercent({
    this.gui,
    this.percent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui' : gui,
      'percent': percent,
    };
  }
  @override
  String toString() => 'IncPercent(gui: $gui, percent: $percent)';

  @override
  int get hashCode => gui.hashCode ^ percent.hashCode;
}

///TAG90
class TransactionSequentialId {
  EmvGuiType? gui;
  String? id;

  TransactionSequentialId({
    this.gui,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gui' : gui,
      'id': id,
    };
  }
  @override
  String toString() => 'TransactionSequentialId(gui: $gui, id: $id)';

  @override
  int get hashCode => gui.hashCode ^ id.hashCode;
}





















///TAG54
class TransactionAmount {
  ///Valor bruto, no incluye impuestos ni propina
  int? amount;

  TransactionAmount({
    this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
    };
  }
  @override
  String toString() => 'TransactionAmount(amount: $amount)';

  @override
  int get hashCode => amount.hashCode;
}

