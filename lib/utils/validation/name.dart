import 'package:formz/formz.dart';

enum NameValidationError { empty, short, notValid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    if (value?.isEmpty == true) {
      return NameValidationError.empty;
    }
    return null;
  }
}
