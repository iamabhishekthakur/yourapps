import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'app_model.dart';

class AppBloc {
  StreamController<List<App>> appsController = StreamController();
  Stream<List<App>> get apps => appsController.stream;

  Future<void> fetchApps() async {
    final sharedPreferenceHandler = await SharedPreferences.getInstance();
    final existingApps = sharedPreferenceHandler.getString('apps');
    final apps = appFromJson(existingApps!);
    appsController.sink.add(apps);
  }

  Future<void> addAppToStorage(App app) async {
    final sharedPreferenceHandler = await SharedPreferences.getInstance();
    final existingApps = sharedPreferenceHandler.getString('apps');
    if (existingApps == null) {
      sharedPreferenceHandler.setString(
        'apps',
        appToJson(
          [app],
        ),
      );
    } else {
      final appendedApps = appFromJson(existingApps)..add(app);
      sharedPreferenceHandler.setString(
        'apps',
        appToJson(
          appendedApps,
        ),
      );
    }
  }
}

final appBloc = AppBloc();
