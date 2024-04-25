

int getHex(String? hex){
  String color = hex ?? '';
  color = color.replaceFirst('#','');
  return int.parse('FF$color',radix:16);
}