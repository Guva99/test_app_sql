// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../feature/order_list/data/api/local_source/local_source.dart'
    as _i4;
import '../../../feature/order_list/data/repository/products_repository_impl.dart'
    as _i8;
import '../../../feature/order_list/domain/repository/product_repository.dart'
    as _i7;
import '../../../feature/order_list/domain/usecase/product_usecase.dart' as _i9;
import '../../../feature/order_list/presentation/bloc/order_list_bloc.dart'
    as _i12;
import '../../../feature/products/data/api/local_source/local_source.dart'
    as _i3;
import '../../../feature/products/data/repository/products_repository_impl.dart'
    as _i11;
import '../../../feature/products/domain/repository/product_repository.dart'
    as _i10;
import '../../../feature/products/domain/usecase/product_usecase.dart' as _i13;
import '../../../feature/products/presentation/bloc/product_bloc.dart' as _i14;
import 'modal_bottom_sheet_di/abstract/modal_bottom_sheet_di.dart' as _i5;
import 'modal_bottom_sheet_di/modal_bottom_sheet_di_impl.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.LocalResource>(() => _i3.LocalResource());
  gh.lazySingleton<_i4.LocalResourceOrderList>(
      () => _i4.LocalResourceOrderList());
  gh.lazySingleton<_i5.ModalBottomSheetDi>(() => _i6.ModalBottomSheetDiImpl());
  gh.lazySingleton<_i7.OrderListRepository>(() => _i8.OrderListRepositoryImpl(
      localResource: get<_i4.LocalResourceOrderList>()));
  gh.lazySingleton<_i9.OrderListUseCase>(() =>
      _i9.OrderListUseCase(productRepository: get<_i7.OrderListRepository>()));
  gh.lazySingleton<_i10.ProductsRepository>(() =>
      _i11.ProductsRepositoryImpl(localResource: get<_i3.LocalResource>()));
  gh.lazySingleton<_i12.OrderListBloc>(
      () => _i12.OrderListBloc(orderListUseCase: get<_i9.OrderListUseCase>()));
  gh.lazySingleton<_i13.ProductUseCase>(() =>
      _i13.ProductUseCase(productRepository: get<_i10.ProductsRepository>()));
  gh.lazySingleton<_i14.ProductBloc>(
      () => _i14.ProductBloc(productUseCase: get<_i13.ProductUseCase>()));
  return get;
}
