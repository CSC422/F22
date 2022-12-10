import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeProductsRepository {
  final List<Product> _products = kTestProducts;

  List<Product> getProductsList() {
    return _products;
  }

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProductsList() async {
    await Future.delayed(const Duration(seconds: 3));
    //throw Exception('Error fetching product list');
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductsList() async* {
    await Future.delayed(const Duration(seconds: 3));
    yield _products;
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}

final productsRepoProvider = Provider<FakeProductsRepository>((ref) {
  return FakeProductsRepository();
});

final productsListStreamProvider = StreamProvider<List<Product>>((ref) {
  final productsRepo = ref.watch(productsRepoProvider);
  return productsRepo.watchProductsList();
});

final productsListFutureProvider = FutureProvider<List<Product>>((ref) {
  final productsRepo = ref.watch(productsRepoProvider);
  return productsRepo.fetchProductsList();
});

// final productProvider = StreamProvider.family<Product?, String>((ref, id) {
//   final productsRepo = ref.watch(productsRepoProvider);
//   return productsRepo.watchProduct(id);
// });
