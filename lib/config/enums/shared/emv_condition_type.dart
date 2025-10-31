///Posibles condicionales de impuestos del IVA
enum EmvConditionType {
  ///Generado por billetera
  wallet,
  ///Generado por comercio
  merchant,
  ///% Debe calcularlo la billetera
  calculate_wallet,
  ///No soporta IVA
  no_supported,
}