import 'package:emv_qr_core/config/enums/shared/emv_channel_type.dart';
import 'package:emv_qr_core/config/enums/shared/emv_gui_type.dart';
import 'package:emv_qr_core/config/enums/shared/emv_condition_type.dart';
import 'package:emv_qr_core/config/enums/shared/emv_qr_type.dart';
import 'package:emv_qr_core/config/shared/debug_print.dart';
import 'package:emv_qr_core/domain/entities/shared/tlv.dart';

///String analizer
class EmvParser {

  EmvParser._();

  ///Analiza una cadena siguiendo reglas y devuelve un modelo o estructura con significado
  static List<TLV> parse(String value){
    try {
      String unformatedString = value;
      final List<TLV> segmentedData = [];
      while(unformatedString.isNotEmpty){

        final tag = int.parse(unformatedString.substring(0, 2));
        final length = int.parse(unformatedString.substring(2, 4));
        final value = unformatedString.substring(4, 4+length);
        segmentedData.add(TLV(tag: tag, length: length, value: value));
        unformatedString = unformatedString.substring(4+length);
        //debugPrint('TAG ${tag}, LENGTH: ${length}, VALUE: ${value}, NEWTLV: ${unformatedString}');
        debugPrint('TAG ${tag}, LENGTH: ${length}, VALUE: ${value}');
      }

      return segmentedData;
    } catch (e) {
      debugPrint('EmvParser Error parsing data: ${e.toString()}');
      throw Exception('EmvParser Error parsing data: ${e.toString()}');
    }
  }


  static EmvQrType defineQrType(String value, int monto){
    if(value == '11' && monto > 0) return EmvQrType.static_hybrid;
    if(value == '11') return EmvQrType.static;
    if(value == '12') return EmvQrType.dinamyc;
    throw Exception("The QR Type can't be defined: ${value}, monto: ${monto}");
  }

  static EmvGuiType defineGUIType(String gui){
    if(gui.contains('CO.COM.RBM')) return EmvGuiType.RBM;
    if(gui.contains('CO.COM.CRB')) return EmvGuiType.CRB;
    if(gui.contains('CO.COM.RED')) return EmvGuiType.RED;
    throw Exception('GUI Type not found: gui: $gui');

  }

  ///PARA IVA: Depende del valor o porcentaje del IVA.
  ///PARA INC: Depende del valor o porcentaje del INC.
  static EmvConditionType? defineCondition(String condition, int ivaPercent){
    if(condition == '03' && ivaPercent == 0) return EmvConditionType.no_supported;
    if(condition == '01') return EmvConditionType.wallet;
    if(condition == '02') return EmvConditionType.merchant;
    if(condition == '03') return EmvConditionType.calculate_wallet;
    throw Exception('Condition not found: condition: $condition');
  }

  ///Determina el type para el canal que realizó la petición para generar el QR (generador del QR)
  static EmvChannelType defineChannel(String channel){
    return EmvChannelType.values.firstWhere((channelType) => channelType.name.toUpperCase() == channel);
  }


}