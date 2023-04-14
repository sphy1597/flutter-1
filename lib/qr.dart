import 'package:flutter/material.dart';

void main() => runApp(QrApp());

class QrApp extends StatelessWidget {
  const QrApp({Key? key}) : super(key: key);

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
          title: Text('QR코드 검색',
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
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child:
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print('카메라 사용하기 button');
                          },
                          child: Text('카메라 사용하기',
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