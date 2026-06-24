import 'package:flutter/material.dart';
import 'package:sprint_hosto/widget/custom_elevated_button.dart';
import 'package:sprint_hosto/widget/custom_text_button.dart';
import 'package:sprint_hosto/utile/colors.dart';

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
                  color: surface.withValues(alpha: 0.3),
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
                SizedBox(height: 20.0),
                Text(
                  'Welcome to the App',
                  style :Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0),
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                CustomTextButton(
                  child: Text('Forgot Password?'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  }),
                SizedBox(height: 20.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}