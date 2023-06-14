part of 'search_flight_bloc.dart';

abstract class SearchFlightEvent extends Equatable {
  const SearchFlightEvent();

  @override
  List<Object> get props => [];
}

class AdultChanged extends SearchFlightEvent {
  final String adult;

  const AdultChanged(this.adult);
}

class ChildrenChanged extends SearchFlightEvent {
  final String children;

  const ChildrenChanged(this.children);
}

class DepartureChanged extends SearchFlightEvent {
  final String departure;

  const DepartureChanged(this.departure);
}

class ArrivalChanged extends SearchFlightEvent {
  final String arrival;

  const ArrivalChanged(this.arrival);
}

class DepartureDateChanged extends SearchFlightEvent {
  final String departureDate;

  const DepartureDateChanged(this.departureDate);
}

class SearchSubmitted extends SearchFlightEvent {}
