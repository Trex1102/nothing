// import 'package:flutter/material.dart';

// class ExpenseTab extends StatefulWidget {
//   List<String> expenses = ['jjj', 'kkk'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Expense Tracker'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Text(
//                   "Today's Expense",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Total: \$${expenses.length}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: expenses.length,
//               itemBuilder: (context, index) {
//                 final expense = expenses[index];
//                 return ListTile(
//                   title: Text(expense),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           // Open a dialog to get user input for expense
//           showDialog(
//             context: context,
//             builder: (context) {
//               String newExpense = '';

//               return AlertDialog(
//                 title: Text('Add Expense'),
//                 content: TextField(
//                   onChanged: (value) {
//                     newExpense = value;
//                   },
//                   decoration: InputDecoration(labelText: 'Expense'),
//                 ),
//                 actions: [
//                   TextButton(
//                     child: Text('Cancel'),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   TextButton(
//                     child: Text('Save'),
//                     onPressed: () {
//                       // setState(() {
//                       //    expenses.add(newExpense);
//                       // });
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

// class IncomeTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Income Tracker'),
//       ),
//       body: Center(
//         child: Text('Income Tab'),
//       ),
//     );
//   }
// }

// class HomePageSS extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Expense'),
//               Tab(text: 'Income'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             ExpenseTab(),
//             IncomeTab(),
//           ],
//         ),
//       ),
//     );
//   }
// }
