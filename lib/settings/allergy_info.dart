import 'package:flutter/material.dart';

import 'package:app/main.dart';
import './util/multi_select_flutter.dart';

void main() => runApp(const AllergyInfo(title: '',));

class Allergy {
  final int id;
  final String name;

  Allergy({
    required this.id,
    required this.name,
  });
}

class AllergyInfo extends StatefulWidget {
  const AllergyInfo({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<AllergyInfo> createState() => _AllergyInfoState();
}

class _AllergyInfoState extends State<AllergyInfo> {
  static final List<Allergy> _allergies = [
    Allergy(id: 1, name: "해산물"),
    Allergy(id: 2, name: "견과류"),
    Allergy(id: 3, name: "곡류"),
    Allergy(id: 4, name: "천식"),
    Allergy(id: 5, name: "아토피"),
    Allergy(id: 6, name: "비염"),
    Allergy(id: 7, name: "혈압"),
    Allergy(id: 8, name: "신부전증"),
    Allergy(id: 9, name: "과민증"),
    Allergy(id: 10, name: "당뇨"),
    Allergy(id: 11, name: "암"),
    Allergy(id: 12, name: "편두통"),
    Allergy(id: 13, name: "간질환"),
    Allergy(id: 14, name: "신장질환"),
    Allergy(id: 15, name: "소화기질환"),
    Allergy(id: 16, name: "호흡질환"),
    Allergy(id: 17, name: "정신질환"),
    Allergy(id: 18, name: "근육질환"),
    Allergy(id: 19, name: "심혈관질환"),
    Allergy(id: 20, name: "뇌혈관질환"),
  ];
  final _items = _allergies
      .map((allergy) => MultiSelectItem<Allergy>(allergy, allergy.name))
      .toList();

  List<Allergy> _selectedAllergies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '질병 및 알러지 정보',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => false);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
              icon: const Icon(Icons.home),
            ),
          ],
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  '알러지 추가',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left
                              )
                          )
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            MultiSelectDialogField(
                              listType: MultiSelectListType.CHIP,
                              searchable: true,
                              buttonText: const Text("질병 및 알러지 정보"),
                              title: const Text("검색"),
                              items: _items,
                              onConfirm: (values) async {
                                setState(() {
                                  _selectedAllergies = values.cast<Allergy>();
                                });

                              },
                              chipDisplay: MultiSelectChipDisplay(
                                items: _items,
                                onTap: (value) async {
                                  setState(() {
                                    _selectedAllergies.remove(value);
                                  });
                                },
                              ),
                            ),
                            _selectedAllergies.isEmpty
                                ? Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "선택된 질병 및 알러지 정보가 없습니다.",
                                  style: TextStyle(color: Colors.black54),
                                ))
                                : Container(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                )
            )
        )
    );
  }
}