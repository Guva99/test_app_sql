import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:test_app_sql/feature/order_list/domain/entity/table_info_entity.dart';
import 'package:test_app_sql/feature/order_list/domain/usecase/product_usecase.dart';

part 'order_list_event.dart';

part 'order_list_state.dart';

@lazySingleton
class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  OrderListBloc({required this.orderListUseCase}) : super(GetAllTableListInfoState(tableInfoEntity: const [])) {
    on<TableGetDataEvent>(_onGetDataEvent);

  }

  final OrderListUseCase orderListUseCase;

  Future<void> _onGetDataEvent(TableGetDataEvent event, Emitter<OrderListState> emit) async {
    try {
      final tableListInfo = await orderListUseCase.getActiveTableDetails();
      print('tableListInfo: ${tableListInfo}');

      emit(GetAllTableListInfoState(tableInfoEntity: tableListInfo));
    } catch (e) {
      print('ERRORORO: $e');
    }
  }
}
