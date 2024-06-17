import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app_sql/feature/products/domain/entity/product_entity.dart';
import 'package:test_app_sql/feature/products/domain/usecase/product_usecase.dart';

part 'product_event.dart';

part 'product_state.dart';

@lazySingleton
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.productUseCase}) : super(GetAllProductsState(productEntity: const [])) {
    on<ProductGetDataEvent>(_onGetDataEvent);
    on<ProductDeleteEvent>(_onDeleteProductEvent);
    on<ProductAddEvent>(_onAddProductEvent);
    on<ProductIncreaseProductCountEvent>(_onProductIncreaseProductCountEvent);
    on<ProductDecreaseProductCountEvent>(_onProductDecreaseProductCountEvent);
  }

  final ProductUseCase productUseCase;

  void _onDeleteProductEvent(ProductDeleteEvent event, Emitter<ProductState> emit) {
    productUseCase.deleteProduct(id: event.id);
  }

  void _onAddProductEvent(ProductAddEvent event, Emitter<ProductState> emit) {
    int randomNumber = 100;
    randomNumber = Random().nextInt(901) + 100;
    productUseCase.addProduct(
      id: randomNumber,
      name: event.name,
      dateTime: event.dateTime,
      price: event.price,
      quantity: event.quantity,
      tableNumber: event.tableNumber,
    );
  }

  void _onProductIncreaseProductCountEvent(ProductIncreaseProductCountEvent event, Emitter<ProductState> emit) async {

    productUseCase.incrementProductQuantity(id: event.id);
    final products = await productUseCase.getProduct(event.tableNumber);
    emit(GetAllProductsState(productEntity: products));
  }

  void _onProductDecreaseProductCountEvent(ProductDecreaseProductCountEvent event, Emitter<ProductState> emit) async {
    if(event.quantity==1){
      productUseCase.deleteProduct(id: event.id);
      final products = await productUseCase.getProduct(event.tableNumber);
      emit(GetAllProductsState(productEntity: products));
      return;
    }
    productUseCase.decrementProductQuantity(
      id: event.id,
    );
    final products = await productUseCase.getProduct(event.tableNumber);
    emit(GetAllProductsState(productEntity: products));
  }

  Future<void> _onGetDataEvent(ProductGetDataEvent event, Emitter<ProductState> emit) async {
    final products = await productUseCase.getProduct(event.tableNumber);
    emit(GetAllProductsState(productEntity: products));
  }
}
