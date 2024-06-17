import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_sql/core/theme/app_corners.dart';
import 'package:test_app_sql/core/theme/style.dart';
import 'package:test_app_sql/core/theme/typography.dart';
import 'package:test_app_sql/feature/app/routing/path_route.dart';

//TODO Вынести
class TableInfo {
  String name;
  int number;
  bool? isVip;

  TableInfo({
    required this.name,
    required this.number,
    this.isVip,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//TODO Вынести

  List<TableInfo> tables = [
    TableInfo(
      name: 'VIP',
      number: 1,
      isVip: true,
    ),
    TableInfo(
      name: 'Основной',
      number: 14,
    ),
    TableInfo(
      name: 'Летка',
      number: 39,
    ),
    TableInfo(
      name: 'VIP',
      number: 2,
      isVip: true,
    ),
    TableInfo(
      name: 'VIP',
      number: 11,
      isVip: true,
    ),
    TableInfo(
      name: 'Основной',
      number: 13,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Столы'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AnimationLimiter(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 3,
                crossAxisSpacing: 13,
                mainAxisSpacing: 14,
              ),
              itemCount: tables.length,
              // Количество элементов
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final table = tables[index];
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  columnCount: tables.length,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: InkWell(
                          onTap: () {
                            context.go(AppRoute.productPagePath, extra: table.number);
                          },
                          child: TableCustomContainerWidget(table: table)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TableCustomContainerWidget extends StatelessWidget {
  const TableCustomContainerWidget({
    super.key,
    required this.table,
  });

  final TableInfo table;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppCorners.radius10,
        color: table.isVip == true ? AppColors.white : AppColors.yellowLight,
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            table.name,
            style: AppTypography.cf18Bold,
          ),
          Text(
            '№  ${table.number}',
            style: AppTypography.cf18Bold,
          ),
        ],
      )),
    );
  }
}
