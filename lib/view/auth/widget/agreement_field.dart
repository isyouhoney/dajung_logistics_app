import 'package:bakery_app/models/agreement.dart';
import 'package:bakery_app/models/term.dart';
import 'package:bakery_app/models/user.dart';
import 'package:bakery_app/utils/enums.dart';
import 'package:bakery_app/utils/themeData.dart';
import 'package:bakery_app/viewmodels/auth_service.dart';
import 'package:bakery_app/widgets/custom_widget.dart';
import 'package:bakery_app/widgets/terms/term_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AgreementField extends StatefulWidget {
  const AgreementField({super.key, required this.role, required this.signIn, required this.agreements});
  final Role role;
  final Function signIn;
  final ValueChanged<List<Agreement>> agreements;

  @override
  State<AgreementField> createState() => _AgreementFieldState();
}

class _AgreementFieldState extends State<AgreementField> {
  late List<RxBool> isChecked;
  RxBool isAllChecked = false.obs;
  // late List termList;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40.h,
        child:
        Column(
          children: [
            FutureBuilder(
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print('error : ${snapshot.error}');
                  return const Center(child: Text("오류가 발생했습니다."));
                }
                // snapshot.data.forEach((data)=>termList.add({'id': data.id}));
                isChecked = List.generate(snapshot.data!.length, (index) => false.obs);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TermCheckBox(isCheck: isAllChecked, onTap: (){
                        for (var v in isChecked) {
                          v.value = isAllChecked.value;
                        }
                      },),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: List.generate(snapshot.data!.length, (index) {
                          return TermCheckBox(
                            isCheck: isChecked[index],
                            term: snapshot.data![index],
                            onTap: (){
                              if (isChecked.every((element) => element.value == true)) isAllChecked.value = true;
                              if (isChecked.any((element) => element.value == false)) isAllChecked.value = false;
                            },
                          );
                        }),),
                    ),
                    Obx(()=>Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CW.textButton('회원가입', color: isAllChecked.value?CC.mainColor:Colors.grey,
                          onPressed: (){
                            if(isAllChecked.value){
                              List<Agreement> agreements=[];
                              snapshot.data.forEach((term)=> agreements.add(Agreement(termId: term.id, isAgree: true)));
                              widget.agreements(agreements);
                              widget.signIn.call();
                            }}),
                    ))
                  ],
                );
              }, future: AuthService.to.fetchTerm(widget.role),
            ),

          ],
        ));
  }
}
