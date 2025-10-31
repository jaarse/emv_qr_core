This is a Dart Package:

* This package follows the EMVCo standard for parsing data for interoperable QR code payments in the banking sector.

* For now, it only decode data for Colombian QR codes 🇨🇴. Each country has its own EMVCo variant.

* Coming soon: 🇧🇷 🇲🇽
## Getting started

You can create a test:

```dart

void main() {
 test('parser', () {
   final result = EmvQR.decode('000101...@breb@nequi@wompi@bancolombia@llaves@daviplata@finandina@etc');
   debugPrint(result); //EmvQrEntity
   expect(result, isA<EmvQrEntity>()); //All tests passed!
 });
}

```

## Usage

```dart
const qrEntity = EmvQR.decode('yourEMVQrStringHere');
printn(qrEntity); // EmvQrEntity Object
```

## Message

Did I help you? You can contact me; it would make my day 😁☕️