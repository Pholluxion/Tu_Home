enum DocType {
  cC(value: 'Cédula de ciudadanía'),
  cCDig(value: 'Cédula Electrónica'),
  cE(value: 'Cédula de extranjería'),
  passport(value: 'Pasaporte');

  final String value;

  const DocType({required this.value});
}
