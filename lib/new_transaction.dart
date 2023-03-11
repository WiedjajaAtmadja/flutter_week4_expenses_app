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

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Title'),
          controller: _titleController,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'Amount'),
          controller: _amountController,
          keyboardType: TextInputType.number,
          // onSubmitted: (_) => _submitData(),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Choose date'),
        ),
        ElevatedButton(
            onPressed: () => _submitData(),
            child: const Text('Add Transaction'))
      ],
    );
  }
}
