import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../utils/validation/models.dart';

part 'search_flight_event.dart';

part 'search_flight_state.dart';

class SearchFlightBloc extends Bloc<SearchFlightEvent, SearchFlightState> {
  SearchFlightBloc() : super(const SearchFlightState()) {
    on<AdultChanged>(_onAdultChanged);
    on<ChildrenChanged>(_onChildrenChanged);
    on<DepartureChanged>(_onDepartureChanged);
    on<ArrivalChanged>(_onArrivalChanged);
    on<DepartureDateChanged>(_onDepartureDateChanged);
    on<SearchSubmitted>(_onSearchSubmitted);
  }

  FutureOr<void> _onAdultChanged(
      AdultChanged event, Emitter<SearchFlightState> emit) {
    emit(state.copyWith(
        status: event.adult.isEmpty
            ? FormzStatus.invalid
            : Formz.validate([
                state.adults,
                state.children,
                state.arrival,
                state.departure,
                state.departureDate,
              ])));
  }

  FutureOr<void> _onChildrenChanged(
      ChildrenChanged event, Emitter<SearchFlightState> emit) {
    emit(state.copyWith(
        status: event.children.isEmpty
            ? FormzStatus.invalid
            : Formz.validate([
                state.adults,
                state.arrival,
                state.departure,
                state.departureDate,
              ])));
  }

  FutureOr<void> _onDepartureChanged(
      DepartureChanged event, Emitter<SearchFlightState> emit) {
    emit(state.copyWith(
        status: event.departure.isEmpty
            ? FormzStatus.invalid
            : Formz.validate([
                state.adults,
                state.arrival,
                state.children,
                state.departureDate,
              ])));
  }

  FutureOr<void> _onArrivalChanged(
      ArrivalChanged event, Emitter<SearchFlightState> emit) {
    emit(state.copyWith(
        status: event.arrival.isEmpty
            ? FormzStatus.invalid
            : Formz.validate([
                state.adults,
                state.children,
                state.departure,
                state.departureDate,
              ])));
  }

  FutureOr<void> _onDepartureDateChanged(
      DepartureDateChanged event, Emitter<SearchFlightState> emit) {
    emit(state.copyWith(
        status: event.departureDate.isEmpty
            ? FormzStatus.invalid
            : Formz.validate([
                state.adults,
                state.children,
                state.arrival,
                state.departure,
              ])));
  }

  FutureOr<void> _onSearchSubmitted(
      SearchSubmitted event, Emitter<SearchFlightState> emit) async {
    print('status = $state.status');
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
