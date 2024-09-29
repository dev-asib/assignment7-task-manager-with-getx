import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task_manager_app/ui/widgets/snack_bar_message.dart';

class PermissionHandlerController extends GetxController {
  Future<void> requestPermission(BuildContext context) async {
    var cameraResult = await Permission.camera.request();
    if (!cameraResult.isGranted && context.mounted) {
      snackBarMessage(context, 'Permission Denied, camera access is required.');
    }

    var storageResult = await Permission.storage.request();
    if (!storageResult.isGranted && context.mounted) {
      snackBarMessage(
          context, "Permission Denied, Storage access is required.");
    }

    var photosResult = await Permission.photos.request();
    if (!photosResult.isGranted && context.mounted) {
      snackBarMessage(
          context, "Permission Denied, Photo library access is required.");
    }
  }
}
