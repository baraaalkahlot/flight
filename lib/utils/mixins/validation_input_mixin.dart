import 'package:flutter/material.dart';

/// use this mixin for all form field
mixin ValidatorMixin {
  // example :
  String? validateTextFieldIsRequired(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? validateDropdownIsRequired(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Please select item";
    }
    return null;
  }

  bool isFieldEmpty(String fieldValue) => fieldValue.trim().isEmpty;

  bool isValidLoginInput(String input) {
    String _input = input.trim();
    return (_input.isNotEmpty) && (_input.length > 2) && (_input.length < 12);
  }
}
