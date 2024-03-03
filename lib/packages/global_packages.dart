///this file is where we run all package exports
///this is to reduce the repetition of import statements in our code
library;

export 'package:flutter/material.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:shared_preferences/shared_preferences.dart';

export 'dart:io' hide Socket;
export 'package:flutter_svg/flutter_svg.dart';
export 'package:dio/dio.dart';

export 'package:collection/collection.dart';
// export 'package:url_launcher/url_launcher.dart';
export 'package:extended_image/extended_image.dart' hide MultipartFile;
export 'package:cached_network_image/cached_network_image.dart';
export 'package:image_picker/image_picker.dart';
export 'package:flutter/services.dart';
export 'package:skeletonizer/skeletonizer.dart';
export 'package:flutter/gestures.dart';
export 'package:dotted_border/dotted_border.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:crypto/crypto.dart';
export 'package:flutter_dotenv/flutter_dotenv.dart';
