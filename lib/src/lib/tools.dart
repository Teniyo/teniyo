int _cuuids = 0;
String cuuid({String pre='e'}){
  return "$pre${_cuuids++}";
}