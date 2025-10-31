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


}