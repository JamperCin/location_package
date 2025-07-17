import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:location_module/core/def/globals.dart';
import 'package:location_module/core_ui/snippets/places_search/geo_location_helper.dart';
export 'package:core_module/core_module.dart';
export 'package:location_module/src/location_export_file.dart';


/// A Calculator.
class LocationModule {
  static LocationModule? _instance;

  LocationModule._();

  factory LocationModule() {
    return _instance ??= LocationModule._();
  }

  Future<void> init({
    bool askPermission = false,
    BuildContext? context,
    String? envPath,
    EnvType? defaultEnv,
    String? loginScreen,
    String? homePageScreen,
  }) async {
    await CoreModule().init(
      context: context,
      envPath: envPath,
      defaultEnv: defaultEnv,
      loginScreen: loginScreen,
      homePageScreen: homePageScreen,
    );
    geoLocationHelper = GeoLocationHelper(askPermission: askPermission);
  }
}
