import 'package:flutter/material.dart';
import 'package:flutter_prueba/src/pages/widgets/new_transaction.dart';
import 'package:flutter_prueba/src/pages/widgets/transaction_list.dart';

import 'models/transaction.dart';

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

  void startAddNewTransacction(BuildContext ctx){
     showModalBottomSheet(context: ctx,
         builder: (_) {
          return GestureDetector(
              onTap: (){},
              child: NewTransaction(_addNewTransaction),
              behavior: HitTestBehavior.opaque,
          );
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => startAddNewTransacction(context)
            )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(color: Colors.blue, child: Text("CHART"), elevation: 5),
              ),
              TransactionList(transactions)
            ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: () => startAddNewTransacction(context),
      ),
    );
  }
}
