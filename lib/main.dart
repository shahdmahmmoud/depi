import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depi/domain/usecases/search_location_usecase.dart';
import 'package:depi/data/datasource/remote/tripadvisor_api.dart';
import 'package:depi/data/repository/tripadvisor_repository.dart';
import 'package:depi/presentation/bloc/location_bloc.dart';
import 'package:depi/presentation/pages/search_location_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final api = TripAdvisorApi(); // Ensure you have implemented this
    final repository = TripAdvisorRepository(api);
    final searchLocationUseCase = SearchLocationUseCase(repository);

    return MaterialApp(
      title: 'TripAdvisor Search',
      home: BlocProvider(
        create: (context) => LocationBloc(searchLocationUseCase),
        child: SearchLocationPage(),
      ),
    );
  }
}
