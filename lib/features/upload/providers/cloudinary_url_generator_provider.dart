import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:taro_leaf_blight/core/utils/string_exception.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_provider.dart';
import 'package:taro_leaf_blight/features/upload/models/cloudinary_resource_type.dart';
import 'package:taro_leaf_blight/features/upload/models/cloudinary_upload_resource.dart';
import 'package:taro_leaf_blight/features/upload/service/cloudinary_api_service.dart';
import 'package:taro_leaf_blight/features/upload/service/cloudinary_client.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

final generateUrlProvider =
    FutureProvider.family.autoDispose((ref, File file) async {
  var res = cloudinaryClient.uploadResource(CloudinaryUploadResource(
      filePath: file.path,
      fileBytes: file.readAsBytesSync(),
      resourceType: CloudinaryResourceType.image,
      progressCallback: (count, total) {
        print(
          'Uploading image from file with progress: $count/$total');
        })
      );
  // if (!res.valid) {
  //   throw StringException(res.message ?? 'Something went wrong');
  // }
  // it doesn't throw an error , its just in the loading state

  // why do i see all this after the error has been thrown ?

  // its like the error already happens before the exception is thrown

  print('${res} this is where res is from');
  // if (!res.valid) {
  //   // we can see , that the !res.valid but it is still stuck in the loading state ,
  //   print("-----------------yes yes yes an error occurred-------------------");
  //   throw StringException(res.message ?? 'Something went wrong');
  // }
  return res;
});

// the urlGenService will not actually be exposed externally , we would just have its value
// gotten from this provider when an image is picked, then passed to it to generate the url
// error handling states
//In Riverpod, refreshing a provider will not automatically refresh the nested providers within it. Each provider maintains its own state and lifecycle independently.

//we'll come back to this, lets fix the cloudinary issue first

// final uploadAndDetectImageProvider =
//     FutureProvider.family.autoDispose((ref, File file) async {
//   final urlResponse = await ref.read(generateUrlProvider(file).future);

//   print(urlResponse.data);

//   Dialogs.showLoadingDialog(); // or customPainted with loading percent 

//   if (!urlResponse.valid) {
//     Dialogs.showErrorSnackbar(message:res.error!.message!); // add retry logic to make a custom dialog
//   }


//   final imageResponse =
//       await ref.read(detectOneImageProvider(urlResponse.data).future);

//   if (!imageResponse.valid) {}

//   return imageResponse;
// });





// code

// for this upload and detect imageporvider we will not be consuming it with a when - so that means two things 

// 1 We will still use a FutureProvider 

// 2 the error, and retry dialogs would be in the provider logic not the UI logic , just like the auth provider 

// so we select from gallery , then we now detect that yes theres a file if (file != null) then the detect button logic can be executed 

// button is pressed to shows the uploading dialog (whether we want to use the send progress to get a custompainted dialog or not)

// then is uploading has error -> if !res.valid then show a retry prompt , no need to throw an exception we are not consuming it with when anywhere we just show a retry dialog 

// if uploading is successful , remove uploading and replace it with fetching detections....

// if !res.valid then show a retry prompt , no need to throw an exception we are not consuming it with when anywhere we just show a retry dialog 

// if res.valid when the detections have been fetched , get the response, pass it as an argument to the detectionInfo page then push it to a new stack , when we go back we go to the uploadScreen 

// for this follow how the authProvider was designed

// to be honest its just this cloudinary issue , thats pissing me off 


