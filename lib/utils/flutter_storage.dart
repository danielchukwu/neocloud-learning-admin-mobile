import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';

class FirebaseStorage {
  final storage = firebase_storage.FirebaseStorage.instance;

  Future<String?> uploadFile(File file, String filename) async {
    try {
      debugPrint('1.');
      var startTime = DateTime.now();
      var snapshot = await storage.ref('files/$filename').putFile(file);

      debugPrint('2.');
      String downloadUrl = await snapshot.ref.getDownloadURL();

      debugPrint('3.');
      var endTime = DateTime.now();
      debugPrint('Execution Time(s): ${endTime.difference(startTime).inSeconds}');
      
      debugPrint('FILE UPLOADED: ✅');
      return downloadUrl;
    } on firebase_core.FirebaseException catch (e) {
      debugPrint('FILE UPLOADED: ❌');
    }
  }
}