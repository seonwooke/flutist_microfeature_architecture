import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_interface/product_interface.dart';

import 'product_list_event.dart';
import 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {

  ProductListBloc({required ProductRepository repository})
      : _repository = repository,
        super(const ProductListInitial()) {
    on<ProductListStarted>(_onStarted);
    on<ProductListRefreshed>(_onRefreshed);
  }
  final ProductRepository _repository;

  Future<void> _onStarted(
    ProductListStarted event,
    Emitter<ProductListState> emit,
  ) async {
    emit(const ProductListLoading());
    await _load(emit);
  }

  Future<void> _onRefreshed(
    ProductListRefreshed event,
    Emitter<ProductListState> emit,
  ) async {
    emit(const ProductListLoading());
    await _load(emit);
  }

  Future<void> _load(Emitter<ProductListState> emit) async {
    try {
      final products = await _repository.getProducts();
      emit(ProductListSuccess(products));
    } catch (e) {
      emit(ProductListFailure(e.toString()));
    }
  }
}
