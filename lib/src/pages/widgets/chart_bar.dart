import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double spedindAmount;
  final double spedingPctOfTotal;

  ChartBar(this.label,this.spedindAmount,this.spedingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
        builder: (ctx,constraints){
           return Column(children: <Widget>[
             Container(
               height: constraints.maxHeight * 0.15,
               child: FittedBox(
                 child: Text('\$${spedindAmount.toStringAsFixed(0)}'),
               ),
             ),
             SizedBox(height: constraints.maxHeight * 0.05,),
             Container(
               height: constraints.maxHeight * 0.6,
               width: 10,
               child: Stack(
                 children: <Widget>[
                   Container(
                     decoration: BoxDecoration(
                         border: Border.all(
                             color: Colors.grey,
                             width: 1.0
                         ),
                         color: Color.fromRGBO(220, 220, 220, 1),
                         borderRadius: BorderRadius.circular(10)
                     ),
                   ),
                   FractionallySizedBox(
                     heightFactor: spedingPctOfTotal,
                     child: Container(
                       decoration: BoxDecoration(
                           color: Theme.of(context).primaryColor
                       ),
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(height: constraints.maxHeight * 0.05,),
             Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(child: Text(label),),
             )
           ],);
        },
    );
  }
}
