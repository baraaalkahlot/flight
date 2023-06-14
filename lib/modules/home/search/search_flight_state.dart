part of 'search_flight_bloc.dart';

class SearchFlightState extends Equatable {
  final FormzStatus status;
  final NormalText adults;
  final NormalText children;
  final NormalText departure;
  final NormalText arrival;
  final NormalText departureDate;

  const SearchFlightState({
    this.status = FormzStatus.pure,
    this.adults = const NormalText.pure(),
    this.children = const NormalText.pure(),
    this.departure = const NormalText.pure(),
    this.arrival = const NormalText.pure(),
    this.departureDate = const NormalText.pure(),
  });

  SearchFlightState copyWith({
    FormzStatus? status,
    NormalText? adults,
    NormalText? children,
    NormalText? departure,
    NormalText? arrival,
    NormalText? departureDate,
  }) {
    return SearchFlightState(
      status: status ?? this.status,
      adults: adults ?? this.adults,
      children: children ?? this.children,
      departure: departure ?? this.departure,
      arrival: arrival ?? this.arrival,
      departureDate: departureDate ?? this.departureDate,
    );
  }

  @override
  List<Object> get props => [
        status,
        adults,
        children,
        departure,
        arrival,
        departureDate,
      ];
}
