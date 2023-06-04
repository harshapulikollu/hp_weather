import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hp_weather/model/place.dart';
import 'package:hp_weather/repository/places/get_places_repository_interface.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  final GetPlacesInterface _getPlacesInterface;
  PlacesCubit(
      this._getPlacesInterface,
      ) : super(PlacesInitial());

  Future<void> getPlaces(String placeName) async {
    emit(PlacesFetching());
    try {
      final response = await _getPlacesInterface.getPlaces(placeName);
      emit(PlacesFetchingSuccessful(placesList: response));
    } catch (e) {
      emit(PlacesFetchingFailed(message: e.toString()));
    }
  }
}
