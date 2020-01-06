import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData(){
    final enterTitle = _titleController.text;
    final enterAmount = double.parse(_amountController.text);

    if(enterTitle.isEmpty || enterAmount <= 0 || _selectedDate == null){
       return;
    }else{
      widget.addTx(
          _titleController.text,
          double.parse(_amountController.text),
          _selectedDate
      );
      Navigator.of(context).pop();
    }

  }

  void _presentDatePicket(){
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2019),
          lastDate: DateTime.now()
      ).then((pickedData){
          if (pickedData == null) {
             return;
          }
          setState(() {
            _selectedDate = pickedData;
          });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData()
              ),
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Text(_selectedDate == null ?  
                        "No Date Chosen!" 
                        : "Picked Date: ${DateFormat.yMd().format(_selectedDate)}"),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                          "Choose Date",
                          style: TextStyle(
                             fontWeight: FontWeight.bold
                          ),
                      ),
                      onPressed: _presentDatePicket,
                    )
                  ],
                ),
              ),
              FlatButton(
                child: Text("Add Transaction"),
                onPressed: _submitData,
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              )
            ],
          ),
        ));
  }
}
