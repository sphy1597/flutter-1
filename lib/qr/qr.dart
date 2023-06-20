import 'package:flutter/material.dart';
import 'package:app/audioutill/audioUtil.dart';
import 'package:url_launcher/url_launcher.dart'; // 패키지
import 'dart:convert';
import 'dart:io';
import 'package:app/main.dart';
import 'package:app/qr/qrcamera.dart';
import 'package:http/http.dart' as http;
import 'package:app/search/imageSearch.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app/main.dart';
import 'package:app/search/searchPage.dart';

class QRcodeWidget extends StatefulWidget {
  const QRcodeWidget({Key? key}) : super(key: key);

  @override
  State<QRcodeWidget> createState() => _QRcodeWidgetState();
}

class _QRcodeWidgetState extends State<QRcodeWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");

  String name = "약 이름";
  String howeat = "복용법";
  String effect = "효능";
  String becareful = "주의사항";

  final _prefsPregnancyKey = 'selectedPregnancy';
  late SharedPreferences _prefsPregnancy;
  int? _selectedPregnancy;

  Map<String, dynamic> allergies = {
    // 알러지 정보
    '해산물': false,
    '견과류': false,
    '곡류': false,
    '천식': false,
    '아토피': false,
    '비염': false,
    '혈압': false,
    '신부전증': false,
    '과민증': false,
    '당뇨': false,
    '암': false,
    '편두통': false,
    '간질환': false,
    '신장질환': false,
    '소화기질환': false,
    '호흡질환': false,
    '정신질환': false,
    '근육질환': false,
    '심혈관질환': false,
    '뇌혈관질환': false,
  };

  void loadSelectedAllergies() async {
    // 알러지 정보 및 임신 여부 함수
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _prefsPregnancy = await SharedPreferences.getInstance();

    setState(() {
      _selectedPregnancy = _prefsPregnancy.getInt(_prefsPregnancyKey) ?? 0;
    });
    await _prefsPregnancy.setInt(_prefsPregnancyKey, _selectedPregnancy ?? 0);

    setState(() {
      allergies = Map<String, dynamic>.from(prefs.getString('allergies') != null
          ? json.decode(prefs.getString('allergies')!)
          : {
              '해산물': false,
              '견과류': false,
              '곡류': false,
              '천식': false,
              '아토피': false,
              '비염': false,
              '혈압': false,
              '신부전증': false,
              '과민증': false,
              '당뇨': false,
              '암': false,
              '편두통': false,
              '간질환': false,
              '신장질환': false,
              '소화기질환': false,
              '호흡질환': false,
              '정신질환': false,
              '근육질환': false,
              '심혈관질환': false,
              '뇌혈관질환': false,
            });
    });
    // print(_selectedPregnancy); // 임신 여부 테스트용
    // print(allergies); // 테스트용 프린트
  }

  String? trueAllergies(Map<String, dynamic> allergies, item) {
    // print(item['atpnQesitm']); // 테스트용 프린트
    // 알러지 및 임신 여부 비교 및 경고
    String? result;
    allergies.forEach((key, value) {
      // 알러지 비교 후 result 에 해당하는 알러지 단어 누적
      if (value == true) {
        if (item['atpnQesitm'] != null && item['atpnQesitm'].contains(key) ||
            item['atpnWarnQesitm'] != null &&
                item['atpnWarnQesitm'].contains(key)) {
          result = result != null ? result! + ', ' + key + ' ' : key + ' ';
        }
      }
    });
    if (_selectedPregnancy == 1) {
      // 임산부 일 때, 임산부 임부 임신 3가지 단어 비교
      if ((item['atpnQesitm'] != null && // 주의사항
              (item['atpnQesitm'].contains("임산부") ||
                  item['atpnQesitm'].contains("임부") ||
                  item['atpnQesitm'].contains("임신") ||
                  item['atpnQesitm'].contains("수유부"))) ||
          (item['atpnWarnQesitm'] != null && // 주의사항경고
              (item['atpnWarnQesitm'].contains("임산부") ||
                  item['atpnQesitm'].contains("임부") ||
                  item['atpnQesitm'].contains("임신") ||
                  item['atpnQesitm'].contains("수유부")))) {
        result = result != null ? result! + ', ' + "임산부" + ' ' : "임산부" + ' ';
      }
    }
    return result;
  }

  Future<void> getbarcode(String stdcode) async {
    loadSelectedAllergies();

    if (stdcode != "") {
      var barcode = "8806534022011";

      var url = Uri.parse('http://3.34.125.219/barcode/$barcode');
      var response = await http
          .post(url, headers: {'accept': 'application/json; charset=utf-8'});

      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      // var url = Uri.parse('http://3.34.125.219/barcode/' + stdcode);

      // // 요청 보내기
      // var request = http.MultipartRequest('POST', url);
      // ..files.add(http.MultipartFile.fromBytes(
      //   'file',
      //   fileBytes,
      //   filename: 'image.jpg',
      //   contentType: MediaType.parse('image/jpeg'),
      // ));

      // 응답 받기
      var responseBody = utf8.decode(response.bodyBytes);

      // 응답 확인
      if (response.statusCode == 200) {
        var data = jsonDecode(responseBody);
        var classification = data['name'];
        fetchData(classification);
        print('name: $classification');
      } else {
        print('요청이 실패했습니다.');
      }
    }
  }

  Future<void> fetchData(String searchRecord) async {
    loadSelectedAllergies();
    var url = Uri.parse(
        'http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList'); // API 서버의 URL 주소
    var params = {
      'serviceKey':
          'euf1Zh/Ry00s3mzLoKv49YQE44utBM56c8gUYT9LdUAnChnbXAtVJihhQYbWVXxkPlC2yJJlgn8iQT1aEs+jOg==', // API 키
      'itemName': searchRecord, // 사용자가 선택한 검색 기록을 itemName으로 설정
      'type': 'json' // JSON 타입
    };

    var response = await http.get(url.replace(queryParameters: params));
    final json = jsonDecode(response.body);
    String? result = trueAllergies(allergies, json['body']['items'][0]);
    if (result != null && result.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "경고",
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1.5,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("다음과 같은 알러지 유발 물질이 포함되어 있습니다.\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.1),
                Text('" ' + result.trim() + ' "',
                    style: const TextStyle(color: Colors.red),
                    textScaleFactor: 1.5),
              ],
            ),
            actions: [
              TextButton(
                child: const Text("확인",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 113, 201, 206),
                    )),
                onPressed: () {
                  Navigator.pop(context); // 경고창 닫기
                  AudioUtil.audioplay(); // 화면 전환 소리
                  Navigator.push(
                      // 의약품 상세페이지로 이동
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SearchPage(item: json['body']['items'][0])));
                },
              ),
            ],
          );
        },
      );
    } else {
      AudioUtil.audioplay(); // 화면 전환 소리
      Navigator.push(
          // 의약품 상세페이지로 이동
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SearchPage(item: json['body']['items'][0])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            ' QR/바코드 검색',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textScaleFactor: 1.2,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              AudioUtil.audioplay();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              onPressed: () {
                AudioUtil.audioplay();
                Navigator.popUntil(context, (route) => false);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
              icon: const Icon(Icons.home),
            ),
          ],
        ),
        body: SingleChildScrollView(
            physics: const FixedExtentScrollPhysics(),
            // physics: NeverScrollableScrollPhysics(),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Column(
                        children: [
                          //약 이름
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Text(name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(height: 1.4),
                                textScaleFactor: 1.5),
                          ),
                          // 복용법
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 242, 204),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        width: 1.4, color: Colors.grey)),
                                padding:
                                    const EdgeInsets.all(10.0), // 모든 방향으로 여백
                                width: MediaQuery.of(context).size.width *
                                    0.90, // 화면의 90% 크기
                                child: Column(children: [
                                  const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: Text('복용법',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textScaleFactor: 1.5)),
                                  Text(howeat.trim(),
                                      style: const TextStyle(height: 1.4),
                                      textScaleFactor: 1.2)
                                ])),
                          ),
                          //효능
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 242, 204),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        width: 1.4, color: Colors.grey)),
                                padding:
                                    const EdgeInsets.all(10.0), // 모든 방향으로 여백
                                width: MediaQuery.of(context).size.width *
                                    0.90, // 화면의 90% 크기
                                child: Column(children: [
                                  const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: Text('효능',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textScaleFactor: 1.5)),
                                  Text(effect.trim(),
                                      style: const TextStyle(height: 1.4),
                                      textScaleFactor: 1.2),
                                ])),
                          ),
                          //주의사항
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 242, 204),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        width: 1.4, color: Colors.grey)),
                                padding:
                                    const EdgeInsets.all(10.0), // 모든 방향으로 여백
                                width: MediaQuery.of(context).size.width *
                                    0.90, // 화면의 90% 크기
                                child: Column(children: [
                                  const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: Text('주의사항',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textScaleFactor: 1.5)),
                                  Text(becareful.trim(),
                                      style: const TextStyle(height: 1.4),
                                      textScaleFactor: 1.2)
                                ])),
                          ),
                        ],
                      ),
                    )))),
        bottomNavigationBar: BottomAppBar(
            child: SizedBox(
                height: 56.0,
                child: ElevatedButton(
                    onPressed: () {
                      print('카메라 사용하기 button');
                      AudioUtil.audioplay();
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QRcameraWidget()))
                          .then((value) {
                        String receive = value;
                        print('전달받은 값 : $receive');
                        List<String> data = receive.split('/');
                        if (data[0] == "medieye:") {
                          setState(() {
                            name = data[1];
                            howeat = data[2];
                            effect = data[3];
                            becareful = data[4];
                          });
                        } else if (data[0] == "http:" || data[0] == "https:") {
                          Uri _url = Uri.parse(receive);
                          _launchUrl(_url);
                        } else {
                          getbarcode(receive);
                        }
                      });
                    },
                    child: const Text('카메라 사용하기',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaleFactor: 1.5)))));
  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
