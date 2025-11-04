///Posibles condicionales de impuestos del IVA
enum EmvConditionType {
  ///[1]: Generado por billetera
  wallet,
  ///[2]:Generado por comercio
  merchant,
  ///[3]: Debe calcularlo la billetera
  calculate_wallet,
  ///[3&&TAG82==0]:No soporta IVA
  no_supported,
}