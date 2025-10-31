
import 'package:emv_qr_core/config/shared/debug_print.dart';
import 'package:emv_qr_core/emv_qr_core.dart';
import 'package:test/test.dart';

void main() {
 test('parser', () {

    final stopwatch = Stopwatch()..start();

    final result = EmvQR.decode('0002015502010102125802CO5905Wompi49250103RBM0014CO.COM.RBM.RED903001060000410016CO.COM.RBM.TRXID80270103APP0016CO.COM.RBM.CANAL91460124JEuvbhcQAp0ocGQ1XNjGIIvA0014CO.COM.RBM.SEC81250102010015CO.COM.RBM.CIVA601211001 BOGOTA8223010100014CO.COM.RBM.IVA5031011000893584030013CO.COM.RBM.CU6105110018324010100015CO.COM.RBM.BASE6232030300007030000802000901A110363184250102010015CO.COM.RBM.CINC520400008523010100014CO.COM.RBM.INC530317064150002ES0105Wompi540510000630475D5');
  
    stopwatch.stop();

    debugPrint(result);
    expect(result, isA<EmvQrEntity>());

    debugPrint('⏱️ Tiempo de ejecución: ${stopwatch.elapsedMilliseconds} ms');
 });
}
