part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeDataFetched extends HomeEvent {
  final String adults;
  final String arrival;
  final String children;
  final String classDegree;
  final String departure;
  final String departureDate;
  final String infants;
  final String nonStop;
  final String lang;

  const HomeDataFetched(
      {required this.adults,
      required this.arrival,
      required this.children,
      required this.classDegree,
      required this.departure,
      required this.departureDate,
      required this.infants,
      required this.nonStop,
      required this.lang});

  @override
  List<Object> get props => [
        adults,
        arrival,
        children,
        classDegree,
        departure,
        departureDate,
        infants,
        nonStop,
        lang,
      ];
}
