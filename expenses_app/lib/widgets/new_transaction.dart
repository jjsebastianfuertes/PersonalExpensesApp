import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                  child: Text('Add transaction'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    widget.addTx(
                      titleController.text,
                      double.parse(amountController.text),
                    );
                    Navigator.of(context).pop();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
