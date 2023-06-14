import 'package:formz/formz.dart';

enum NumValidationError { empty, short, notValid }

class NumValidator extends FormzInput<int, NumValidationError> {
  const NumValidator.pure() : super.pure(-1);

  const NumValidator.dirty([super.value = -1]) : super.dirty();

  @override
  NumValidationError? validator(int? value) {
    if (value == -1) {
      return NumValidationError.empty;
    }
    return null;
  }
}
