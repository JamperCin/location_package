<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Location and Google Map Simplified Flutter Package
This is a package for Flutter Applications to easily integrate anything location and map related features.
This project also makes use of the Core Module package (https://github.com/JamperCin/core_package) so when using this package, no need to worry about the core_module package.

## Features :
### Location features
- Get current location
- Get last known location
- Get distance between two locations
- Ask location permission
- Show location picker to easily search for location
- Show location picker to easily pick location on a map

### Google Map features
- Easily integrate a map into a widget
- Easily draw poly lines on your map

## Getting started

Before using this package, there are some configurations you will need to do in your main.dart class and assets which will help to easily set this whole package up and running.

### Configurations
This package will need a **Google map api key** to be added to your project. Since api keys don't need to be committed to git, it's always advisable to put it in environment **(env.json)** file in your asset and never commit it to repository. The key to reference in this json file should be named ```googleApi```. See below sample file for configuration.

#### 1. Asset Configuration
Remember, this package depends on this env.json file to work properly. So i will explain into details what the mandatory items in the json file does.

First of all you need to add your list of environments in an array form to your project. The key for the array is `env` .  eg if you have multiple environments to consume, you list them and identify them with the keys below:

- `production` : This is where live environment or production domain host will go.

- `staging` : This is where a staging or test environment or domain host will go.

- `ngrok` : If you have a localhost or another test environment, you can put it here.


Your env.json should look something like below

```dart
{
  "env" : [
    {
      "name" : "production",
      "host": "api.production.com",  --> mandatory, edit it to add your live/production host
      "https": true
    },
    {
      "name" : "staging",
      "host": "api.test.com",  --> optional, you can edit
      "https": true
    },
    {
      "name" : "google",
      "host": "maps.googleapis.com",  --> Dont edit this block
      "https": true
    },
    {
      "name" : "ngrok",
      "host": "ngrok.com.host",  --> optional, you can edit
      "https": true
    }
  ],
  "appStoreId": "your_app_store_app_id", --> optional
  "googleApi": "your_google_api_key_goes_here", --> mandatory
  "smsTimer": 60, --> optional
  "httpTimeOut": 30, --> optional
  "appStoreLink" : "link_to_your_app_on_apple_store", --> optional
  "googlePlayStoreLink": "link_to_your_app_on_google_store", --> optional
  "privacyPolicy": "link_to_your_privacy_policy", --> optional
  "termsAndConditions": "link_to_your_terms_and_conditions", --> optional
  "fileUploadApi" : "api_to_upload_files_when_using_the_file_picker_widget" --> optional. The host is already declared in your env already so no need to add the host, eg: file/upload?
}
```


#### 2. main.dart configuration
In your `main.dart` file your will need to initialise this package before usage. This where you call the full path of the `env.json` and configure it. see sample `main.dart` code below

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocationModule().init(
      envPath: 'assets/data/env.json',    --> This where you pass your full path to the env.json file
  defaultEnv: EnvType.production, --> You can switch your environment here, whether production or staging or ngrok. The default is production incase you dont configure it here.
  );

  runApp(const MyApp());
}
```

## Usage

All the widgets you can consume from the `core_module` (https://github.com/JamperCin/core_package) can also be accessible in the this package.

Now let's delve into usage of this package. Its so simple.
### 1. Using the Google places search features
Display or pop-up the google place search by calling the `PlacesPickerWidget` like below:

```dart
PlacesPickerWidget.searchPlaces(
      context: context,
      onSearch: (location) {
        debugPrint(location.address); ///print the location picked by user
      },
    );
```
This picker returns a location object which has the following info returned:

```dart
    @Default('') String placeId,
    @Default('') String description,
    @Default('') String address,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,

```

### 2. Get current location
To get your current location, do the following:

```dart
 final location = await geoLocationHelper.getCurrentLocation();
```

### 3. Get last known location
To get your last known location, do the following:

```dart
 final location = await geoLocationHelper.getLastKnownLocation();
```

### 4. Get the distance between 2 locations
To get your last known location, do the following:

```dart
 final distance = await geoLocationHelper.getDistance(locationA, locationB);
```

### 5. Ask location permission
To get your last known location, do the following:

```dart
  await geoLocationHelper.checkPermissionStatus();
```