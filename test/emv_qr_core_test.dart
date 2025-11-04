
import 'package:emv_qr_core/config/shared/debug_print.dart';
import 'package:emv_qr_core/emv_qr_core.dart';
import 'package:test/test.dart';

void main() {
 test('parser', () {

    final stopwatch = Stopwatch()..start();
    final result = EmvQR.decode('@redeban@bancolombia@finandina@breb@ach@etc...');

    stopwatch.stop();

    debugPrint(result);
    expect(result, isA<EmvQrEntity>());

    debugPrint('⏱️ Tiempo de ejecución: ${stopwatch.elapsedMilliseconds} ms');
 });
}
