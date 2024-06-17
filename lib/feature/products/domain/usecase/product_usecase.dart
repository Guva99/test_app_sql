import 'package:injectable/injectable.dart';
import 'package:product_models/product_model.dart';
import 'package:product_repository/product_repository.dart';
import 'package:test_app_sql/feature/products/domain/entity/product_entity.dart';
import 'package:test_app_sql/feature/products/domain/repository/product_repository.dart';

@lazySingleton
class ProductUseCase {
  final ProductsRepository productRepository;

  const ProductUseCase({required this.productRepository});

  Future<void> addProduct({
    required String name,
    required String dateTime,
    required int price,
    required int id,
    required int quantity,
    required int tableNumber,
  }) async {
    await productRepository.addProduct(
      name: name,
      dateTime: dateTime,
      price: price,
      id: id,
      quantity: quantity,
      tableNumber: tableNumber,
    );
  }

  Future<List<ProductEntity>> getProduct(int tableNumber) async {
    return await productRepository.getProduct(  tableNumber);
  }

  Future<void> incrementProductQuantity({required int id}) async {
    await productRepository.incrementProductQuantity(id: id);
  }

  Future<void> decrementProductQuantity({required int id}) async {
    await productRepository.decrementProductQuantity(id: id);
  }

  Future<void> deleteProduct({required int id}) async {
    await productRepository.deleteProduct(id: id);
  }

  Future<void> updateProduct({
    required String name,
    required String dateTime,
    required int price,
    required int id,
    required int quantity,
    required int tableNumber,
  }) async {
    return await productRepository.updateProduct(
      name: name,
      dateTime: dateTime,
      price: price,
      id: id,
      quantity: quantity,
      tableNumber: tableNumber,
    );
  }
}
