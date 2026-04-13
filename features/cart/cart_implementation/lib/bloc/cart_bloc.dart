import 'package:cart_interface/cart_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required CartRepository repository})
      : _repository = repository,
        super(const CartInitial()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
    on<CartCleared>(_onCleared);
  }
  final CartRepository _repository;

  Future<void> _onStarted(
    CartStarted event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoading());
    try {
      final cart = await _repository.getCart();
      emit(CartSuccess(cart));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  Future<void> _onItemAdded(
    CartItemAdded event,
    Emitter<CartState> emit,
  ) async {
    try {
      final cart = await _repository.addItem(event.item);
      emit(CartSuccess(cart));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  Future<void> _onItemRemoved(
    CartItemRemoved event,
    Emitter<CartState> emit,
  ) async {
    try {
      final cart = await _repository.removeItem(event.productId);
      emit(CartSuccess(cart));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  Future<void> _onCleared(
    CartCleared event,
    Emitter<CartState> emit,
  ) async {
    try {
      final cart = await _repository.clearCart();
      emit(CartSuccess(cart));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }
}
