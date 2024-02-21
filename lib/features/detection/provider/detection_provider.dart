import 'dart:async';

import 'package:dio/dio.dart';
import 'package:taro_leaf_blight/core/core.dart';
import 'package:taro_leaf_blight/core/utils/string_exception.dart';
import 'package:taro_leaf_blight/features/detection/service/detection_service.dart';
import 'package:taro_leaf_blight/packages/global_packages.dart';

// if we want AsyncValue , we cannot be using a NotifierProvider we have to use an AsyncNotifierProvider ,
//create notifier classes to have more methods






// wehva to make the api requests directly in here
    // so the build method should return an instance of the type

//create an instance of the link cloudinary generator
// it shouldn't even be available publicly



final detectOneImageProvider = FutureProvider.family((ref, String? imageUrl) async { 
   ResponseModel res = await detectionService.detectOneImage(imageUrl: imageUrl);
  if (!res.valid) {
    throw StringException(res.data['message'] ?? 'Something went wrong');
  }
  return res;
});

final getDetectionByIdProvider = FutureProvider.family((ref, String? id) async { 
 ResponseModel res = await detectionService.getDetectionById(detectionId: id);
  if (!res.valid) {
    throw StringException(res.data['message'] ?? 'Something went wrong');
  } else {
    return res;
  }
});

final getAllDetectionsProvider = FutureProvider((ref) async { 
 ResponseModel res = await detectionService.getAllDetections();
  if (!res.valid) {
    throw StringException(res.data['message'] ?? 'Something went wrong');
  } else {
    return res;
  }
});









// do we need to perform side effect? , well depending on the resposne the state will change
// then for the underlying request logic we will get it from the DetectionService

// you can only have an AsyncValue from a stream or a future , we just had a notifier that returned a state object before
// the T in the generic is the type of actual data we want to return
// when you use a ref to get the value of a provider, its type is the undrlying value if will return , so we have to use a futureprovider
// so we have a FutureProvider that has muliple methods? or we have multiple future providers
// -  lets make a FutureProvider class (we can ony make Notifier classes) so mulitple futureProvider
// - lets make a AsyncNotifier class
// - stateNotifier class with AsyncValue type
//

/// IDEA 1 - Okay so this is now scratched out, tampering with the service is not an option
// in the detections.when , the data is the DetectionService object , we will now access the right data ,
//it should not be the the detectin Service Object , we are already, if the DetectionService Object is the Data we receive, then if we throw an exception how will riverpod know? and catch it as an error ?
// i think the best choice is for me to decouple the methods fro the Detection service and put the logic in the DetectionNotifier so we return the response directly , then when we throw exceptions , we can catch it with riverpod
// The T - the generic Type for the AsyncNotifier represents your Data

///IDEA 2 DONE
// we can create an instance of the service and inject it into the Notifier
//we can initalize the service in the notifier sha
// when i try to access the individual methods on a class , using notifier it is no more an asyncValue 

// i think its used to modify the state inside the class not create methods we can access from outside 

// a provider can only do one thing 

// a AsyncNotifier class is used to perform side efects by defining public methods

// we have to make multiple providers for each request , since they are entirely different 