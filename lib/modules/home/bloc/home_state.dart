part of 'home_bloc.dart';

class HomeState extends Equatable {
  final RequestStatus status;
  final FlightDto flightDto;
  final String message;

  const HomeState({
    this.status = RequestStatus.initial,
    required this.flightDto,
    this.message = '',
  });

  HomeState copyWith({
    RequestStatus? status,
    FlightDto? flightDto,
    String? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      flightDto: flightDto ?? this.flightDto,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, flightDto, message];
}
