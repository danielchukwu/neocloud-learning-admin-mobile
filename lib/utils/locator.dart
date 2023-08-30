import 'package:get_it/get_it.dart';
import 'package:neocloud_mobile/utils/calendar.dart';
import 'package:neocloud_mobile/utils/flutter_storage.dart';
import 'package:neocloud_mobile/utils/image_helper.dart';

GetIt getIt = GetIt.I;

void setupServiceLocator() {
  // ImageHelper : allows us pick images from the platform gallery or camera
  getIt.registerLazySingleton<ImageHelper>(() => ImageHelper());
  // FirebaseStorage : allows us store images on the cloud
  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage());
  // Calendar : allows us grab data that can be used in calendars
  getIt.registerLazySingleton<Calendar>(() => Calendar());
}