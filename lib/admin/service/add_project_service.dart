import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:resume/constants.dart';

import '../model/project_model.dart';

class ProjectServices {
  void addProject(
      {required BuildContext context,
      required String projectName,
      required String projectDescription,
      required String sourceCode,
      required String sourceUrl,
      required List<File> images}) async {
    try {
      List<String> downloadUrls = [];
      for (int i = 0; i < images.length; i++) {
        Reference ref = FirebaseStorage.instanceFor(
                bucket: 'gs://who-am-i-d2854.appspot.com')
            .ref()
            .child(projectName)
            .child('image$i');

        if (kIsWeb) {
          ref.putData(await images[i].readAsBytes()).whenComplete(() async {
            String downloadUrl = await ref.getDownloadURL();
            downloadUrls.add(downloadUrl);
          });
        } else {
          final uploadTask = ref.putFile(images[i]);
          String url = await (await uploadTask).ref.getDownloadURL();
          downloadUrls.add(url);
          uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
            switch (taskSnapshot.state) {
              case TaskState.running:
                final progress = 100.0 *
                    (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
                Center(
                    child: CircularProgressIndicator.adaptive(
                  value: progress,
                  backgroundColor: Colors.black26,
                ));
                break;
              case TaskState.paused:
                print("Upload is paused.");
                break;
              case TaskState.canceled:
                print("Upload was canceled");
                break;
              case TaskState.error:
                print(TaskState.error.toString());
                break;
              case TaskState.success:
                break;
            }
          });
        }
      }

      ProjectModel productModel = ProjectModel(
        name: projectName,
        description: projectDescription,
        sourceCode: sourceCode,
        sourceUrl: sourceUrl,
        images: downloadUrls,
      );
      await firebaseFirestore
          .collection('projects')
          .doc()
          .set(productModel.toMap())
          .whenComplete(() {
        print('uploaded to firebase');
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ProjectModel> getProjectCount() async {
    return firebaseFirestore
        .collection('projects')
        .doc()
        .get()
        .then((value) => ProjectModel.fromMap(value.data()!));
  }

  Stream<List<ProjectModel>> getAllProducts() =>
      firebaseFirestore.collection('projects').snapshots().map((event) =>
          event.docs.map((e) => ProjectModel.fromMap(e.data())).toList());

  // void deleteProduct({
  //   required BuildContext context,
  //   required ProjectModel product,
  //   required VoidCallback onSuccess,
  // }) async {

  //   try {
  //     http.Response res = await http.post(
  //       Uri.parse('$uri/admin/delete-product'),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'x-auth-token': userProvider.user.token,
  //       },
  //       body: jsonEncode({
  //         'id': product.id,
  //       }),
  //     );

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //         onSuccess();
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  // Future<List<String>> getDownloadLinks(
  //     List<File> images, String projectName) async {
  //   List<String> downloadUrls = [];
  //   for (int i = 0; i < images.length; i++) {
  //     Reference ref =
  //         FirebaseStorage.instanceFor(bucket: 'gs://who-am-i-d2854.appspot.com')
  //             .ref()
  //             .child(projectName)
  //             .child('image$i');

  //     if (kIsWeb) {
  //       ref.putData(await images[i].readAsBytes()).whenComplete(() async {
  //         String downloadUrl = await ref.getDownloadURL();
  //         downloadUrls.add(downloadUrl);
  //       });
  //     } else {
  //       final uploadTask = ref.putFile(images[i]);
  //       String url = await (await uploadTask).ref.getDownloadURL();
  //       downloadUrls.add(url);
  //       uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
  //         switch (taskSnapshot.state) {
  //           case TaskState.running:
  //             final progress = 100.0 *
  //                 (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
  //             Center(
  //                 child: CircularProgressIndicator.adaptive(
  //               value: progress,
  //               backgroundColor: Colors.black26,
  //             ));
  //             break;
  //           case TaskState.paused:
  //             print("Upload is paused.");
  //             break;
  //           case TaskState.canceled:
  //             print("Upload was canceled");
  //             break;
  //           case TaskState.error:
  //             print(TaskState.error.toString());
  //             break;
  //           case TaskState.success:
  //             break;
  //         }
  //       });
  //     }
  //   }
  //   return downloadUrls;
  // }
}
