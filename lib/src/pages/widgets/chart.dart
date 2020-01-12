import 'package:flutter/material.dart';
import 'package:flutter_prueba/src/pages/models/transaction.dart';
import 'package:flutter_prueba/src/pages/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String,Object>> get groupedTransactionValues {
    return List.generate(7, (index){
        final weekDay = DateTime.now().subtract(Duration(days: index));
        var totalSum= 0.0;
        for(var i = 0 ; i < recentTransaction.length ; i++){
            if(recentTransaction[i].date.day == weekDay.day
              && recentTransaction[i].date.month == weekDay.month
              && recentTransaction[i].date.year == weekDay.year){
                 totalSum += recentTransaction[i].amount;
            }
        }
        return {
          'day' : DateFormat.E().format(weekDay).substring(0,1) ,
          'amount' : totalSum
        };
    }).reversed.toList();
  }

  double get totalSpeding {
     return groupedTransactionValues.fold(0.0, (sum,item) {
          return sum + item['amount'];
     });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          elevation: 6,
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransactionValues.map((data){
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      data['day'],
                      data['amount'],
                      totalSpeding == 0.0 ?
                      0.0 : (data['amount'] as double) / totalSpeding),
                );
              }).toList(),
            ),
          ),
        ),
    );
  }
}
