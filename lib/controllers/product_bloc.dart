import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_bloc_cubit/controllers/product_event.dart';
import 'package:flutter_state_management_bloc_cubit/models/product_model.dart';
import 'package:flutter_state_management_bloc_cubit/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductLoading()) {
    on<GetDataEvent>(_getProductData);
  }

  ProductRepo productRepo = ProductRepo();

  FutureOr<void> _getProductData(GetDataEvent event, Emitter<ProductState> emit) async {
    try {
      final List<ProductModel> products = await productRepo.getProductData();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
