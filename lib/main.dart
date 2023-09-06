import 'package:flutter/material.dart';

void main() {
  runApp(VowelCounterApp());
}

class VowelCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sesli Harf Sayacı'),
        ),
        body: VowelCounter(),
      ),
    );
  }
}

class VowelCounter extends StatefulWidget {
  @override
  _VowelCounterState createState() => _VowelCounterState();
}

class _VowelCounterState extends State<VowelCounter> {
  TextEditingController _controller = TextEditingController();
  int vowelCount = 0;

  void countVowels() {
    String text = _controller.text.toLowerCase();
    int count = 0;

    for (int i = 0; i < text.length; i++) {
      if (text[i] == 'a' || text[i] == 'e' || text[i] == 'i' || text[i] == 'o' || text[i] == 'u') {
        count++;
      }
    }

    setState(() {
      vowelCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Metin Girin',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: countVowels,
          child: Text('Sesli Harf Sayısını Hesapla'),
        ),
        SizedBox(height: 20),
        Text(
          'Sesli Harf Sayısı: $vowelCount',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
      ],
    );
  }
}
