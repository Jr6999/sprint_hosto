import 'package:flutter/material.dart';
import 'package:sprint_hosto/widget/custom_elevated_button.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.3),
                    blurRadius: 10.0,                   
                    spreadRadius: 2.0,                  
                    offset: const Offset(0, 4),          
                  ),
                ],
              ),
              padding: EdgeInsets.only(top:60.0, right: 20.0, left: 20.0, bottom: 50.0),
              child: Column(
                children: [
                  Image.asset(
                    'asserts/images/logo.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Pour changer votre mot de passe, veuillez entrer votre adresse e-mail ci-dessous. Nous vous enverrons un code de réinitialisation.',
                    textAlign: TextAlign.center,
                    style :Theme.of(context).textTheme.bodyLarge,
                  ),
                  
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: Theme.of(context).textTheme.labelLarge,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  CustomElevatedButton(
                    label: "Confirmer le Mail",
                    onPressed: () {
                      if (_emailController.text.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Un code de réinitialisation a été envoyé à ${_emailController.text}'),
                          ),
                        );
                        Navigator.pushNamed(context, '/confirm-mail');
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez entrer une adresse e-mail valide'),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}