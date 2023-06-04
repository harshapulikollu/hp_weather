import 'package:flutter/material.dart';
import 'package:hp_weather/model/place.dart';
import 'package:hp_weather/ui/widgets/place_listitem.dart';

class PlacesListView extends StatelessWidget {
  const PlacesListView({super.key, required this.placesList});
  final List<Place> placesList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        Place place = placesList[index];

        return PlaceListItem(
          displayName: place.displayName,
          icon: place.icon ?? '',
          onTap: () {
            Navigator.pop(context, (place.lat, place.lon));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: placesList.length,
    );
  }
}
