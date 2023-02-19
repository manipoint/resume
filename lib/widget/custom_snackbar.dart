
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: const Color.fromARGB(255, 42, 156, 19),
    ),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );
    if (result != null && result.files.isNotEmpty) {
      for (int i = 0; i < result.files.length; i++) {
        images.add(File(result.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}



// Future<List<File>> pickDataFiles(BuildContext context) async {
//   List<File> data = [];
//   try {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowMultiple: true,
//         allowedExtensions: ['jpg', 'plt', 'cdr', 'ai', 'dxf', 'svg']);
//     if (result != null && result.files.isNotEmpty) {
//        data = result.paths.map((path) => File(path!)).toList();
//     }
//   } on PlatformException catch (e) {
//     debugPrint(e.toString());
//     showSnackBar(context, e.toString());
//   } catch (e) {
//     debugPrint(e.toString());
//     showSnackBar(context, e.toString());
//   }
//   return data;
// }
