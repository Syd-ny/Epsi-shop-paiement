import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/article.dart';
import '../bo/cart.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  final String clientName = "Boud ZOZO";
  final String deliveryAddress = "123, Rue de l'Epsi, 44000 Nantes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Finalisation de la commande"),
      ),
      body: Consumer <Cart> (
        builder: (context,cart,child) {
          double subtotal = cart.getSubtotal();
          double tax = cart.getTax();
          double total = cart.getTotal();

          return Column(
            children: [
              //récapitulatif commande
              Card(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Récapitulatif de la commande", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height:8),
                    _buildPriceRow(context, "Sous-total:", "$subtotal €"),
                    _buildPriceRow(context, "TVA:", "$tax €"),
                    Divider(),
                    _buildPriceRow(context, "Total:", "$total €", isTotal: true),
                    _buildClientInfoCard(),
                    _buildPaymentOptions(),
                  ],
                ),
              )
            ]
          );
        },
      ),

      bottomNavigationBar: BottomAppBar(
        child:  Padding(
          padding: EdgeInsets.all(8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              ),
            onPressed: () {
              //logique de finalisation d'achat
            },
            child: Text("Confirmer l'achat"),
          ),
        )
      ),
    );
  }

  Widget _buildPriceRow(BuildContext context, String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: isTotal ? TextStyle(fontWeight: FontWeight.bold) : null),
        Text(value,
            style: isTotal ? TextStyle(fontWeight: FontWeight.bold) : null),
      ],
    );
  }

    Widget _buildClientInfoCard() {
      return Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Informations du client", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text("Nom : $clientName"),
              Text("Adresse de livraison : $deliveryAddress"),
            ],
          ),
        ),
      );
    }

  Widget _buildPaymentOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Moyens de paiement", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text("Carte Bancaire"),
          onTap: () {
            // Logique de paiement par carte bancaire
          },
        ),
        ListTile(
          leading: Icon(Icons.account_balance_wallet),
          title: Text("Virement"),
          onTap: () {
            // Logique de paiement par virement
          },
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text("PayPal"),
          onTap: () {
            // Logique de paiement par PayPal
          },
        ),
      ],
    );
  }
}


