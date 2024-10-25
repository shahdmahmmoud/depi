import 'package:depi/domain/usecases/search_location_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'location_event.dart';
import 'location_state.dart';
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final SearchLocationUseCase searchLocationUseCase;

  LocationBloc(this.searchLocationUseCase) : super(LocationInitial());

  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is FetchHotels) {
      yield* _fetchHotels(event);
    } else if (event is FetchHotelsByLocation) {
      yield* _fetchHotelsByLocation(event);
    } else if (event is FetchHotelDetails) {
      yield* _fetchHotelDetails(event);
    } else if (event is FetchSearchLocation) {
      yield* _fetchSearchLocation(event);
    }
  }

  Stream<LocationState> _fetchHotels(FetchHotels event) async* {
    yield LocationLoading();
    try {
      final hotels = await searchLocationUseCase.callHotels(
          event.pageNumber, event.currencyCode);
      yield LocationLoaded(hotels);
    } catch (e) {
      yield LocationError(e.toString());
    }
  }

  Stream<LocationState> _fetchHotelsByLocation(
      FetchHotelsByLocation event) async* {
    yield LocationLoading();
    try {
      final hotels = await searchLocationUseCase.callHotelsByLocation(
          event.latitude,
          event.longitude,
          event.pageNumber,
          event.currencyCode);
      yield LocationLoaded(hotels);
    } catch (e) {
      yield LocationError(e.toString());
    }
  }

  Stream<LocationState> _fetchHotelDetails(FetchHotelDetails event) async* {
    yield LocationLoading();
    try {
      final hotelDetails =
          await searchLocationUseCase.callHotelDetails(event.currency);
      yield HotelDetailsLoaded(hotelDetails);
    } catch (e) {
      yield LocationError(e.toString());
    }
  }

  Stream<LocationState> _fetchSearchLocation(FetchSearchLocation event) async* {
    yield LocationLoading();
    try {
      final locations =
          await searchLocationUseCase.callSearchLocation(event.query);
      yield SearchLocationLoaded(locations);
    } catch (e) {
      yield LocationError(e.toString());
    }
  }
}
