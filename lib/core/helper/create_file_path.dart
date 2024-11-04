import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:meal_recommendations_a2/core/utiles/constant.dart';

String createFilePath(File file, String uid) {
  String fileName = path.basename(file.path);
  return "$profileImagesFolderPath/$uid/$fileName";
}
