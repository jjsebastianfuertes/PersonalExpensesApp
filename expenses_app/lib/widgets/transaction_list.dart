import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        height: 450,
        child: transactions.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/budget.png',
                    height: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text('No transaction added yet!',
                        style: Theme.of(context).textTheme.title),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 3.5,
                    child: Row(
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
                                fontSize: 20,
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
                        )
                      ],
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
      ),
    );
  }
}
