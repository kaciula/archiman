import 'package:file_picker/file_picker.dart';
import 'package:file_picker_writable/file_picker_writable.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';
import 'package:universal_io/io.dart';

part 'picker_service.freezed.dart';

class PickerService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<PickResult> pick(
    PickerFileType fileType, {
    PickerImageVideoSource? imageVideoSource,
    double imageMaxWidth = 1200,
    double imageMaxHeight = 1200,
    double maxFileSizeInMB = 4,
    String? fileName,
    FileWriterCallback? fileWriter,
  }) async {
    if (fileType == PickerFileType.video || fileType == PickerFileType.image) {
      try {
        final ImageSource imageSource =
            imageVideoSource == PickerImageVideoSource.camera
                ? ImageSource.camera
                : ImageSource.gallery;
        late final XFile? pickedFile;

        if (fileType == PickerFileType.video) {
          pickedFile = await _imagePicker.pickVideo(source: imageSource);
        }

        if (fileType == PickerFileType.image) {
          pickedFile = await _imagePicker.pickImage(
            source: imageSource,
            maxWidth: imageMaxWidth,
            maxHeight: imageMaxHeight,
          );
        }

        if (pickedFile != null) {
          final int fileSizeInBytes = await pickedFile.length();
          final double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
          return fileSizeInMB <= maxFileSizeInMB
              ? PickSuccess(File(pickedFile.path))
              : PickTooLargeFile(fileSizeInMB: fileSizeInMB);
        }
      } catch (error) {
        _logger.warning(error);
        if (error is PlatformException) {
          if (error.code == 'photo_access_denied') {
            return PickGalleryPermissionDeniedFailure();
          }
          if (error.code == 'camera_access_denied') {
            return PickCameraPermissionDeniedFailure();
          }
        }
        return PickFailure(error.toString());
      }
    } else if (fileType == PickerFileType.pdf) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        final PlatformFile pickedFile = result.files.single;
        final int fileSizeInBytes = pickedFile.size;
        final double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
        return fileSizeInMB <= maxFileSizeInMB
            ? PickSuccess(File(pickedFile.path!))
            : PickTooLargeFile(fileSizeInMB: fileSizeInMB);
      }
    } else if (fileType == PickerFileType.directory) {
      final FileInfo? fileInfo = await FilePickerWritable().openFileForCreate(
        fileName: fileName!,
        writer: fileWriter!,
      );
      if (fileInfo != null) {
        return PickSuccessSave();
      }
    }

    return PickCancelled();
  }
}

enum PickerFileType { image, video, pdf, directory }

enum PickerImageVideoSource { camera, gallery }

typedef FileWriterCallback = Future<void> Function(File file);

@freezed
class PickResult with _$PickResult {
  factory PickResult.success(File file) = PickSuccess;

  factory PickResult.successSave() = PickSuccessSave;

  factory PickResult.galleryPermissionDeniedFailure() =
      PickGalleryPermissionDeniedFailure;

  factory PickResult.cameraPermissionDeniedFailure() =
      PickCameraPermissionDeniedFailure;

  factory PickResult.tooLargeFile({
    required double fileSizeInMB,
  }) = PickTooLargeFile;

  factory PickResult.cancelled() = PickCancelled;

  factory PickResult.failure(String? errorDetails) = PickFailure;
}

// ignore: unused_element
final Logger _logger = Logger('PickerService');
