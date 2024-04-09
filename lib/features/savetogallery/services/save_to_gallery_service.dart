import 'dart:io';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class SaveToGalleryService {
  Future<void> downloadImage({
    required String? url,
  }) async {
    Dialogs.showLoadingDialog();
    ResponseModel res = await SaveToGalleryRepo().getImage(imageUrl: url);
    pop();
    if (res.valid) {
      late String message;
      try {
        final dir = await getTemporaryDirectory();

        var filename = '${dir.path}/taroleafblightcapture${DateTime.now()}.png';

        // print("${dir} ");
        // Save to filesystem
        final file = File(filename);

        print("this is the data${res}");

        print("this is bodyBytes${res.data.bodyBytes}");
        await file.writeAsBytes(res.data.bodyBytes);

        // Ask the user to save it
        final params = SaveFileDialogParams(sourceFilePath: file.path);
        final finalPath = await FlutterFileDialog.saveFile(params: params);

        if (finalPath != null) {
          message = 'Download Successful';
        }
        Dialogs.showSuccessSnackbar(message: message);
      } catch (e) {
        message = e.toString();
        Dialogs.showErrorSnackbar(message: message);
      }
    } else {
      Dialogs.showErrorSnackbar(message: res.error!.message!);
    }
  }
}

class SaveToGalleryRepo {
  SaveToGalleryRepo({this.imageUrl});

  String? imageUrl;
  final BackendService _apiService = BackendService(Dio());

  SaveToGalleryRepo copyWith({String? imageUrl}) {
    return SaveToGalleryRepo(imageUrl: imageUrl);
  }

  Future<ResponseModel> getImage({
    required String? imageUrl,
  }) async {
    Response response = await _apiService.runCall(
      _apiService.dio.get(imageUrl!),
    );

    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel(
          valid: true,
          statusCode: statusCode,
          message: response.statusMessage,
          data: response.data);
    }
    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }
}

var saveToGalleryService = SaveToGalleryService();
