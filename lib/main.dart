import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kora/app/core/design/theme.dart';
import 'package:kora/app/routes/app_pages.dart';

void main() {

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kora App",
      theme: AppTheme.ligthTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );

  
              // TODO: Faire la page de scanage du code QR(fais)
             // TODO: Faire la validation des e-mails(fais)
            // TODO: Faire apparaitre la snackbar en cas d'erreurs
           // TODO: Mettre l'effet de visualisation du password sur l'icon de l'oeil des textFields
          // TODO: Mettre les redirections sur les icones(fleches) du Appbar 




       // TODO: Gerer la zone de verification du code de 6 caracteres 
      // TODO: Gerer le bug du bouton confirm pour que le texte apparait 
     // TODO: Regler le probleme de responsivité de la page identifier vous
    // TODO: Gerer la page answer pour afficher success ou error en fonction de quel page? 
  // TODO: Faire la petite animation du bas de page 
}