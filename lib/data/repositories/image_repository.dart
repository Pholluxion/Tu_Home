import '../data.dart';

class ImageRepository {
  final ImageService _imageService;

  ImageRepository(this._imageService);

  Future<List<ImageModel>> getImages(String token) async {
    final response = await _imageService.getImages(token);
    if (response.statusCode == 200) {
      final imagesResponse = ImageResponse.fromJson(response.body);
      return imagesResponse.content;
    } else {
      throw Exception('Error al cargar las imagenes');
    }
  }

  Future<List<ImageModel>> getImageByPropertyId(int id, String token) async {
    final response = await _imageService.getImagesByPropertyId(token, id);
    if (response.statusCode == 200) {
      final imagesResponse = ImageList.fromJson(response.body);
      return imagesResponse.images;
    } else {
      throw Exception('Error al cargar las imagenes');
    }
  }
}
