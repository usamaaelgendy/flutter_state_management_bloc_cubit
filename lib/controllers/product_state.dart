part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

final class ProductLoading extends ProductState {
  const ProductLoading();

  @override
  List<Object?> get props => [];
}

final class ProductLoaded extends ProductState {
  final List<ProductModel> productList;

  const ProductLoaded(this.productList);

  @override
  List<Object?> get props => [productList];
}

final class ProductError extends ProductState {
  final String? errorMessage;

  const ProductError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
