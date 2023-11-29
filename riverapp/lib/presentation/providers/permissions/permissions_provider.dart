import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionsProvider =
    StateNotifierProvider<PermissionsNotifier, PermissionsState>((ref) {
  return PermissionsNotifier();
});

class PermissionsNotifier extends StateNotifier<PermissionsState> {
  PermissionsNotifier() : super(PermissionsState()) {
    checkPermissions();
  }
  Future<void> checkPermissions() async {
    final permissionsArray = await Future.wait([
      Permission.camera.status,
      Permission.photos.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copywith(
      camera: permissionsArray[0],
      photoLibrary: permissionsArray[1],
      sensors: permissionsArray[2],
      location: permissionsArray[3],
      locationAlwayss: permissionsArray[4],
      locationWhenInUsee: permissionsArray[5],
    );
  }

  requestCameraAccess() async {
    final status = await Permission.camera.request();
    state = state.copywith(camera: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  requestGaleryAccess() async {
    final status = await Permission.accessMediaLocation.request();
    state = state.copywith(photoLibrary: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  requestLocationAccess() async {
    final status = await Permission.location.request();
    state = state.copywith(location: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  requestSensorAccess() async {
    final status = await Permission.sensors.request();
    state = state.copywith(sensors: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }
}

class PermissionsState {
  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;
  final PermissionStatus location;
  final PermissionStatus locationAlwayss;
  final PermissionStatus locationWhenInUsee;

  PermissionsState({
    this.camera = PermissionStatus.denied,
    this.photoLibrary = PermissionStatus.denied,
    this.sensors = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationAlwayss = PermissionStatus.denied,
    this.locationWhenInUsee = PermissionStatus.denied,
  });

  get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }

  get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  get locationGranted {
    return location == PermissionStatus.granted;
  }

  get locationAlwaysGranted {
    return locationAlwayss == PermissionStatus.granted;
  }

  get locationwhenInUseGranted {
    return locationWhenInUsee == PermissionStatus.granted;
  }

  PermissionsState copywith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlwayss,
    PermissionStatus? locationWhenInUsee,
  }) =>
      PermissionsState(
        camera: camera ?? this.camera,
        photoLibrary: photoLibrary ?? this.photoLibrary,
        sensors: sensors ?? this.sensors,
        location: location ?? this.location,
        locationAlwayss: locationAlwayss ?? this.locationAlwayss,
        locationWhenInUsee: locationWhenInUsee ?? this.locationWhenInUsee,
      );
}
