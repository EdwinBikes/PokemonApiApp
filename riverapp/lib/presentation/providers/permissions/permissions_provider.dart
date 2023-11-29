import 'package:permission_handler/permission_handler.dart';

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
