import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_repository/product_repository.dart';
import 'package:test_app_sql/core/resources/assets/resources.dart';
import 'package:test_app_sql/core/theme/app_corners.dart';
import 'package:test_app_sql/core/theme/style.dart';
import 'package:test_app_sql/core/theme/typography.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test_app_sql/core/utils/app_utils.dart';
import 'package:test_app_sql/core/widget/collapse_animated.dart';
import 'package:test_app_sql/feature/app/routing/path_route.dart';
import 'package:test_app_sql/feature/products/presentation/bloc/product_bloc.dart';

class ProductInfo {
  String name;
  String countStock;
  int price;

  ProductInfo({
    required this.name,
    required this.countStock,
    required this.price,
  });
}

class ProductsPage extends StatefulWidget {
  final int tableNumber;

  const ProductsPage({
    required this.tableNumber,
    super.key,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductInfo> products = [
    ProductInfo(
      name: 'Coca-Cola Classic 2л Пластик',
      countStock: '999',
      price: 400,
    ),
    ProductInfo(
      name: 'Фанта',
      countStock: '999',
      price: 300,
    ),
    ProductInfo(
      name: 'Спрайт',
      countStock: '999',
      price: 350,
    ),
    ProductInfo(
      name: 'Пепси',
      countStock: '999',
      price: 200,
    ),
    ProductInfo(
      name: 'Lipton',
      countStock: '999',
      price: 500,
    ),
    ProductInfo(
      name: 'Coca-Cola Classic 2л Пластик',
      countStock: '999',
      price: 200,
    ),
    ProductInfo(
      name: 'Coca-Cola Classic 2л Пластик',
      countStock: '999',
      price: 200,
    ),
    ProductInfo(
      name: 'Coca-Cola Classic 2л Пластик',
      countStock: '999',
      price: 100,
    ),
    ProductInfo(
      name: 'Coca-Cola Classic 2л Пластик',
      countStock: '999',
      price: 500,
    ),
    ProductInfo(
      name: 'Coca-Cola Classic 2л Пластик',
      countStock: '999',
      price: 400,
    ),
  ];

  @override
  void initState() {
    context.read<ProductBloc>().add(
          ProductGetDataEvent(tableNumber: widget.tableNumber),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Режим продаж'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoute.homeScreenPath),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Column(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  ProductDBRepository().clearAllData();
                },
                child: Text(
                  'CLEAR',
                  style: AppTypography.cf16Bold.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ),
              CollapseAnimatedBox(
                duration: const Duration(milliseconds: 500),
                isCollapse: state.productEntity.isEmpty,
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.productEntity.length,
                    itemBuilder: (context, index) {
                      final product = state.productEntity[index];
                      return ProductCard(
                        name: product.title,
                        quantity: product.quantity,
                        price: product.price,
                        id: product.id,
                        tableNumber: widget.tableNumber,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 150,
                      child: AnimationLimiter(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 4 / 3,
                            crossAxisSpacing: 13,
                            mainAxisSpacing: 0,
                          ),
                          itemCount: 2,
                          padding: const EdgeInsets.all(10),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 2,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: Container(
                                    decoration:
                                        BoxDecoration(borderRadius: AppCorners.radius10, color: AppColors.yellowLight),
                                    child: Center(
                                      child: Text(
                                        '${index + 1} Блюда',
                                        style: AppTypography.cf18Bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4 / 3,
                          crossAxisSpacing: 13,
                          mainAxisSpacing: 0,
                        ),
                        itemCount: products.length,
                        padding: const EdgeInsets.all(10),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: 2,
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: ProductTile(
                                  onTap: () {
                                    context.read<ProductBloc>().add(
                                          ProductAddEvent(
                                            price: product.price,
                                            name: product.name,
                                            quantity: 1,
                                            dateTime: AppUtils.formatTime(DateTime.now()),
                                            tableNumber: widget.tableNumber,
                                          ),
                                        );
                                    context.read<ProductBloc>().add(
                                          ProductGetDataEvent(tableNumber: widget.tableNumber),
                                        );
                                  },
                                  name: product.name,
                                  countStock: product.countStock,
                                  price: product.price,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final int quantity;
  final int price;
  final int tableNumber;
  final int id;

  const ProductCard({
    super.key,
    required this.name,
    required this.quantity,
    required this.price,
    required this.tableNumber,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.add,
                color: AppColors.greenDark,
              ),
              onPressed: () {
                context
                    .read<ProductBloc>()
                    .add(ProductIncreaseProductCountEvent(id: id, quantity: quantity, tableNumber: tableNumber));
              },
            ),
            Text('$quantity'),
            IconButton(
              icon: const Icon(
                Icons.remove,
                color: AppColors.red,
              ),
              onPressed: () {
                context
                    .read<ProductBloc>()
                    .add(ProductDecreaseProductCountEvent(id: id, quantity: quantity, tableNumber: tableNumber));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final String name;
  final String countStock;
  final int price;
  final VoidCallback? onTap;

  const ProductTile({
    super.key,
    required this.name,
    required this.onTap,
    required this.countStock,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: AppColors.black36,
          ),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    ImageAssets.cola, // Указывайте путь к вашему изображению
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    price.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                'Склад: $countStock',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
