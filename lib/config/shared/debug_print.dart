const bool kDebugMode = bool.fromEnvironment('dart.vm.product') == false;
void debugPrint(Object? object){
  // ignore: avoid_print
  if(kDebugMode) print(object);
}