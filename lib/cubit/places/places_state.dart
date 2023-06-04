part of 'places_cubit.dart';

abstract class PlacesState extends Equatable {
  const PlacesState();
}

class PlacesInitial extends PlacesState {
  @override
  List<Object> get props => [];
}

class PlacesFetching extends PlacesState {
  @override
  List<Object> get props => [];
}

class PlacesFetchingSuccessful extends PlacesState {
  final List<Place> placesList;
  const PlacesFetchingSuccessful({required this.placesList});
  @override
  List<Object> get props => [placesList];
}

class PlacesFetchingFailed extends PlacesState {
  final String message;
  const PlacesFetchingFailed({required this.message});
  @override
  List<Object> get props => [message];
}
