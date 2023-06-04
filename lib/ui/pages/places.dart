import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_weather/cubit/places/places_cubit.dart';
import 'package:hp_weather/ui/widgets/attribution.dart';
import 'package:hp_weather/ui/widgets/places_listview.dart';
import 'package:hp_weather/ui/widgets/search.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded)),
            SearchWidget(
              onChanged: (String value) {
                context.read<PlacesCubit>().getPlaces(value);
              },
            ),
            const Attribution(name: 'OpenStreetMap', url:'https://www.openstreetmap.org/', showCopyright: true,),
            BlocBuilder<PlacesCubit, PlacesState>(builder: (context, state) {
              if (state is PlacesFetching) return const Center(child: CircularProgressIndicator(),);
              if (state is PlacesFetchingFailed) return Center(child: Text(state.message),);
              if (state is PlacesFetchingSuccessful) return Expanded(child: PlacesListView(placesList: state.placesList));
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
