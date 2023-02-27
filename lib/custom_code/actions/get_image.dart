// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

Future<dynamic> getImage() async {
  final imagepicker = ImagePicker();
  File? imageFile;
  String fileName = "No File Name";
  // int fileSizeinBytes = 0;
  String fileType = "No file name";
  final image = await imagepicker.pickImage(source: ImageSource.camera);

<<<<<<< Updated upstream
  imageFile = File(image!.path);
  print(imageFile);
  fileName = path.basename(image.path);
  // fileSizeinBytes = imageFile.length() as int;
  fileType = lookupMimeType(imageFile.path) ?? 'Unknown';

=======
  //   position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   // Do something with the location
  // } else {
  //   permissionStatus = await Permission.locationWhenInUse.request();
  //   if (permissionStatus.isGranted) {
  //     // Location permission granted by user
  //     // Get the user's location
  //     position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //     // Do something with the location
  //   } else {
  //     // Location permission denied by user
  //     // Show an error message or prompt the user to grant permission manually in the device settings
  //     print("Denied");
  //   }
  // }
  // var imageFile = File(image!.path);
  var fileStat = await FileStat.stat(image!.path);
  fileName = path.basename(image.path);
  // fileSizeinBytes = imageFile.lengthSync();
  fileSizeinBytes = fileStat.size;
  // fileType = lookupMimeType(imageFile.path) ?? 'Unknown';
  // latitude = position!.latitude;
  // longitude = position!.longitude;
>>>>>>> Stashed changes
  dynamic RequiredData = {
    "file_name": fileName,
    // "file_size": fileSizeinBytes,
    "file_type": fileType
  };
  return RequiredData;
}
