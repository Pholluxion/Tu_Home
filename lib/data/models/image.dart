class ImageResponse {
  ImageResponse({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.page,
    required this.size,
    required this.sort,
  });

  final List<ImageModel> content;
  final int totalElements;
  final int totalPages;
  final int page;
  final int size;
  final List<String> sort;

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
        content: List<ImageModel>.from(
            json['content'].map((x) => ImageModel.fromJson(x))),
        totalElements: json['totalElements'],
        totalPages: json['totalPages'],
        page: json['page'],
        size: json['size'],
        sort: List<String>.from(json['sort'].map((x) => x)),
      );
}

class ImageModel {
  ImageModel({
    required this.id,
    required this.name,
    required this.url,
    required this.property,
  });

  final String id;
  final String name;
  final String url;
  final int property;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json['id'],
        name: json['name'],
        url: json['url'],
        property: json['property'],
      );
}

class ImageList {
  final List<ImageModel> images;

  ImageList({required this.images});

  factory ImageList.fromJson(List<dynamic> parsedJson) {
    List<ImageModel> images = <ImageModel>[];
    images = parsedJson.map((i) => ImageModel.fromJson(i)).toList();

    return ImageList(images: images);
  }
}
