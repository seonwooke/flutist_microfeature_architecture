import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc
    extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial()) {
    on<CartStarted>(_onStarted);
  }

  Future<void> _onStarted(
    CartStarted event,
    Emitter<CartState> emit,
  ) async {
    // TODO: implement
  }
}