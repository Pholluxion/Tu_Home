enum DocType {
  cC(value: 'Cédula de ciudadanía', id: 10000),
  cCDig(value: 'Cédula Electrónica', id: 10001),
  cE(value: 'Cédula de extranjería', id: 10002),
  passport(value: 'Pasaporte', id: 10003);

  final String value;
  final int id;

  const DocType({
    required this.value,
    required this.id,
  });
}
