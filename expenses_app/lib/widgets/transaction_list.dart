import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        child: transactions.isEmpty
            ? LayoutBuilder(
                builder: (ctx, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/budget.png',
                        height: constraints.maxHeight * 0.6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text('No transaction added yet!',
                            style: Theme.of(context).textTheme.title),
                      ),
                    ],
                  );
                },
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return FittedBox(
                    child: Card(
                      elevation: 3.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                            child: Text(
                              '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(transactions[index].title,
                                    style: Theme.of(context).textTheme.title),
                                Text(
                                  DateFormat.yMMMMd()
                                      .format(transactions[index].date),
                                  style: Theme.of(context).textTheme.subtitle,
                                )
                              ],
                            ),
                          ),
                          MediaQuery.of(context).size.width > 360
                              ? FlatButton.icon(
                                  icon: Icon(Icons.delete),
                                  label: Text('Delete'),
                                  textColor: Theme.of(context).errorColor,
                                  onPressed: () =>
                                      deleteTx(transactions[index].id),
                                )
                              : IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () =>
                                      deleteTx(transactions[index].id),
                                )
                        ],
                      ),
                    ),
                  
                },
                itemCount: transactions.length,
              ),
      ),
    );
  }
}
