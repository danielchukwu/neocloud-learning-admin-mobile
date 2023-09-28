import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/utils/flutter_storage.dart';
import 'package:neocloud_mobile/utils/image_helper.dart';
import 'package:neocloud_mobile/utils/locator.dart';

// final imageHelper = ImageHelper();
class FormAddCover extends StatefulWidget {
  const FormAddCover({
    super.key,
    this.defaultImage,
    this.disable = false,
    required Function(File file) press,
  }) : _press = press;

  final bool? disable;
  final String? defaultImage;
  final Function(File file) _press;

  @override
  State<FormAddCover> createState() => _FormAddCoverState();
}

class _FormAddCoverState extends State<FormAddCover> {
  File? _selectedImage;
  var imageHelper = getIt<ImageHelper>();
  var firebaseStorage = getIt<FirebaseStorage>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.disable == false) {
          // Select Image from Gallery
          final files = await imageHelper.pickImage();
          // crop selected image
          if (files.isNotEmpty) {
            final croppedFile = await imageHelper.cropImage(
                file: files.first!,
                aspectRatio: const CropAspectRatio(ratioX: 4, ratioY: 2));
            if (croppedFile != null) {
              final imgFile = File(croppedFile.path);
              setState(() => _selectedImage = imgFile);
              // String? downloadUrl = await firebaseStorage.uploadFile(File(croppedFile.path), files.first!.name);
              widget._press(imgFile);
            }
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          image: widget.defaultImage != null && _selectedImage == null
          ? DecorationImage(image: NetworkImage(widget.defaultImage!), fit: BoxFit.cover)
          : _selectedImage != null
              ? DecorationImage(
                  image: FileImage(_selectedImage!), fit: BoxFit.cover)
              : null,
        ),
        child: _selectedImage == null && widget.defaultImage == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // Image
                    SizedBox(height: 15),
                    Icon(Icons.image, color: Colors.black38, size: 40),
                    // Text
                    SizedBox(height: 5),
                    TextMedium(
                      title: 'Add Cover',
                      weight: FontWeight.w600,
                      color: Colors.black26,
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
