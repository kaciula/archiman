import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:map_launcher/map_launcher.dart';

part 'directions_service.freezed.dart';

class DirectionsService {
  Future<KtList<DirectionsApp>> getAvailableApps() async {
    return (await MapLauncher.installedMaps)
        .map((AvailableMap it) => DirectionsApp(
              appName: it.mapName,
              type: _map(it.mapType),
            ))
        .toImmutableList();
  }

  Future<void> launchApp(DirectionsApp app, LocationPoint destination) async {
    await MapLauncher.showDirections(
      mapType: _mapReverse(app.type),
      destination: Coords(destination.lat, destination.lng),
    );
  }

  DirectionsAppType _map(MapType mapType) {
    switch (mapType) {
      case MapType.apple:
        return DirectionsAppType.apple;
      case MapType.google:
        return DirectionsAppType.google;
      case MapType.googleGo:
        return DirectionsAppType.googleGo;
      case MapType.amap:
        return DirectionsAppType.amap;
      case MapType.baidu:
        return DirectionsAppType.baidu;
      case MapType.waze:
        return DirectionsAppType.waze;
      case MapType.yandexMaps:
        return DirectionsAppType.yandexMaps;
      case MapType.yandexNavi:
        return DirectionsAppType.yandexNavi;
      case MapType.citymapper:
        return DirectionsAppType.citymapper;
      case MapType.mapswithme:
        return DirectionsAppType.mapswithme;
      case MapType.osmand:
        return DirectionsAppType.osmand;
      case MapType.doubleGis:
        return DirectionsAppType.doubleGis;
      case MapType.tencent:
        return DirectionsAppType.tencent;
      case MapType.osmandplus:
        return DirectionsAppType.osmandplus;
      case MapType.here:
        return DirectionsAppType.here;
      case MapType.petal:
        return DirectionsAppType.petal;
      case MapType.tomtomgo:
        return DirectionsAppType.tomtomgo;
    }
  }

  MapType _mapReverse(DirectionsAppType type) {
    switch (type) {
      case DirectionsAppType.apple:
        return MapType.apple;
      case DirectionsAppType.google:
        return MapType.google;
      case DirectionsAppType.googleGo:
        return MapType.googleGo;
      case DirectionsAppType.amap:
        return MapType.amap;
      case DirectionsAppType.baidu:
        return MapType.baidu;
      case DirectionsAppType.waze:
        return MapType.waze;
      case DirectionsAppType.yandexMaps:
        return MapType.yandexMaps;
      case DirectionsAppType.yandexNavi:
        return MapType.yandexNavi;
      case DirectionsAppType.citymapper:
        return MapType.citymapper;
      case DirectionsAppType.mapswithme:
        return MapType.mapswithme;
      case DirectionsAppType.osmand:
        return MapType.osmand;
      case DirectionsAppType.doubleGis:
        return MapType.doubleGis;
      case DirectionsAppType.tencent:
        return MapType.tencent;
      case DirectionsAppType.osmandplus:
        return MapType.osmandplus;
      case DirectionsAppType.here:
        return MapType.here;
      case DirectionsAppType.petal:
        return MapType.petal;
      case DirectionsAppType.tomtomgo:
        return MapType.tomtomgo;
    }
  }
}

@freezed
class LocationPoint with _$LocationPoint {
  factory LocationPoint({
    required double lat,
    required double lng,
  }) = _LocationPoint;
}

@freezed
class DirectionsApp with _$DirectionsApp {
  factory DirectionsApp({
    required String appName,
    required DirectionsAppType type,
  }) = _DirectionsApp;
}

enum DirectionsAppType {
  apple,
  google,
  googleGo,
  amap,
  baidu,
  waze,
  yandexMaps,
  yandexNavi,
  citymapper,
  mapswithme,
  osmand,
  doubleGis,
  tencent,
  osmandplus,
  here,
  petal,
  tomtomgo,
}
