import 'package:location_module/core/def/globals.dart';
import 'package:location_module/core_ui/snippets/places_search/geo_location_helper.dart';
export 'package:core_module/core_module.dart';

/// A Calculator.
class LocationModule {
  static LocationModule? _instance;

  LocationModule._();

  factory LocationModule() {
    return _instance ??= LocationModule._();
  }

  Future<void> init({bool askPermission = true}) async {
    geoLocationHelper = GeoLocationHelper(askPermission: askPermission);
  }
}
