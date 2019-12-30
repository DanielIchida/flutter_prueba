import 'package:flutter/material.dart';
import 'package:flutter_prueba/src/pages/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((t) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  '\$${t.amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    t.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(t.date),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
