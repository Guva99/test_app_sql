import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app_sql/feature/order_list/presentation/bloc/order_list_bloc.dart';
import 'package:test_app_sql/feature/products/presentation/bloc/product_bloc.dart';

List<BlocProvider> buildListProviders({required GetIt locator}) {
  return <BlocProvider>[
    BlocProvider<ProductBloc>(
      create: (context) => locator<ProductBloc>(),
    ),
    BlocProvider<OrderListBloc>(
      create: (context) => locator<OrderListBloc>(),
    ),
  ];
}
