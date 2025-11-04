///Datos por solicitar al consumidor
enum EmvBeRequestedCustomer {
///A: La billetera debe solicitar dirección del comprador.
address,
//M: La billetera debe solicitar el número móvil del comprador.
phone,
///E: La billetera debe solicitar el email del comprador.
email,
}