import 'package:cart_implementation/cart_implementation.dart';
import 'package:cart_interface/cart_interface.dart';
import 'package:cart_testing/cart_testing.dart';
import 'package:test/test.dart';

void main() {
  late FakeCartRepository repository;

  const tItem = CartItem(
    productId: '1',
    name: 'Test Product',
    price: 9.99,
    quantity: 1,
  );

  setUp(() {
    repository = FakeCartRepository();
  });

  group('CartBloc', () {
    test('initial state is CartInitial', () {
      final bloc = CartBloc(repository: repository);
      expect(bloc.state, isA<CartInitial>());
      bloc.close();
    });

    test('emits [Loading, Success] on CartStarted', () async {
      final bloc = CartBloc(repository: repository);

      expect(
        bloc.stream,
        emitsInOrder([
          isA<CartLoading>(),
          isA<CartSuccess>(),
        ]),
      );

      bloc.add(CartStarted());
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await bloc.close();
    });

    test('emits Success with item after CartItemAdded', () async {
      final bloc = CartBloc(repository: repository);
      bloc.add(CartStarted());
      await Future<void>.delayed(const Duration(milliseconds: 50));

      bloc.add(CartItemAdded(tItem));

      await expectLater(
        bloc.stream,
        emits(predicate<CartSuccess>((s) => s.cart.items.length == 1)),
      );
      await bloc.close();
    });

    test('emits Success with empty cart after CartCleared', () async {
      final preloaded = FakeCartRepository(cart: const Cart(items: [tItem]));
      final bloc = CartBloc(repository: preloaded);
      bloc.add(CartStarted());
      await Future<void>.delayed(const Duration(milliseconds: 50));

      bloc.add(CartCleared());

      await expectLater(
        bloc.stream,
        emits(predicate<CartSuccess>((s) => s.cart.items.isEmpty)),
      );
      await bloc.close();
    });

    test('emits Success without item after CartItemRemoved', () async {
      final preloaded = FakeCartRepository(cart: const Cart(items: [tItem]));
      final bloc = CartBloc(repository: preloaded);
      bloc.add(CartStarted());
      await Future<void>.delayed(const Duration(milliseconds: 50));

      bloc.add(CartItemRemoved('1'));

      await expectLater(
        bloc.stream,
        emits(predicate<CartSuccess>((s) => s.cart.items.isEmpty)),
      );
      await bloc.close();
    });

    test('emits Failure on error', () async {
      final errorRepo = FakeCartRepository(error: Exception('network error'));
      final bloc = CartBloc(repository: errorRepo);

      expect(
        bloc.stream,
        emitsInOrder([
          isA<CartLoading>(),
          isA<CartFailure>(),
        ]),
      );

      bloc.add(CartStarted());
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await bloc.close();
    });
  });
}
