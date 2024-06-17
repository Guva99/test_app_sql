part of 'order_list_bloc.dart';

@immutable
sealed class OrderListEvent {}

class TableGetDataEvent extends OrderListEvent {
  TableGetDataEvent();
}
