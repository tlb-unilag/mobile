import 'cloudinary_image.dart';

// from cloudinary response to cloudinary model
class CloudinaryResponseModel {
 int statusCode;
  String publicId;
  int version;
  int width;
  int height;
  String format;
  String createdAt;
  String resourceType;
  List<dynamic> tags;
  int bytes;
  String type;
  String etag;
  String url;
  String secureUrl;
  String signature;
  String originalFilename;
  String result;
  String error;
  Map<String, dynamic> deleted;
  bool partial;


  CloudinaryResponseModel({
    required this.statusCode,
    required this.publicId,
    required this.version,
    required this.width,
    required this.height,
    required this.format,
    required this.createdAt,
    required this.resourceType,
    required this.tags,
    required this.bytes,
    required this.type,
    required this.etag,
    required this.url,
    required this.secureUrl,
    required this.signature,
    required this.originalFilename,
    required this.result,
    required this.error,
    required this.deleted,
    required this.partial,
  });

  // bool get isSuccessful =>
  //     ((statusCode ??= 200) >= 200 && statusCode! < 300) && isResultOk;

  // bool get isResultOk => (error?.isEmpty ?? true) && (result ??= 'ok') == 'ok';

  // CloudinaryImage? get cloudinaryImage {
  //   try {
  //     return CloudinaryImage(secureUrl!);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return null;
  // }

 CloudinaryResponseModel.fromJson(Map<String, dynamic> map)
      : statusCode = map['status_code'] ?? 200,
        publicId = map['public_id'] ?? '',
        version = map['version'] ?? 0,
        width = map['width'] ?? 0,
        height = map['height'] ?? 0,
        format = map['format'] ?? '',
        createdAt = map['created_at'] ?? '',
        resourceType = map['resource_type'] ?? '',
        tags = map['tags'] ?? [],
        bytes = map['bytes'] ?? 0,
        type = map['type'] ?? '',
        etag = map['etag'] ?? '',
        url = map['url'] ?? '',
        secureUrl = map['secure_url'] ?? '',
        signature = map['signature'] ?? '',
        originalFilename = map['original_filename'] ?? '',
        result = map['result'] ?? 'ok',
        deleted = map['deleted'] ?? {},
        partial = map['partial'] ?? false,
        error = map['error'] ?? '';

  // CloudinaryResponseModel.fromError(this.error);

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'public_id': publicId,
        'version': version,
        'width': width,
        'height': height,
        'format': format,
        'created_at': createdAt,
        'resource_type': resourceType,
        'tags': tags,
        'bytes': bytes,
        'type': type,
        'etag': etag,
        'url': url,
        'secure_url': secureUrl,
        'signature': signature,
        'original_filename': originalFilename,
        'result': result,
        'deleted': deleted,
        'partial': partial,
      };
}
