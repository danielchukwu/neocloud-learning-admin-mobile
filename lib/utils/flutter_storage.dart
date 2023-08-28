import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';

class FirebaseStorage {
  final storage = firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(File file) async {
    try {
      await storage.ref('test/${DateTime.now()}').putFile(file);
      print('FILE UPLOADED: ✅');
    } on firebase_core.FirebaseException catch (e) {
      debugPrint(e.toString());
      print('FILE UPLOADED: ❌');
    }
  }
  
}