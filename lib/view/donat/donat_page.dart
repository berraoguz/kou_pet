import 'package:flutter/material.dart';
import 'package:koupet/model/product.dart';
import 'package:koupet/theme/app_color.dart';
import 'package:koupet/view/donat/donat_payment_page.dart';
import 'package:koupet/view/petShop/petshop_page.dart';

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

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final ShoppingCart _cart = ShoppingCart();

  List<Product> _availableProducts = [
    Product("3 Köpek maması alana,köpek maması bedava", 20.0),
    Product("Kedi maması", 30.0),
    Product("Kuş Yemi", 15.0),
    Product("Köpek maması", 20.0),
    Product("Kedi maması", 30.0),
    Product("Kuş Yemi", 15.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// drawer: ComtDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Bağış Yap',
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
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2)),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.2)),
                                      color: ConstantsColor.purpleColor),
                                  child: Image.asset(
                                    "assets/bagisimagetwo.png",
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          maxLines: 4,
                                          product.name,
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                            '\$${product.price.toStringAsFixed(2)}'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Color.fromARGB(
                                              255, 146, 250, 150),
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
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 60,
                          bottom: 0,
                          left: 110,
                          child: Container(
                              height: 70,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2)),
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: Image.asset("assets/petshopimage.png")),
                        ),
                        const Positioned(
                          top: 60,
                          bottom: 0,
                          left: 100,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            child: Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
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
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2)),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.2)),
                                      color: ConstantsColor.purpleColor),
                                  child: Image.asset(
                                    "assets/bagisimagetwo.png",
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          maxLines: 4,
                                          product.name,
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                            '\$${product.price.toStringAsFixed(2)}'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Color.fromARGB(
                                              255, 247, 146, 139),
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
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 60,
                          bottom: 0,
                          left: 110,
                          child: Container(
                              height: 70,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2)),
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: Image.asset("assets/petshopimage.png")),
                        ),
                        const Positioned(
                          top: 60,
                          bottom: 0,
                          left: 100,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Color.fromARGB(255, 237, 237, 237),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
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
                    style: TextStyle(
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
                    builder: (context) => DonatPaymentPage(cart: _cart),
                  ),
                );
              },
              child: Text(
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
