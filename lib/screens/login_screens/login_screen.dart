import 'package:flutter/material.dart';
import 'package:sprint_hosto/widget/custom_elevated_button.dart';
import 'package:sprint_hosto/widget/custom_text_button.dart';
import 'package:sprint_hosto/widget/custom_outlined_button.dart';
import 'package:sprint_hosto/utile/colors.dart';
import 'package:sprint_hosto/screens/sign_in_screen/sign_in_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          key: _formKey,
          padding: const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                  blurRadius: 10.0,                   
                  spreadRadius: 2.0,                  
                  offset: const Offset(0, 4),          
                ),
              ],
            ),
            padding: EdgeInsets.all(50.0),
            child: Column(
              children: [
                Image.asset(
                  'asserts/images/logo.png',
                  width: 100.0,
                  height: 100.0,
                ),
                SizedBox(height: 15.0),
                Text(
                  'Bienvenue sur votre application de santé',
                  textAlign: TextAlign.center,
                  style :Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Connectez-vous pour continuer',
                  textAlign: TextAlign.center,
                  style :Theme.of(context).textTheme.bodySmall,
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
                SizedBox(height: 5.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextButton(
                    child: Text('Mot de passe oublié?'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    }),
                ),
                SizedBox(height: 10.0),
                CustomElevatedButton(
                  label: "Se connecter",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Text('Login successful', style: TextStyle(color: success),);
                    }else{
                      Text('Login failed', style: TextStyle(color: error),);
                    }
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