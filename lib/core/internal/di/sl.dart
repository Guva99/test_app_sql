import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app_sql/core/internal/di/sl.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);

@module
abstract class RegisterModule {}
