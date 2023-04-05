import 'package:app/qr.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'button',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyButton(),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('약리미',
          style: new TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child:Column(
                children: [
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded( // QR코드 검색
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                            SizedBox(
                              height: 130,
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('QR코드 검색 button');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const QrApp()),
                                  );
                                },
                                child: Text('QR코드 검색',
                                  style: new TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orangeAccent, // 텍스트 버튼과 다르게 배경색 변경
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    maximumSize: const Size(130,130),
                                    // padding: const EdgeInsets.all(10),
                                    elevation: 0.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded( // 이미지 검색
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                            SizedBox(
                              height: 130,
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('이미지 검색');
                                },
                                child: Text('이미지 검색',
                                  style: new TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orangeAccent, // 텍스트 버튼과 다르게 배경색 변경
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    maximumSize: const Size(130,130),
                                    // padding: const EdgeInsets.all(10),
                                    elevation: 0.0),
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded( // 약 검색
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                            SizedBox(
                              height: 130,
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('약 검색 button');
                                },
                                child: Text('약 검색',
                                  style: new TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orangeAccent, // 텍스트 버튼과 다르게 배경색 변경
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    maximumSize: const Size(130,130),
                                    // padding: const EdgeInsets.all(10),
                                    elevation: 0.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded( // 글자 인식
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                            SizedBox(
                              height: 130,
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('글자 인식 button');
                                },
                                child: Text('글자 인식',
                                  style: new TextStyle(
                                  fontSize: 26.0,
                                  color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                ),
                              ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orangeAccent, // 텍스트 버튼과 다르게 배경색 변경
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    maximumSize: const Size(130,130),
                                    // padding: const EdgeInsets.all(10),
                                    elevation: 0.0),
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded( // 복용 알림
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                            SizedBox(
                              height: 130,
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('복용 알림 button');
                                },
                                child: Text('복용 알림',
                                  style: new TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orangeAccent, // 텍스트 버튼과 다르게 배경색 변경
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    maximumSize: const Size(130,130),
                                    // padding: const EdgeInsets.all(10),
                                    elevation: 0.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded( // 검색 기록
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                            SizedBox(
                              height: 130,
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('검색 기록 button');
                                },
                                child: Text('검색 기록',
                                  style: new TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orangeAccent, // 텍스트 버튼과 다르게 배경색 변경
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    maximumSize: const Size(130,130),
                                    // padding: const EdgeInsets.all(10),
                                    elevation: 0.0),
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child:
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print('환경설정 button');
                          },
                          child: Text('환경설정',
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent, // 텍스트 버튼과 다르게 배경색 변경
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              // padding: const EdgeInsets.all(10),
                              elevation: 0.0),
                        ),
                      ),
                    ),
                  // Container(
                  //   color:Colors.red,
                  //   width: 100,
                  //   height: 100,
                  //   padding: const EdgeInsets.all(8.0),
                  // )
                ],
              ),
            )
          )
    );
  }
}