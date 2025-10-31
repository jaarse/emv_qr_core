
import 'package:emv_qr_core/config/shared/debug_print.dart';
import 'package:emv_qr_core/emv_qr_core.dart';
import 'package:test/test.dart';

void main() {
 test('parser', () {

    final stopwatch = Stopwatch()..start();

    final result = EmvQR.decode('00020101021126340014CO.COM.RBM.LLA0412@redeban101549250014CO.COM.RBM.RED0103RBM50290013CO.COM.RBM.CU01080000000051220013CO.COM.RBM.CA01010520400005303170550202560105802CO59010600106101062440713PASPAS12345670802001010PAS1234567110363180270016CO.COM.RBM.CANAL0103APP81250015CO.COM.RBM.CIVA01020282230014CO.COM.RBM.IVA0101083240015CO.COM.RBM.BASE0101084250015CO.COM.RBM.CINC01020285230014CO.COM.RBM.INC0101090300016CO.COM.RBM.TRXID010600000091460014CO.COM.RBM.SEC0124Y6GE3k5C2d2JQX0Asy+jkQHc630408CA');
  
    stopwatch.stop();

    debugPrint(result);
    expect(result, isA<EmvQrEntity>());

    debugPrint('⏱️ Tiempo de ejecución: ${stopwatch.elapsedMilliseconds} ms');
 });
}
