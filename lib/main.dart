import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(TranslatorApp());
}

class TranslatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Translator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TranslationScreen(),
    );
  }
}

class TranslationScreen extends StatefulWidget {
  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  String _sourceLang = 'en- English';
  String _targetLang = 'es- Spanish';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _languages = [
    'en- English',
    'es- Spanish',
    'fr- French',
    'hi- Hindi',
    'ur- Urdu',
    'ar- Arabic',
    'zh- Chinese',
    'ja- Japanese',
    'ko- Korean',
    'ru- Russian',
  ];

  Future<void> _translateText() async {
    if (_formKey.currentState!.validate()) {
      try {
        final translator = GoogleTranslator();
        final translation = await translator.translate(
          _inputController.text,
          from: _sourceLang.split('-')[0].trim(),
          to: _targetLang.split('-')[0].trim(),
        );
        setState(() {
          _outputController.text = translation.toString();
        });
      } catch (e) {
        setState(() {
          _outputController.text = 'Error: $e';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'assets/images/pic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Multi Language",
                      style: TextStyle(fontSize: 35, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: _inputController,
                decoration: InputDecoration(
                  labelText: 'Enter text to translate',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 80,
                    horizontal: 12,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter text to translate';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),

                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _sourceLang,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _sourceLang = newValue!;
                          });
                        },
                        items:
                            _languages.map<DropdownMenuItem<String>>((
                              String value,
                            ) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.compare_arrows, // modern arrow
                        size: 32,
                        color: Colors.blueAccent,
                      ),
                    ),

                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _targetLang,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _targetLang = newValue!;
                          });
                        },
                        items:
                            _languages.map<DropdownMenuItem<String>>((
                              String value,
                            ) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _translateText,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Translate',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              TextFormField(
                controller: _outputController,
                decoration: InputDecoration(
                  labelText: 'Translated Text',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 80,
                    horizontal: 12,
                  ),
                ),
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
