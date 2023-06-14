part of 'app_helpers.dart';


extension StringExtension on String {


  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

bool isNumeric(String s) => s.isNotEmpty && double.tryParse(s) != null;
