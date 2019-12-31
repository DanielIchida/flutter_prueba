import 'package:flutter/material.dart';
import 'package:flutter_prueba/src/pages/models/transaction.dart';
import 'package:flutter_prueba/src/pages/widgets/new_transaction.dart';
import 'package:flutter_prueba/src/pages/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.9, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now())
  ];

  void _addNewTransaction(String txtTitle, double txAmount) {
    final newTx = Transaction(
        title: txtTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(_addNewTransaction), TransactionList(transactions)],
    );
  }
}
