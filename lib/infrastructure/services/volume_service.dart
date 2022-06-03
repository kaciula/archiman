import 'package:volume_controller/volume_controller.dart';

class VolumeService {
  final VolumeController _controller = VolumeController();

  Future<double> getCurrentVolume() async {
    return _controller.getVolume();
  }
}
