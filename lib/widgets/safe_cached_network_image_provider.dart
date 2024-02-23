
import 'package:taro_leaf_blight/packages/global_packages.dart';

class SafeCachedNetworkImageProvider extends CachedNetworkImageProvider {
  final ImageProvider? fallbackImage;

  const SafeCachedNetworkImageProvider(String url, {this.fallbackImage}) : super(url);

  @override
  ImageStreamCompleter loadImage(
      CachedNetworkImageProvider key, ImageDecoderCallback decode) {
    try {
      return super.loadImage(key, decode);
    } catch (e) {
      if (fallbackImage != null) {
        return fallbackImage!.loadImage(fallbackImage!, decode);
      }
      // Emit an error through the ImageStream
      final errorCompleter = ErrorImageStreamCompleter();
      errorCompleter.setError(e, StackTrace.current);
      return errorCompleter;
    }
  }
}

class ErrorImageStreamCompleter extends ImageStreamCompleter {
  void setError(Object error, StackTrace stackTrace) {
    reportError(
      context: ErrorDescription('Error in ImageStreamCompleter'),
      exception: error,
      stack: stackTrace,
    );
  }
}


