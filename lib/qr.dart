import 'package:flutter/material.dart';
import 'package:app/qrcamera.dart';

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
          title: Text(
            'QR코드 검색',
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print('카메라 사용하기 button');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QRcodeWidget()),
                            ).then((value) {
                              String receive = value;
                              print('전달받은 값 : $receive');
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary:
                                  Colors.orangeAccent, // 텍스트 버튼과 다르게 배경색 변경
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              // padding: const EdgeInsets.all(10),
                              elevation: 0.0),
                          child: Text(
                            '카메라 사용하기',
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      //약 이름
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 242, 227, 219)),
                          child: Center(
                            child: Text(
                              '약 이름',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                    // 복용법
                    flex: 1,
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(243, 232, 255, 1)),
                            child: Center(
                              child: Text(
                                '복용법',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ))),
                  ),
                  Expanded(
                      //효능
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(220, 250, 210, 1)),
                          child: Center(
                            child: Text(
                              '효능',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      //주의사항
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(230, 230, 230, 1)),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '주의사항',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            )));
  }
}
