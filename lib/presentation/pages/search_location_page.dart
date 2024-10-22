import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depi/presentation/bloc/location_bloc.dart';
import 'package:depi/presentation/bloc/location_event.dart';
import 'package:depi/presentation/bloc/location_state.dart';

class SearchLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Locations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (query) {
                BlocProvider.of<LocationBloc>(context)
                    .add(FetchSearchLocation(query));
              },
              decoration: InputDecoration(
                hintText: 'Search for locations or hotels',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  if (state is LocationLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is LocationLoaded) {
                    return ListView.builder(
                      itemCount: state.locations.length, // This should work now
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.locations[index]
                              .toString()), // Adjust based on your model
                        );
                      },
                    );
                  } else if (state is LocationError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return Center(child: Text('Enter a search query.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
