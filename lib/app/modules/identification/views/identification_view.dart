import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kora/app/core/design/images.dart';
import 'package:kora/app/modules/account_connexion/views/account_connexion_view.dart';

import '../../../core/design/colors.dart';
import '../controllers/identification_controller.dart';

class IdentificationView extends GetView<IdentificationController> {
  const IdentificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Identifier vous'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.greenMaterial[900],
            ),
            onPressed: null,
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
             height: MediaQuery.of(context).size.height*0.65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Image.asset(AppImages.validate),
                ],),
        
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const SizedBox(height:56 , child: TextField(decoration:InputDecoration(prefixIcon:Icon(Icons.account_circle,size: 24,), labelText:"user name",   )  )),
                        const SizedBox(height:56 , child: TextField(decoration:InputDecoration(prefixIcon:Icon(Icons.mail_outlined,size: 24,), labelText:"e-mail",   )  )),
                        const SizedBox(height:56 , child: TextField(decoration:InputDecoration(prefixIcon:Icon(Icons.mail_outlined,size: 24,), labelText:"password",   )  )),
                        SizedBox(height:56 , child: TextField( obscureText: true, decoration:InputDecoration(prefixIcon: const Icon(Icons.lock_outlined,size: 24,), suffixIcon:IconButton(onPressed: (){}, icon: const Icon(Icons.remove_red_eye,color: AppColors.grey)), labelText:"confirm password",   )  )),
                      ],),
                  ),
                ]),
            ),
        
            SizedBox(width: double.infinity, child:ElevatedButton(onPressed: (){Get.to(AccountConnexionView()); } ,child: Text("Continue", style: Get.theme.textTheme.button,)))
        ],),
      ),
    );
  }
}
