import 'package:product_implementation/product_implementation.dart';
import 'package:product_interface/product_interface.dart';
import 'package:product_testing/product_testing.dart';
import 'package:test/test.dart';

void main() {
  late FakeProductRepository repository;

  final tProducts = [
    const Product(
      id: '1',
      name: 'Test Product',
      description: 'A test product',
      price: 9.99,
      imageUrl: '',
    ),
  ];

  setUp(() {
    repository = FakeProductRepository(products: tProducts);
  });

  group('ProductListBloc', () {
    test('initial state is ProductListInitial', () {
      final bloc = ProductListBloc(repository: repository);
      expect(bloc.state, isA<ProductListInitial>());
      bloc.close();
    });

    test('emits [Loading, Success] on ProductListStarted', () async {
      final bloc = ProductListBloc(repository: repository);

      expect(
        bloc.stream,
        emitsInOrder([
          isA<ProductListLoading>(),
          isA<ProductListSuccess>(),
        ]),
      );

      bloc.add(ProductListStarted());
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await bloc.close();
    });

    test('success state contains products', () async {
      final bloc = ProductListBloc(repository: repository);
      bloc.add(ProductListStarted());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<ProductListLoading>(),
          predicate<ProductListSuccess>((s) => s.products == tProducts),
        ]),
      );
      await bloc.close();
    });

    test('emits [Loading, Failure] on error', () async {
      final errorRepo = FakeProductRepository(
        error: Exception('fetch failed'),
      );
      final bloc = ProductListBloc(repository: errorRepo);

      expect(
        bloc.stream,
        emitsInOrder([
          isA<ProductListLoading>(),
          isA<ProductListFailure>(),
        ]),
      );

      bloc.add(ProductListStarted());
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await bloc.close();
    });
  });

  group('ProductDetailBloc', () {
    test('initial state is ProductDetailInitial', () {
      final bloc = ProductDetailBloc(repository: repository);
      expect(bloc.state, isA<ProductDetailInitial>());
      bloc.close();
    });

    test('emits [Loading, Success] on ProductDetailStarted', () async {
      final bloc = ProductDetailBloc(repository: repository);

      expect(
        bloc.stream,
        emitsInOrder([
          isA<ProductDetailLoading>(),
          isA<ProductDetailSuccess>(),
        ]),
      );

      bloc.add(ProductDetailStarted('1'));
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await bloc.close();
    });

    test('success state contains product', () async {
      final bloc = ProductDetailBloc(repository: repository);
      bloc.add(ProductDetailStarted('1'));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<ProductDetailLoading>(),
          predicate<ProductDetailSuccess>((s) => s.product == tProducts.first),
        ]),
      );
      await bloc.close();
    });

    test('emits [Loading, Failure] when product not found', () async {
      final bloc = ProductDetailBloc(repository: repository);

      expect(
        bloc.stream,
        emitsInOrder([
          isA<ProductDetailLoading>(),
          isA<ProductDetailFailure>(),
        ]),
      );

      bloc.add(ProductDetailStarted('non-existent'));
      await Future<void>.delayed(const Duration(milliseconds: 50));
      await bloc.close();
    });
  });
}
