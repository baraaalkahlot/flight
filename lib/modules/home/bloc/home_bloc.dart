import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../config/models/FlightDto.dart';
import '../../../constants/app_constant.dart';
import '../home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(HomeState(flightDto: FlightDto())) {
    on<HomeDataFetched>(_onHomeDataFetched);
  }

  FutureOr<void> _onHomeDataFetched(
      HomeDataFetched event, Emitter<HomeState> emit) async {
    try {
        emit(state.copyWith(status: RequestStatus.inProgress));
        final data = await _homeRepository.getFlights(
          adults: event.adults,
          arrival: event.arrival,
          children: event.children,
          classDegree: event.classDegree,
          departure: event.departure,
          departureDate: event.departureDate,
          infants: event.infants,
          nonStop: event.nonStop,
          lang: event.lang,
        );
        emit(state.copyWith(
          status: RequestStatus.success,
          flightDto: data,
        ));
    } catch (errorMsg) {
      print(errorMsg.toString());
      emit(state.copyWith(
          status: RequestStatus.failure, message: errorMsg.toString()));
    }
  }
}
