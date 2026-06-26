import 'package:flutter/material.dart';
import 'package:sprint_hosto/widget/custom_elevated_button.dart';
import 'package:sprint_hosto/widget/custom_text_button.dart';
import 'package:sprint_hosto/widget/custom_outlined_button.dart';
import 'package:sprint_hosto/utile/colors.dart';
import 'package:sprint_hosto/screens/forget_key_screen/forget_key_screen.dart';
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
  String? _selectedRole = 'patient';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Vous êtes :',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 5.0),
                RadioGroup<String>(
                  groupValue: _selectedRole,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Patient'),
                          value: 'patient',
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Docteur'),
                          value: 'doctor',
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
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
                    if (_formKey.currentState!.validate() && (_selectedRole=='doctor')) {
                      Text('Login successful', style: TextStyle(color: success),);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetScreen()));
                    }else{
                      Text('Login failed', style: TextStyle(color: error),);
                    }
                  }
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