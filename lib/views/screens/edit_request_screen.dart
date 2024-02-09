// fichier: lib/views/edit_screen.dart

import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Items'),
        automaticallyImplyLeading: false, // Désactiver le bouton de retour
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Confirm'),
        ),
      ),
    );
  }
}
