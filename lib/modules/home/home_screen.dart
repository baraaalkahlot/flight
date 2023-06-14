import 'package:flight/constants/api_key.dart';
import 'package:flight/constants/app_colors.dart';
import 'package:flight/modules/home/search/search_flight_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../config/models/Flights.dart';
import '../../constants/app_constant.dart';
import '../../constants/app_dimen.dart';
import '../../constants/assets_path.dart';
import '../../utils/ui/app_dialogs.dart';
import '../../utils/ui/app_styles.dart';
import '../../utils/ui/ui_utils.dart';
import '../../widget/app_anim.dart';
import '../../widget/app_bar.dart';
import '../../widget/app_cards.dart';
import 'bloc/home_bloc.dart';
import 'home_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(homeRepository: HomeRepository())
            ..add(const HomeDataFetched(
              adults: ApiKey.adultsValue,
              arrival: ApiKey.arrivalValue,
              children: ApiKey.childrenValue,
              classDegree: ApiKey.classValue,
              departure: ApiKey.departureValue,
              departureDate: ApiKey.departureDateValue,
              infants: ApiKey.infantsValue,
              nonStop: ApiKey.nonStopValue,
              lang: ApiKey.langValue,
            )),
        )
      ],
      child: const Scaffold(
        appBar: PrimaryAppBar(
          title: 'Home',
        ),
        body: Padding(
          padding: EdgeInsets.all(AppDimen.spacePaddingLayout),
          child: SafeArea(child: HomePage()),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController pageController;
  final _adultTextController = TextEditingController();
  final _childrenTextController = TextEditingController();
  final _arrivalTextController = TextEditingController();
  final _departureTextController = TextEditingController();
  final _departureDateTextController = TextEditingController();
  bool showFilter = false;
  late AnimationController _lottieAnimationController;

  @override
  void initState() {
    super.initState();
    _adultTextController.text = _childrenTextController.text =
        _arrivalTextController.text = _departureTextController.text =
            _departureDateTextController.text = '';
    _lottieAnimationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // _handleCloudMessagePermission();
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.status == RequestStatus.failure) {
              AppDialog.showAppAlertDialog(
                  context: context, content: state.message);
            }else if(state.status == RequestStatus.success){
              setState(() {
                showFilter = false;
              });
            }
          },
        ),
        BlocListener<SearchFlightBloc, SearchFlightState>(
          listener: (context, state) {
            if (state.status.isSubmissionSuccess) {
              context.read<HomeBloc>().add(HomeDataFetched(
                  adults: state.adults.value,
                  arrival: state.arrival.value,
                  children: ApiKey.childrenValue,
                  classDegree: ApiKey.classValue,
                  departure: state.departure.value,
                  departureDate: state.departureDate.value,
                  infants: ApiKey.infantsValue,
                  nonStop: ApiKey.nonStopValue,
                  lang: ApiKey.langValue));
            }
          },
        ),
      ],
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFlightTitle(),
              const SizedBox(height: AppDimen.spacingNormal),
              Visibility(visible: showFilter, child: _buildFilterLayout()),
              const SizedBox(height: AppDimen.spacingNormal),
              buildFlightList(),
            ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) =>
                state.status == RequestStatus.inProgress
                    ? const AppProgressIndicator()
                    : Stack(),
          )
        ],
      ),
    );
  }

  Widget _buildFlightTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Get Your Trip!',
          style: TextStyleExtension.subTitleLabelStyles,
        ),
        InkWell(
            onTap: () {
              setState(() {
                showFilter = !showFilter;
              });
            },
            child: const Icon(
              Icons.filter_alt_outlined,
              color: AppColors.primaryColor,
            ))
      ],
    );
  }

  Widget buildFlightList() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<Flights> flights = state.flightDto.response?.flights ?? [];
        return Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: flights.length,
              itemBuilder: (BuildContext listCtx, int index) {
                return Padding(
                    padding:
                        const EdgeInsets.only(bottom: AppDimen.spacingNormal),
                    child: StandardCard(
                      title:
                          '${flights[index].routes?.first.segments?.first.departureCity} | ${flights[index].routes?.first.segments?.first.arrivalCity}',
                      duration:
                          '${flights[index].routes?.first.segments?.first.duration}',
                      departure:
                          'departure: ${flights[index].routes?.first.segments?.first.departureAirport}',
                      arrival:
                          'arrival: ${flights[index].routes?.first.segments?.first.arrivalAirport}',
                      capin:
                          '${flights[index].routes?.first.segments?.first.cabin}',
                      price:
                          '${flights[index].price?.grandTotal?.round()} ${flights[index].price?.currency}',
                      onCardTap: () {
                        AppDialog.showLottieAnimDialog(
                          context: context,
                          assetPath: Assets.animGift,
                          lottieAnimationController: _lottieAnimationController,
                        );
                      },
                    ));
              }),
        );
      },
    );
  }

  Widget _buildFilterLayout() {
    return BlocBuilder<SearchFlightBloc, SearchFlightState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(AppDimen.spacingRegular),
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildAdultInput(),
              const SizedBox(
                height: AppDimen.spacingSmall,
              ),
              _buildChildrenInput(),
              const SizedBox(
                height: AppDimen.spacingSmall,
              ),
              _buildArrivalInput(),
              const SizedBox(
                height: AppDimen.spacingSmall,
              ),
              _buildDepartureInput(),
              const SizedBox(
                height: AppDimen.spacingSmall,
              ),
              _buildDepartureDateInput(),
              const SizedBox(
                height: AppDimen.spacingNormal,
              ),
              PrimaryButton(
                context,
                label: 'Search',
                onPressed: state.status.isValidated
                    ? () {
                        context.read<SearchFlightBloc>().add(SearchSubmitted());
                      }
                    : null,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildAdultInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<SearchFlightBloc, SearchFlightState>(
          buildWhen: (previous, current) => previous.adults != current.adults,
          builder: (context, state) {
            return TextFormField(
              onChanged: (title) =>
                  context.read<SearchFlightBloc>().add(AdultChanged(title)),
              decoration: WidgetStyleExtension.outlinedInputDecoration.copyWith(
                  errorText: state.adults.invalid ? 'Invalid Input' : null,
                  hintText: 'Enter Adult count'),
              keyboardType: TextInputType.number,
              controller: _adultTextController,
            );
          },
        ),
      ],
    );
  }

  Widget _buildChildrenInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<SearchFlightBloc, SearchFlightState>(
          buildWhen: (previous, current) =>
              previous.children != current.children,
          builder: (context, state) {
            return TextFormField(
              onChanged: (title) =>
                  context.read<SearchFlightBloc>().add(ChildrenChanged(title)),
              decoration: WidgetStyleExtension.outlinedInputDecoration.copyWith(
                  errorText: state.children.invalid ? 'Invalid Input' : null,
                  hintText: 'Enter Children count'),
              keyboardType: TextInputType.number,
              controller: _childrenTextController,
            );
          },
        ),
      ],
    );
  }

  Widget _buildDepartureInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<SearchFlightBloc, SearchFlightState>(
          buildWhen: (previous, current) =>
              previous.departure != current.departure,
          builder: (context, state) {
            return TextFormField(
              onChanged: (title) =>
                  context.read<SearchFlightBloc>().add(DepartureChanged(title)),
              decoration: WidgetStyleExtension.outlinedInputDecoration.copyWith(
                  errorText: state.departure.invalid ? 'Invalid Input' : null,
                  hintText: 'Enter Departure Location'),
              keyboardType: TextInputType.name,
              controller: _departureTextController,
            );
          },
        ),
      ],
    );
  }

  Widget _buildArrivalInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<SearchFlightBloc, SearchFlightState>(
          buildWhen: (previous, current) => previous.arrival != current.arrival,
          builder: (context, state) {
            return TextFormField(
              onChanged: (title) =>
                  context.read<SearchFlightBloc>().add(ArrivalChanged(title)),
              decoration: WidgetStyleExtension.outlinedInputDecoration.copyWith(
                  errorText: state.arrival.invalid ? 'Invalid Input' : null,
                  hintText: 'Enter Arrival Location'),
              keyboardType: TextInputType.name,
              controller: _arrivalTextController,
            );
          },
        ),
      ],
    );
  }

  Widget _buildDepartureDateInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<SearchFlightBloc, SearchFlightState>(
          buildWhen: (previous, current) =>
              previous.departureDate != current.departureDate,
          builder: (context, state) {
            return TextFormField(
              onChanged: (title) => context
                  .read<SearchFlightBloc>()
                  .add(DepartureDateChanged(title)),
              decoration: WidgetStyleExtension.outlinedInputDecoration.copyWith(
                  errorText:
                      state.departureDate.invalid ? 'Invalid Input' : null,
                  hintText: 'Enter Departure Date'),
              keyboardType: TextInputType.name,
              controller: _departureDateTextController,
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _lottieAnimationController.dispose();
  }
}
