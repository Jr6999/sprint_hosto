import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;           // Le texte à afficher sur le bouton
  final VoidCallback onPressed; // La fonction à exécuter lors du clic
  final Color? backgroundColor; // Couleur de fond optionnelle

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor, // Si null, il prendra la couleur principale du thème
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // Utilise la couleur passée en paramètre OU la couleur primaire du thème global
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary, // Couleur du texte
        minimumSize: const Size(double.infinity, 50), // Prend toute la largeur, hauteur de 50px
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Coins arrondis à 12px
        ),
        elevation: 2, // Légère ombre sous le bouton
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
