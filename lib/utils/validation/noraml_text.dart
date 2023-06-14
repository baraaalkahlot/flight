import 'package:formz/formz.dart';

enum NormalTextValidationError { empty, short, notValid }

class NormalText extends FormzInput<String, NormalTextValidationError> {
  const NormalText.pure() : super.pure('');

  const NormalText.dirty([super.value = '']) : super.dirty();

  @override
  NormalTextValidationError? validator(String? value) {
    if (value?.isEmpty == true) {
      return NormalTextValidationError.empty;
    }
    return null;
  }
}
