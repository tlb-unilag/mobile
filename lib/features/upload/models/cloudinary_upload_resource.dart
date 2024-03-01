import 'package:dio/dio.dart';

import 'cloudinary_resource_type.dart';


class CloudinaryUploadResource {
  final String? filePath;
  final List<int>? fileBytes;
  final String? uploadPreset;
  final String? fileName;
  final String? publicId;
  final String? folder;
  final CloudinaryResourceType? resourceType;
  final Map<String, dynamic>? optParams;
  final ProgressCallback? progressCallback;

  const CloudinaryUploadResource({
    this.filePath,
    this.fileBytes,
    this.uploadPreset,
    this.fileName,
    this.publicId,
    this.folder,
    this.resourceType,
    this.optParams,
    this.progressCallback,
  }) 
  : assert(filePath != null || fileBytes != null,
            'One of filePath or fileBytes must not be null');
}


// CloudinaryUploadResource(
//           filePath: file.path,
//           fileBytes: file.readAsBytesSync(),
//           resourceType: CloudinaryResourceType.image,
//           progressCallback: (count, total) {
//             print('Uploading image from file with progress: $count/$total');
//             }),