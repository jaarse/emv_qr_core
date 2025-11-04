This is a Dart Package:

* This package follows the EMVCo standard for parsing data for interoperable QR code payments in the banking sector or Fintech.

* For now, it only decode data for Colombian QR codes 🇨🇴. Each country has its own EMV variant.

* Coming soon: 🇧🇷 🇲🇽

* For 🇨🇴:
  - VERSIÓN 1.4 – 2025
  - Fecha de vigencia: A partir del 21/11/2025 según documentación
  - Package operando correctamente con QRs Bancolombia (estáticos, dinámicos), Wompi App Empresas, Llaves...


## Getting started


You can create a test:

```dart

void main() {
 test('parser', () {
       final result = EmvQR.decode('@redeban@bancolombia@finandina@breb@ach@etc...');
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
print(qrEntity.transactionAmount.amount) // 123000  $$$ type int
```

I've included **PDF documentation**  in the repository's **[assets](https://github.com/jaarse/emv_qr_core/tree/main/assets)** to provide more context and information about each of the established fields. You can access it using EmvQrEntity.property.subproperty.


## Issues 🦗

If there is a problem with any data analysis, it is suggested to read the logs first; if it is still unclear, open an issue in the repository and leave the QR or String you are using for testing.

## Message 👀

Did I help you? You can contact me; it would make my day 😁☕️
