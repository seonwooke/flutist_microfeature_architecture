import 'package:network_implementation/network_implementation.dart';
import 'package:network_interface/network_interface.dart';
import 'package:network_testing/network_testing.dart';
import 'package:test/test.dart';

void main() {
  group('MockHttpClient', () {
    late HttpClient client;

    setUp(() {
      client = MockHttpClient();
    });

    test('is an HttpClient', () {
      expect(client, isA<HttpClient>());
    });
  });

  group('DioHttpClient', () {
    test('can be instantiated', () {
      final client = DioHttpClient();
      expect(client, isA<HttpClient>());
    });
  });
}
