import '../data.dart';

class PropertyRepository {
  final PropertyService _propertyService;

  PropertyRepository(this._propertyService);

  Future<Property> getProperty(int id, String token) async {
    final response = await _propertyService.getProperty(token, id);
    return Property.fromJson(response.body);
  }
}
