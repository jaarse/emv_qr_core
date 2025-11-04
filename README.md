This is a Dart Package:

* This package follows the EMVCo standard for parsing data for interoperable QR code payments in the banking sector or Fintech.

* For now, it only decode data for Colombian QR codes 🇨🇴. Each country has its own EMV variant.

* Coming soon: 🇧🇷 🇲🇽

* For 🇨🇴:
  - VERSIÓN 1.4 – 2025
  - Fecha de vigencia: A partir del 21/11/2025 según documentación
  - Package operando correctamente con QRs Bancolombia (estáticos, dinámicos), Wompi App Empresas


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

## Quick Example

Do you want to access the transaction amount to be paid/collected (generally for dynamic QR codes)?

It's simple:

```dart
const qrEntity = EmvQR.decode('yourEMVQrStringHere');
print(qrEntity.transactionAmount.amount) // 123000 type int
```
## Message

Did I help you? You can contact me; it would make my day 😁☕️