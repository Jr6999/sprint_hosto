import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmMailScreen extends StatefulWidget {
  const ConfirmMailScreen({super.key});

  @override
  State<ConfirmMailScreen> createState() => _ConfirmMailScreenState();
}

class _ConfirmMailScreenState extends State<ConfirmMailScreen> {
  final List<String> _otpCode = ["", "", "", "","",""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Vérification par Email',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Text(
                'Entrez le code à 4 chiffres envoyé à votre adresse mail.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildOtpField(context, index: 0, first: true, last: false),
                    _buildOtpField(context, index: 1, first: false, last: false),
                    _buildOtpField(context, index: 2, first: false, last: false),
                    _buildOtpField(context, index: 3, first: false, last: false),
                    _buildOtpField(context, index: 4, first: false, last: false),
                    _buildOtpField(context, index: 5, first: false, last: true),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  String finalCode = _otpCode.join();
                  if (finalCode.length == 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Code saisi : $finalCode')),
                    );
                    Navigator.pushNamed(context, '/change-key');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Veuillez remplir tous les champs')),
                    );
                  }
                },
                child: const Text('Vérifier le code'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, {
    required int index, 
    required bool first, 
    required bool last,
  }) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextFormField(
        autofocus: first, 
        onChanged: (value) {
          _otpCode[index] = value;
          
          if (value.length == 1 && !last) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
