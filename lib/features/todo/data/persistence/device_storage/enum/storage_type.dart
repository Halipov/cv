import 'dart:io';

import 'package:path_provider/path_provider.dart';

enum IosStorageTypeEnum {
  temporaryDirectory,
  applicationDocumentsDirectory,
  applicationSupportDirectory,
  libraryDirectory,
}

enum AndroidStorageTypeEnum {
  temporaryDirectory,
  applicationDocumentsDirectory,
  applicationSupportDirectory,
  externalStorageDirectory,
  externalCachesDirectory,
}

sealed class StorageType {
  Future<Directory?> getDirectory();
}

class IosStorageType extends StorageType {
  IosStorageType({
    required IosStorageTypeEnum iosStorageTypeEnum,
  }) : _iosStorageTypeEnum = iosStorageTypeEnum;
  final IosStorageTypeEnum _iosStorageTypeEnum;

  @override
  Future<Directory?> getDirectory() async => switch (_iosStorageTypeEnum) {
        IosStorageTypeEnum.temporaryDirectory => await getTemporaryDirectory(),
        IosStorageTypeEnum.applicationDocumentsDirectory =>
          await getApplicationDocumentsDirectory(),
        IosStorageTypeEnum.applicationSupportDirectory =>
          await getApplicationSupportDirectory(),
        IosStorageTypeEnum.libraryDirectory => await getLibraryDirectory(),
      };
}

class AndroidStorageType extends StorageType {
  AndroidStorageType({
    required AndroidStorageTypeEnum iosStorageTypeEnum,
  }) : _iosStorageTypeEnum = iosStorageTypeEnum;
  final AndroidStorageTypeEnum _iosStorageTypeEnum;

  @override
  Future<Directory?> getDirectory() async => switch (_iosStorageTypeEnum) {
        AndroidStorageTypeEnum.temporaryDirectory =>
          await getTemporaryDirectory(),
        AndroidStorageTypeEnum.applicationDocumentsDirectory =>
          await getApplicationDocumentsDirectory(),
        AndroidStorageTypeEnum.applicationSupportDirectory =>
          await getApplicationSupportDirectory(),
        AndroidStorageTypeEnum.externalStorageDirectory =>
          await getExternalStorageDirectory(),
        AndroidStorageTypeEnum.externalCachesDirectory =>
          (await getExternalCacheDirectories())?.first,
      };
}
