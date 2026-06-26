import 'package:flutter/material.dart';
import 'package:sprint_hosto/widget/custom_elevated_button.dart';
import 'package:sprint_hosto/widget/custom_text_button.dart';
import 'package:sprint_hosto/widget/custom_outlined_button.dart';
import 'package:sprint_hosto/utile/colors.dart';
import 'package:sprint_hosto/screens/forget_key_screen/forget_key_screen.dart';
import 'package:sprint_hosto/screens/sign_in_screen/sign_in_screen.dart';

class ChangeKeyScreen extends StatefulWidget {
  const ChangeKeyScreen({super.key});

  @override
  State<ChangeKeyScreen> createState() => _ChangeKeyScreenState();
}

class _ChangeKeyScreenState extends State<ChangeKeyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  @override
  void dispose() {
    _newPasswordController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
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
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Image.asset(
                  'asserts/images/logo.png',
                  width: 100.0,
                  height: 100.0,
                ),
                SizedBox(height: 15.0),
                Text(
                  'Modifier votre mot de passe pour vos prochaine connexion',
                  textAlign: TextAlign.center,
                  style :Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Ancien mot de passe',
                    labelStyle: Theme.of(context).textTheme.labelLarge,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Nouveau Mot de passe',
                    labelStyle: Theme.of(context).textTheme.labelLarge,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: border,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirmer le Password',
                    labelStyle: Theme.of(context).textTheme.labelLarge,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: border,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: Theme.of(context).textTheme.labelLarge,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: border,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
                
                SizedBox(height: 10.0),
                CustomElevatedButton(
                  label: "Modifier",
                  onPressed: () {
                    
                  },
                ),
                SizedBox(height: 10.0),
                CustomOutlinedButton(
                  child: Text('Créer un compte'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}