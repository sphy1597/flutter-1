import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final dynamic item;

  const SearchPage({Key? key, required this.item}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '의약품 정보',
          style: new TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            // 약 이름
            Text(
              widget.item['itemName'],
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),

            // 제조사
            if (widget.item['entpName'] != null)
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 185, 224, 255),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(10.0), // 모든 방향으로 여백
                  width: MediaQuery.of(context).size.width * 0.90, // 화면의 90% 크기
                  child: Text(
                    '제조사 : ' + widget.item['entpName'],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            // 효능
            if (widget.item['efcyQesitm'] != null)
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 244, 182),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0), // 모든 방향으로 여백
                      width: MediaQuery.of(context).size.width *
                          0.90, // 화면의 90% 크기
                      child: Text(
                        '효능 : ' +
                            widget.item['efcyQesitm']
                                .replaceAll(RegExp(r'<[^>]*>'), ""),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // 사용법
            if (widget.item['useMethodQesitm'] != null)
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 239, 173, 255),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0), // 모든 방향으로 여백
                      width: MediaQuery.of(context).size.width *
                          0.90, // 화면의 90% 크기
                      child: Text(
                        '사용법 : ' +
                            widget.item['useMethodQesitm']
                                .replaceAll(RegExp(r'<[^>]*>'), ""),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // 주의사항경고
            if (widget.item['atpnWarnQesitm'] != null)
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 172, 255, 169),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0), // 모든 방향으로 여백
                      width: MediaQuery.of(context).size.width *
                          0.90, // 화면의 90% 크기
                      child: Text(
                        '주의사항경고 : ' +
                            widget.item['atpnWarnQesitm']
                                .replaceAll(RegExp(r'<[^>]*>'), ""),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // 주의사항
            if (widget.item['atpnQesitm'] != null)
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 196, 196),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0), // 모든 방향으로 여백
                      width: MediaQuery.of(context).size.width *
                          0.90, // 화면의 90% 크기
                      child: Text(
                        '주의사항 : ' +
                            widget.item['atpnQesitm']
                                .replaceAll(RegExp(r'<[^>]*>'), ""),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // 상호작용
            if (widget.item['intrcQesitm'] != null)
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 164, 187, 255),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0), // 모든 방향으로 여백
                      width: MediaQuery.of(context).size.width *
                          0.90, // 화면의 90% 크기
                      child: Text(
                        '상호작용 : ' +
                            widget.item['intrcQesitm']
                                .replaceAll(RegExp(r'<[^>]*>'), ""),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // 부작용
            if (widget.item['seQesitm'] != null)
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 143, 255, 253),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0), // 모든 방향으로 여백
                      width: MediaQuery.of(context).size.width *
                          0.90, // 화면의 90% 크기
                      child: Text(
                        '부작용 : ' +
                            widget.item['seQesitm']
                                .replaceAll(RegExp(r'<[^>]*>'), ""),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // 보관방법
            if (widget.item['depositMethodQesitm'] != null)
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 218, 164),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(10.0), // 모든 방향으로 여백
                      width: MediaQuery.of(context).size.width *
                          0.90, // 화면의 90% 크기
                      child: Text(
                        '보관방법 : ' +
                            widget.item['depositMethodQesitm']
                                .replaceAll(RegExp(r'<[^>]*>'), ""),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
