import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kora/app/modules/answer/views/answer_view.dart';
import 'package:kora/app/modules/scaning/views/scaning_view.dart';

import '../../../core/design/colors.dart';
import '../controllers/account_connexion_controller.dart';

class AccountConnexionView extends GetView<AccountConnexionController> {
  const AccountConnexionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(''),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.greenMaterial[900],
            ),
            onPressed: (){},
          )),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

           SizedBox(
            height: MediaQuery.of(context).size.height*0.50,
             child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Connect to your account", style: Get.theme.textTheme.headline6),
                     Text("choose your profile", style: Get.theme.textTheme.subtitle2),
                   ],),

                  SizedBox(
                   height: MediaQuery.of(context).size.height*0.17,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(height:56 , child: TextField(decoration:InputDecoration(prefixIcon:Icon(Icons.account_circle,size: 24,), labelText:"user name",   )  )),
                      SizedBox(height:56 , child: TextField(decoration:InputDecoration(prefixIcon:Icon(Icons.account_circle,size: 24,), labelText:"user name",   )  )),
                    ]),
                  ),
                   
                  SizedBox(height:56 , child: TextField(decoration:InputDecoration(prefixIcon:IconButton(onPressed:(){Get.to(ScaningView());}, icon: const Icon(Icons.add_outlined,color:Color.fromRGBO(103, 103, 103, 1) ,size: 24,),) , labelText:"add new profile",   )  )),
              ],),
           ),

           Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  Icon(Icons.circle),
                  Icon(Icons.circle),
                  Icon(Icons.circle),
                ],)
          ],),

        ],),
      ),
    );
  }
}
