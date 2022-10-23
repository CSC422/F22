import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      products: [
        Product(name: 'Eggs', active: true),
        Product(name: 'Flour', active: true),
        Product(name: 'Chocolate chips', active: true),
        Product(name: 'Milk', active: true)
      ],
    ),
  ));
}

class Product {
  Product({required this.name, this.active = true});

  final String name;
  bool active;
}

typedef CartChangedCallback = Function(Product product);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.active,
    required this.onCartChanged,
  }) : super(key: UniqueKey()); //ValueKey(product.name));

  final Product product;
  final bool active;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return active //
        ? Theme.of(context).primaryColor
        : Colors.black54;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (active) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, Key? key}) : super(key: key);

  final List<Product> products;

  // The framework calls createState the first time
  // a widget appears at a given location in the tree.
  // If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses
  // the State object instead of creating a new State object.

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  
  void _handleCartChanged(Product product) {
    setState(() {
      product.active = !product.active;
      List<Product> temp = [];

      for (var p in widget.products) {
        if (!p.active) {
          temp.add(p);
        }
      }
      for (var p in temp) {
        widget.products.remove(p);
      }
      widget.products.addAll(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ReorderableListView(
        header: const Center(child: Text('Reorderable Shopping Cart')),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex = newIndex - 1;
            }
            final element = widget.products.removeAt(oldIndex);
            widget.products.insert(newIndex, element);
          });
        },
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            active: product.active,
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
