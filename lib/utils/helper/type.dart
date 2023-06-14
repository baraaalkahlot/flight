part of 'app_helpers.dart';

// this file focused on enum data

enum PasswordRequestType {
  change,
  forget,
}

enum PatientRequestType {
  get,
  delete,
}

enum VerificationType {
  verifyPhone,
  verifyUser,
  changeMobile,
}

enum BookCardType {
  hospital,
  doctor,
  doctorWithOutPrice,
}

enum ReservationCardType {
  full,
  short,
  detailed,
}

enum StandardCardMode {
  withPrice,
  withOutPrice,
}

enum Gender {
  none,
  male,
  female,
}

enum ServicesFilter {
  urgent,
  hospital,
  inPlace,
}

enum DialogType {
  error,
  success,
  alert,
  alertDanger,
  info,
}

enum ActionType { update, none }

enum PatientFormRequestType { add, update }

enum ReservationTypeByLocation { outside, inside }

enum DoctorRequestType { outside, inside }
