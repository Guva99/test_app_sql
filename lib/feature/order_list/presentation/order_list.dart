import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app_sql/core/internal/di/modal_bottom_sheet_di/abstract/modal_bottom_sheet_di.dart';
import 'package:test_app_sql/core/resources/assets/resources.dart';
import 'package:test_app_sql/core/theme/style.dart';
import 'package:test_app_sql/core/theme/typography.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test_app_sql/feature/order_list/presentation/bloc/order_list_bloc.dart';
import 'package:test_app_sql/feature/products/presentation/bloc/product_bloc.dart';
import 'package:test_app_sql/feature/products/presentation/bloc/product_bloc.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказы'),
      ),
      body: BlocBuilder<OrderListBloc, OrderListState>(
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Expanded(
                child: AnimationLimiter(
                  child: ListView.separated(
                    itemCount: state.tableInfoEntity.length,
                    itemBuilder: (context, index) {
                      final tableInfo = state.tableInfoEntity[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          verticalOffset: 500.0,
                          child: FadeInAnimation(
                              child: InkWell(
                            onTap: () {
                              GetIt.I<ModalBottomSheetDi>().showBottomSheet(
                                context: context,
                                isDismissible: true,
                                title: 'Детальный заказ',
                                body: BlocBuilder<ProductBloc, ProductState>(
                                  builder: (context, state) {
                                    return SizedBox(
                                      height: 300,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: state.productEntity.length,
                                        itemBuilder: (context, index) {
                                          final product = state.productEntity[index];
                                          return Container(
                                            // name: product.title,
                                            // quantity: product.quantity,
                                            // price: product.price,
                                            // id: product.id,
                                            // tableNumber: widget.tableNumber,
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      ImageAssets.cola, // Указывайте путь к вашему изображению
                                                      height: 50,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text(product.title,style: AppTypography.cf16SemiBold,),
                                                    Spacer(),
                                                    Column(
                                                      children: [
                                                        Text('${product.price} руб',style: AppTypography.cf16SemiBold,),
                                                        Text('${product.quantity} шт',style: AppTypography.cf16SemiBold,),
                                                      ],
                                                    )

                                                  ],
                                                )
                                              ],
                                            )

                                            //     ListTile(
                                            // title: Text(product.title.toString()),
                                            // subtitle: Text('кол-во; ${product.quantity}'),
                                            // trailing: Column(
                                            // children: [
                                            // Text('Цена: ${product.price.toString()} руб'),
                                            // ],
                                            // )
                                            // ,
                                            // )
                                            ,
                                          );
                                        }, separatorBuilder: (BuildContext context, int index) {
                                          return Divider();
                                      },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            child: CustomListTitleWidget(
                              tableNumber: tableInfo.tableNumber,
                              itemCount: tableInfo.itemCount,
                              totalAmount: tableInfo.totalAmount,
                            ),
                          )),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class CustomListTitleWidget extends StatelessWidget {
  const CustomListTitleWidget({
    super.key,
    required this.tableNumber,
    required this.itemCount,
    required this.totalAmount,
  });

  final int tableNumber;
  final int itemCount;
  final int totalAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.table_bar, color: AppColors.black),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              const Text('Посетитель', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text('Стол: ${tableNumber.toString()}'),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'кол: ${itemCount}',
                style: AppTypography.cf18SemiBold,
              ),
              SizedBox(height: 20),
              Text(
                '${totalAmount}',
                style: AppTypography.cf18SemiBold,
              ),
            ],
          )
        ],
      ),
    );
  }
}
