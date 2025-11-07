import 'package:flutter/material.dart';

enum Language { vietnamese, english }

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() =>
      _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  // Biến state cục bộ để quản lý lựa chọn
  Language _selectedLanguage = Language.vietnamese;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FBF6),
      appBar: AppBar(
        title: const Text('Ngôn ngữ'),
        backgroundColor: const Color(0xFF1ABC9C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    RadioListTile<Language>(
                      title: const Text('Tiếng Việt'),
                      value: Language.vietnamese,
                      groupValue: _selectedLanguage,
                      onChanged: (Language? value) {
                        setState(() {
                          _selectedLanguage = value!;
                        });
                      },
                      activeColor: const Color(0xFF1ABC9C),
                    ),
                    RadioListTile<Language>(
                      title: const Text('English'),
                      value: Language.english,
                      groupValue: _selectedLanguage,
                      onChanged: (Language? value) {
                        setState(() {
                          _selectedLanguage = value!;
                        });
                      },
                      activeColor: const Color(0xFF1ABC9C),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '(Ngôn ngữ và chưa có bản dịch..)',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
