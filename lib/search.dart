import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:app/searchPage.dart';

void main() => runApp(SearchApp());

class SearchApp extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchApp> {
  final TextEditingController meName = TextEditingController();
  List<dynamic> itemList = []; // 의약품 리스트

  Future<void> getData() async {
    // 검색 버튼 눌렀을때
    var url = Uri.parse(
        'http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList'); // url주소
    var params = {
      'serviceKey':
          'euf1Zh/Ry00s3mzLoKv49YQE44utBM56c8gUYT9LdUAnChnbXAtVJihhQYbWVXxkPlC2yJJlgn8iQT1aEs+jOg==', // api키
      'itemName': meName.text, // 사용자가 입력한 값
      'type': 'json' // json 타입
    };

    var response = await http.get(url.replace(queryParameters: params));
    print(response.body); // 테스트용 print

    final json = jsonDecode(response.body);
    setState(() {
      itemList = json['body']['items']; // 리스트에 저장
    });
  }

  List<Widget> buildItemListButtons() {
    return itemList
        .map((item) => ElevatedButton(
            onPressed: () {
              // 의약품 터치했을 때
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => searchPage(item: item)));
              print("제품코드 : " + item['itemSeq']);
              print("제품명 : " + item['itemName']);
              print("효능 : " +
                  item['efcyQesitm'].replaceAll(
                      RegExp("<p>|</p>|<hr>|\\n|<br />"),
                      "")); // <p>, </p>, <hr>, \n, <br /> 제거
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.85, // 화면 크기의 85%
                child: Text(
                  item['itemName'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            )))
        .expand((button) => [button, SizedBox(height: 20)]) // 버튼 간격
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '약 검색',
          style: new TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            // 검색필드
            controller: meName,
            decoration: InputDecoration(
              labelText: '약 이름을 작성해주세요',
            ),
          ),
          ElevatedButton(
            // 검색 버튼
            onPressed: getData,
            child: Text(
              '검색',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            // 검색 버튼아래에 빈공간 만들기
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: buildItemListButtons(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
