import 'package:flutter/material.dart';
import 'package:koupet/model/product.dart';
import 'package:koupet/theme/app_color.dart';
import 'package:koupet/view/component/drawer.dart';
import 'package:koupet/view/petShop/payment_page.dart';

class ShoppingCart {
  List<Product> _items = [];

  List<Product> get items => _items;

  void addItem(Product product) {
    _items.add(product);
  }

  void removeItem(Product product) {
    _items.remove(product);
  }

  double calculateTotal() {
    return _items.fold(0, (sum, product) => sum + product.price);
  }
}

class PageShopping extends StatefulWidget {
  @override
  _PageShoppingState createState() => _PageShoppingState();
}

class _PageShoppingState extends State<PageShopping> {
  final ShoppingCart _cart = ShoppingCart();

  List<Product> _availableProducts = [
    Product("Köpek maması", 20.0),
    Product("Kedi maması", 30.0),
    Product("Kuş Yemi", 15.0),
    Product("Köpek maması", 20.0),
    Product("Kedi maması", 30.0),
    Product("Kuş Yemi", 15.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CompDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Alışveriş',
          style: TextStyle(
              color: ConstantsColor.purpleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _availableProducts.length,
              itemBuilder: (context, index) {
                final product = _availableProducts[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Container(
                      width: 120,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Image.asset("assets/petshopimage.png"),
                          hoverColor: const Color.fromARGB(255, 249, 231, 237),
                          title: Text(product.name),
                          subtitle:
                              Text('\$${product.price.toStringAsFixed(2)}'),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundColor: Color.fromARGB(255, 146, 250, 150),
                            child: IconButton(
                              alignment: Alignment.center,
                              icon: const Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _cart.addItem(product);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          const Text('Sepete eklenenler',
              style: TextStyle(
                  color: ConstantsColor.purpleColor,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: _cart.items.length,
              itemBuilder: (context, index) {
                final product = _cart.items[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Container(
                      width: 120,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Image.asset("assets/petshopimage.png"),
                          title: Text(product.name),
                          subtitle:
                              Text('\$${product.price.toStringAsFixed(2)}'),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundColor: Color.fromARGB(255, 247, 146, 139),
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove,
                                size: 15,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _cart.removeItem(product);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  color: Colors.white,
                ),
                height: 35,
                child: Center(
                  child: Text(
                    'Sepetim: \$${_cart.calculateTotal().toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ConstantsColor.purpleColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(cart: _cart),
                  ),
                );
              },
              child: const Text(
                'Ödeme Sayfasına Git',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
