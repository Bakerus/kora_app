
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/app/core/widgets/confirmDialog.dart';
import 'package:kora/app/modules/identification/views/identification_view.dart';
import '../../../core/design/colors.dart';


class ConfirmLoginView extends GetView {
  const ConfirmLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Login'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height*0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Enter the code",style: Get.theme.textTheme.headline4,),
                        Text("Enter the six-digit code that was sent to you at",style: Get.theme.textTheme.subtitle2,),
                        Text("bakehew@gmail.com",style: Get.theme.textTheme.headline5,),
                      ],
                    ),

                    const SizedBox(
                      width: 40,
                      height: 45,
                      child: TextField(
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: InputDecoration(counterText: '',filled: true, fillColor: Colors.white),
                      ),
                    ),
                    
                    

                    SizedBox(
                      height: 80.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width:double.infinity , child: ElevatedButton(
                          // ignore: sort_child_properties_last
                          child:Text("Finish", style: Get.theme.textTheme.bodyText2), style:ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(55, 78, 121, 0.08)) ),
                            onPressed: () {
                            Get.dialog(  
                                ConfirmDialog(confirm: () {Get.to(IdentificationView());}, cancel: (){Get.back();},),
                                barrierColor: Color.fromRGBO(47, 72, 88, 0.39),
                            );
                          } ,
                        ),
                      ),
                        Text("Didn’t get the code ?",style: TextStyle(color:AppColors.clearPurple, fontSize: Get.theme.textTheme.subtitle2!.fontSize, fontFamily:Get.theme.textTheme.subtitle2!.fontFamily, fontWeight: Get.theme.textTheme.subtitle2!.fontWeight ),),
                        ]),
                    ),
                  ],
                ),
              ),

          Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                Icon(Icons.circle),
                Icon(Icons.circle),
                Icon(Icons.circle),
              ],)
          ]),

         ]),

        ),
        
        );
  }

  

}
