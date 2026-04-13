import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_interface/product_interface.dart';

import 'product_detail_event.dart';
import 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {

  ProductDetailBloc({required ProductRepository repository})
      : _repository = repository,
        super(const ProductDetailInitial()) {
    on<ProductDetailStarted>(_onStarted);
  }
  final ProductRepository _repository;

  Future<void> _onStarted(
    ProductDetailStarted event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(const ProductDetailLoading());
    try {
      final product = await _repository.getProductById(event.productId);
      emit(ProductDetailSuccess(product));
    } catch (e) {
      emit(ProductDetailFailure(e.toString()));
    }
  }
}
