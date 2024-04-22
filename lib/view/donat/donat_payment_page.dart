import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:koupet/theme/app_color.dart';
import 'package:koupet/view/donat/donat_page.dart';

class DonatPaymentPage extends StatelessWidget {
  final ShoppingCart cart;

  const DonatPaymentPage({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödeme Sayfası'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Ücret: \$${cart.calculateTotal().toStringAsFixed(2)}',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ConstantsColor.purpleColor),
              onPressed: () {
                
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Ödeme Başarılı'),
                    content: Text('Bağış yaptığınız için teşekkür ederiz!'),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ConstantsColor.purpleColor),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('Tamam',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Şimdi Öde',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
