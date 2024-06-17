// ignore_for_file: must_be_immutable

part of 'product_bloc.dart';

class ProductState extends Equatable {
  ProductState({
   required  this.productEntity,
  });

   List<ProductEntity> productEntity;

  @override
  List<Object?> get props => <Object?>[
         productEntity,
      ];

  ProductState copyWith({
    int? quantity,
    List<ProductEntity>? productEntity,
  }) {
    return ProductState(
       productEntity: productEntity ?? this.productEntity,
    );
  }
}

class GetAllProductsState extends ProductState {
  GetAllProductsState({required List<ProductEntity> productEntity})
      : super(
          productEntity: productEntity,
        );
}
