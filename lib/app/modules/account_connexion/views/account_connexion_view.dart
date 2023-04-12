import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kora/app/core/design/fonts.dart';
import 'package:kora/app/modules/home/views/home_view.dart';
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
            onPressed: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Connect to your account",
                          style: TextStyle(
                              color: AppColors.clearBlueMaterial[900],
                              fontFamily: AppFonts.montserrat,
                              fontWeight: FontWeight.w700,
                              fontSize: 35)),
                      Text("choose your profile",
                          style: Get.theme.textTheme.subtitle2),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(height:56 , child: TextField(decoration:InputDecoration(prefixIcon:Icon(Icons.account_circle,size: 24,), labelText:"user name",   )  )),
                          SizedBox(
                            height: 66,
                            child: InkWell(
                              child: Card(
                                elevation: 8.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.account_circle,
                                        size: 24,
                                        color: AppColors.greenMaterial,
                                      ),
                                      Text("Serre name 1",
                                          style: Get.theme.textTheme.subtitle1)
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.to(const HomeView());
                              },
                            ),
                          ),
                          SizedBox(
                            height: 66,
                            child: InkWell(
                              child: Card(
                                elevation: 8.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.account_circle,
                                        size: 24,
                                        color: AppColors.greenMaterial,
                                      ),
                                      Text("Serre name 2",
                                          style: Get.theme.textTheme.subtitle1)
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.to(const HomeView());
                              },
                            ),
                          ),
                          // SizedBox(height: 56, child: TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.account_circle,size: 24,),labelText: "user name",))),
                        ]),
                  ),
                  // SizedBox(
                  //     height: 56,
                  //     child: TextField(
                  //         decoration: InputDecoration(
                  //       prefixIcon: IconButton(
                  //         onPressed: () {
                  //           Get.to(ScaningView());},
                  //         icon: const Icon(
                  //           Icons.add_outlined,
                  //           color: Color.fromRGBO(103, 103, 103, 1),
                  //           size: 24,),),labelText: "add new profile",))
                  //           ),

                  SizedBox(
                    height: 66,
                    child: Card(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (() {
                                Get.to(const ScaningView());
                              }),
                              icon: const Icon(
                                Icons.add_outlined,
                                size: 24,
                                color: Color.fromRGBO(103, 103, 103, 1),
                              )),
                          const Text("add new profile"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.circle),
                    Icon(Icons.circle),
                    Icon(Icons.circle),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
