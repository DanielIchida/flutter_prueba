import 'package:flutter/material.dart';
import 'package:flutter_prueba/src/pages/models/transaction.dart';

class ProductosPage extends StatefulWidget {
  ProductosPage({Key key}) : super(key: key);

  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.9, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(color: Colors.blue, child: Text("CHART"), elevation: 5),
          ),
          Column(
            children: transactions.map((t) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(t.amount.toString()),
                    ),
                    Column(
                      children: <Widget>[
                        Text(t.title),
                        Text(t.date.toString())
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
