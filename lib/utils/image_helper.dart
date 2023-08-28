import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  ImageHelper({
    ImagePicker? imagePicker,
    ImageCropper? imageCropper,
  }): _imagePicker = imagePicker ?? ImagePicker(), 
      _imageCropper = imageCropper ?? ImageCropper();

  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  Future<List<XFile?>> pickImage({
    ImageSource source = ImageSource.gallery,
    int quality = 100,
    pickMultiple = false,
  }) async {
    if (pickMultiple) {
      return await _imagePicker.pickMultiImage(imageQuality: quality); 
    }
    final file = await _imagePicker.pickImage(
      source: source, 
      imageQuality: quality
    );

    if (file != null) return [file];
    return [];
  }

  Future<CroppedFile?> cropImage({
    required XFile file, 
    CropStyle cropStyle = CropStyle.rectangle,
    CropAspectRatio? aspectRatio,
  }){
    return _imageCropper.cropImage(
      sourcePath: file.path,
      cropStyle: cropStyle,
      aspectRatio: aspectRatio,
      uiSettings: [
        // Platform specific UI  settings
        AndroidUiSettings(),
        IOSUiSettings()
      ]
    );
  }
}

