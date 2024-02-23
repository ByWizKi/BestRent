import 'package:flutter/material.dart';

class ModalService {
  static Future<void> showConfirmationModal(
      BuildContext context, String message) async {
    // Afficher la fenêtre modale
    await showDialog(
      context: context,
      builder: (BuildContext modalContext) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );

    // Attendre avant de fermer la fenêtre modale
    await Future.delayed(const Duration(milliseconds: 500));

    // Fermer la fenêtre modale en utilisant le contexte de la fenêtre modale 
  }
}
