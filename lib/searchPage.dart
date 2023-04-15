// import 'package:flutter/material.dart';

// class searchPage extends StatelessWidget {
//   final dynamic item;

//   searchPage({Key? key, required this.item}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('의약품 정보'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               item['itemName'],
//               style: TextStyle(
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               '효능 : ' +
//                   item['efcyQesitm']
//                       .replaceAll(RegExp("<p>|</p>|<hr>|\\n|<br />"), ""),
//               style: TextStyle(fontSize: 20.0),
//             ),
//             Text(
//               '사용법 : ' +
//                   item['useMethodQesitm']
//                       .replaceAll(RegExp("<p>|</p>|<hr>|\\n|<br />"), ""),
//               style: TextStyle(fontSize: 20.0),
//             ),
//             Text(
//               '부작용 : ' +
//                   item['seQesitm']
//                       .replaceAll(RegExp("<p>|</p>|<hr>|\\n|<br />"), ""),
//               style: TextStyle(fontSize: 20.0),
//             ),
//             Text(
//               '보관법 : ' +
//                   item['depositMethodQesitm']
//                       .replaceAll(RegExp("<p>|</p>|<hr>|\\n|<br />"), ""),
//               style: TextStyle(fontSize: 20.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class searchPage extends StatelessWidget {
  final Map<String, dynamic> item;

  searchPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의약품 정보'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: item.entries.map((entry) {
              final key = entry.key;
              final value = entry.value;

              return Text(
                '$key : ${value.toString().replaceAll(RegExp(r'<[^>]*>'), "")}',
                style: TextStyle(fontSize: 20.0),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
