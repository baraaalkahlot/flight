import 'package:flight/init/app_component.dart';
import 'package:flutter/material.dart';

import 'init/application.dart';
import 'utils/services/rest_api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  Application.restService = RestAPIService.getInstance();

  runApp(const AppComponent());
}