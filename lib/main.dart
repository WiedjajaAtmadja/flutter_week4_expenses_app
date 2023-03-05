import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'Sepatu Baru', amount: 350000, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Makan Siang', amount: 38000, date: DateTime.now()),
  ];

  void _showInputSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Column(
            children: [
              const TextField(decoration: InputDecoration(labelText: 'Title')),
              const TextField(decoration: InputDecoration(labelText: 'Amount')),
              TextButton(onPressed: () {}, child: const Text('Choose Date')),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Add Transaction'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Expense App'))),
      body: ListView.builder(
          itemCount: _userTransactions.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(_userTransactions[index].title),
              subtitle: Text(DateFormat('dd MMM y, hh:mm:ss')
                  .format(_userTransactions[index].date)),
              trailing: Text(NumberFormat('Rp #000', 'id-ID')
                  .format(_userTransactions[index].amount)),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showInputSheet(context),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
