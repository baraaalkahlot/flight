
import '../../config/models/FlightDto.dart';
import '../../constants/api_key.dart';
import '../../constants/api_path.dart';
import '../../init/application.dart';
import '../../utils/services/rest_api_service.dart';

class HomeRepository {
  Future<FlightDto> getFlights({
    required String adults,
    required String arrival,
    required String children,
    required String classDegree,
    required String departure,
    required String departureDate,
    required String infants,
    required String nonStop,
    required String lang,
  }) async {
    final response = await Application.restService!.requestCall(
      apiEndPoint: ApiPath.flights,
      method: RestAPIRequestMethods.POST,
      requestParams: {
        ApiKey.adultsKey: adults,
        ApiKey.arrivalKey: arrival,
        ApiKey.childrenKey: children,
        ApiKey.classKey: classDegree,
        ApiKey.departureKey: departure,
        ApiKey.departureDateKey: departureDate,
        ApiKey.infantsKey: infants,
        ApiKey.nonStopKey: nonStop,
        ApiKey.langKey: lang,
      },
    );
    return FlightDto.fromJson(response);
  }
}
