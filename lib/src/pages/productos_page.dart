import 'package:flutter/material.dart';
import 'package:flutter_prueba/src/pages/widgets/chart.dart';
import 'package:flutter_prueba/src/pages/widgets/new_transaction.dart';
import 'package:flutter_prueba/src/pages/widgets/transaction_list.dart';

import 'models/transaction.dart';

class ProductosPage extends StatefulWidget {
  ProductosPage({Key key}) : super(key: key);

  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {

  bool _showChart = false;

  final List<Transaction> transactions = [
    /*Transaction(
        id: 't1', title: 'New Shoes', amount: 69.9, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now())*/
  ];

  List<Transaction> get _recentTransaction {
     return transactions.where((tx){
         return tx.date.isAfter(
            DateTime.now().subtract(
                Duration(
                   days: 7
                )
            )
         );
     }).toList();
  }

  void _addNewTransaction(String txtTitle, double txAmount,DateTime chosenDate) {
    final newTx = Transaction(
        title: txtTitle,
        amount: txAmount,
        date: chosenDate,
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

  void _deleteTransaction(String id){
     setState(() {
         transactions.removeWhere((tx) => tx.id == id);
     });
  }


  
  @override
  Widget build(BuildContext context) {

    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text("Flutter App"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransacction(context)
        )
      ],
    );

    final listWidget =  Container(
      height: (MediaQuery.of(context).size.height
          - appBar.preferredSize.height
          -
          MediaQuery.of(context).padding.top) * 0.7,
      child: TransactionList(transactions,_deleteTransaction),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                if(isLandscape) Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text("Show Chart"),
                    Switch(
                      value: _showChart,
                      onChanged: (val) {
                         setState(() {
                             _showChart = val;
                         });
                      },
                    )
                ],
               ),
              if(!isLandscape)
                Container(
                  height: (MediaQuery.of(context).size.height
                      - appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) * 0.3,
                  child: Chart(_recentTransaction),
                ),
                if(!isLandscape) listWidget,
                if(isLandscape) _showChart ? Container(
                 height: (MediaQuery.of(context).size.height
                     - appBar.preferredSize.height -
                     MediaQuery.of(context).padding.top) * 0.7,
                 child: Chart(_recentTransaction),
              ) : listWidget
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
