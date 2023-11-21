enum PropertyType {
  house(
    id: 10014,
    name: 'Casa Unifamiliar',
    description:
        'Una vivienda independiente diseñada para albergar a una sola familia.',
  ),
  apartment(
    id: 10015,
    name: 'Apartamento',
    description: 'Una unidad residencial dentro de un edificio.',
  ),
  flat(
    id: 10016,
    name: 'Piso',
    description:
        'Una unidad residencial en un edificio, generalmente en uno de los pisos.',
  ),
  duplex(
    id: 10017,
    name: 'Dúplex',
    description:
        'Una estructura de dos unidades conectadas, generalmente una sobre la otra.',
  ),
  loft(
    id: 10018,
    name: 'Loft',
    description:
        'Un espacio grande y abierto, a menudo en edificios industriales.',
  ),
  mobileHome(
    id: 10019,
    name: 'Casa Móvil',
    description: 'Una vivienda prefabricada que puede transportarse.',
  ),
  estate(
    id: 10020,
    name: 'Finca',
    description:
        'Una propiedad de tierras extensas, comúnmente utilizada para actividades agrícolas o recreativas.',
  ),
  penthouse(
    id: 10021,
    name: 'Penthouse',
    description:
        'Un apartamento lujoso ubicado en la parte superior de un edificio.',
  ),
  officeSpace(
    id: 10022,
    name: 'Oficina Comercial',
    description:
        'Un espacio destinado para actividades comerciales y de oficina.',
  ),
  cabin(
    id: 10023,
    name: 'Cabaña',
    description:
        'Una pequeña casa de madera, típicamente ubicada en entornos rurales o montañosos.',
  ),
  ecoHouse(
    id: 10024,
    name: 'Casa Ecológica',
    description:
        'Una vivienda diseñada con consideraciones ambientales para minimizar su impacto en el medio ambiente.',
  ),
  farm(
    id: 10025,
    name: 'Granja',
    description:
        'Una propiedad utilizada para la agricultura y la cría de animales.',
  ),
  studioApartment(
    id: 10026,
    name: 'Apartamento Estudio',
    description:
        'Un apartamento pequeño que combina la sala de estar y el área de dormir en un solo espacio.',
  ),
  mansion(
    id: 10027,
    name: 'Mansión',
    description:
        'Una residencia grande y lujosa, a menudo con terrenos extensos.',
  ),
  apartmentBuilding(
    id: 10028,
    name: 'Edificio de Apartamentos',
    description:
        'Una estructura diseñada para albergar múltiples unidades de vivienda.',
  ),
  countryHouse(
    id: 10029,
    name: 'Casa de Campo',
    description:
        'Una propiedad rural utilizada como residencia secundaria para escapadas de fin de semana.',
  ),
  condo(
    id: 10030,
    name: 'Condominio',
    description:
        'Una propiedad en un edificio con servicios compartidos y áreas comunes.',
  ),
  chalet(
    id: 10031,
    name: 'Chalet',
    description:
        'Una casa de lujo con jardín, comúnmente ubicada en áreas suburbanas.',
  ),
  ;

  final int id;
  final String name;
  final String description;

  const PropertyType({
    required this.id,
    required this.name,
    required this.description,
  });
}
