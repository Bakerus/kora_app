import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../design/colors.dart';

class ConfirmDialog extends StatelessWidget {
  
  final void Function() confirm;
  final void Function() cancel;
  const ConfirmDialog({Key? key, required this.confirm, required this.cancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 300,
        height: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        //  color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                 Text(
                  "Confirm Dialog ",
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColors.greyBlue,
                      decoration: TextDecoration.none),
                ),
                //  Icon(Icons.close, size: 20, color: Color.fromRGBO(47, 72, 88, 0.8),),
              ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "here you find the details of the",
                style: Get.theme.textTheme.headline2,
              ),
              Text(
                "information to be confirmed",
                style: Get.theme.textTheme.headline2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: 90,
                  height: 40,
                  child: OutlinedButton(
                    onPressed: (){cancel();},
                    style: Get.theme.outlinedButtonTheme.style,
                    child: const Text("Cancel"),
                  )),
              Container(
                  width: 90,
                  height: 40,
                  margin: const EdgeInsets.only(left: 15.0),
                  child: ElevatedButton(
                      onPressed: () {
                        confirm();
                      },
                      child: Text(
                        "Confirm",
                        style: Get.theme.textTheme.button,
                      ))),
            ],
          ),
        ]),
      ),
    ]);
  }
}