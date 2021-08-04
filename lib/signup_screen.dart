import 'package:flutter/material.dart';
import 'package:language_change_app/classes/language.dart';
import 'package:language_change_app/language_constants.dart';
import 'package:language_change_app/main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, 'home_page')!,
        ),
        actions: [
          DropdownButton<Language>(
            iconSize: 30.0,
            // value: _selectedLanguage,
            hint: Text(
              getTranslated(context, 'change_language')!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            onChanged: (Language? language) {
              _changeLanguage(language!);
            },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          e.flag,
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(e.name)
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: getTranslated(context, 'name'),
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: getTranslated(context, 'email'),
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: getTranslated(context, 'pwd'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        getTranslated(context, 'success_msg')!,
                      ),
                    ),
                  );
                },
                child: Text(
                  getTranslated(context, 'submit')!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
