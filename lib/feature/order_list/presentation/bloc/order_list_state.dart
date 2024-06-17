// ignore_for_file: must_be_immutable

part of 'order_list_bloc.dart';

@immutable
class OrderListState extends Equatable {
  OrderListState({
    required this.tableInfoEntity,
  });

  List<TableInfoEntity> tableInfoEntity;

  @override
  List<Object?> get props => <Object?>[
        tableInfoEntity,
      ];

  OrderListState copyWith({
    int? quantity,
    List<TableInfoEntity>? tableInfoEntity,
  }) {
    return OrderListState(
      tableInfoEntity: tableInfoEntity ?? this.tableInfoEntity,
    );
  }
}

class GetAllTableListInfoState extends OrderListState {
  GetAllTableListInfoState({required List<TableInfoEntity> tableInfoEntity})
      : super(
          tableInfoEntity: tableInfoEntity,
        );
}
