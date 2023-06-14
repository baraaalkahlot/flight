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
    final adult = NormalText.dirty(event.adult);
    emit(state.copyWith(
        adults: adult,
        status: Formz.validate([
          adult,
          state.children,
          state.arrival,
          state.departure,
          state.departureDate,
        ])));
  }

  FutureOr<void> _onChildrenChanged(
      ChildrenChanged event, Emitter<SearchFlightState> emit) {
    final children = NormalText.dirty(event.children);
    emit(state.copyWith(
        children: children,
        status: Formz.validate([
          state.adults,
          children,
          state.arrival,
          state.departure,
          state.departureDate,
        ])));
  }

  FutureOr<void> _onDepartureChanged(
      DepartureChanged event, Emitter<SearchFlightState> emit) {
    final departure = NormalText.dirty(event.departure);
    emit(state.copyWith(
        departure: departure,
        status: Formz.validate([
          state.adults,
          state.children,
          state.arrival,
          departure,
          state.departureDate,
        ])));
  }

  FutureOr<void> _onArrivalChanged(
      ArrivalChanged event, Emitter<SearchFlightState> emit) {
    final arrival = NormalText.dirty(event.arrival);
    emit(state.copyWith(
        arrival: arrival,
        status: Formz.validate([
          state.adults,
          state.children,
          arrival,
          state.departure,
          state.departureDate,
        ])));
  }

  FutureOr<void> _onDepartureDateChanged(
      DepartureDateChanged event, Emitter<SearchFlightState> emit) {
    final departureDate = NormalText.dirty(event.departureDate);
    emit(state.copyWith(
        departureDate: departureDate,
        status: Formz.validate([
          state.adults,
          state.children,
          state.arrival,
          state.departure,
          departureDate,
        ])));
  }

  FutureOr<void> _onSearchSubmitted(
      SearchSubmitted event, Emitter<SearchFlightState> emit) async {
    print('status = $state.status');
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
