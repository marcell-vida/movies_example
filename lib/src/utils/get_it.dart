import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_example_app/src/blocs/movies_bloc.dart';
import 'package:movies_example_app/src/repositories/movies_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Locator {
  static bool _initDone = false;

  static final GetIt _getIt = GetIt.instance;

  static T get<T extends Object>() {
    if (!_getIt.isRegistered<T>()) {
      throw Exception('Type $T is not registered');
    }
    return _getIt.get<T>();
  }

  static AppLocalizations get loc => get<AppLocalizations>();

  static MoviesRepository get moviesRepo => get<MoviesRepository>();

  static MoviesBloc get moviesBloc => get<MoviesBloc>();

  static void setup(BuildContext context) {
    if (_initDone) return;
    _initDone = true;

    _getIt.registerSingleton<MoviesRepository>(MoviesRepository());
    _getIt.registerSingleton<MoviesBloc>(MoviesBloc());
    AppLocalizations? loc = AppLocalizations.of(context);
    if (loc == null) {
      debugPrint('AppLocalizations is $loc');
      return;
    }

    _getIt.registerSingleton<AppLocalizations>(loc);
  }
}
