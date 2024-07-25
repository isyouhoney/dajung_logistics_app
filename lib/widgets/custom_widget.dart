import 'package:bakery_app/utils/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CW {
  static Widget textButton(
      String text,{Key? key,
        Function()? onPressed,
        // required bool disabled,
        Color? color,
        Color? pressedColor,
        Color? textColor,
        Color? borderColor,
        double? width,
        double? height,
        double? fontSize,
        double? radius,
      }) {
    return SizedBox(
      width: width ?? double.maxFinite,
      height: height?? 50,
      child: TextButton(
        onPressed: () {
          HapticFeedback.lightImpact();
          onPressed?.call();
        }
        ,
        style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStatePropertyAll<Color>(pressedColor??CC.mainColorShaded),
          side: MaterialStateProperty.all<BorderSide?>(BorderSide(color: borderColor ?? Colors.transparent)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius??12),
              )
          ),
            backgroundColor: MaterialStatePropertyAll<Color>(color?? CC.mainColor)),
        child: Text(text, style: TextStyle(color: textColor??Colors.white, fontSize: fontSize ?? 16.sp, fontWeight: FontWeight.bold)),
      ),
    );
  }
  static Widget subIconButton(
      String text,{Key? key,
        Function()? onPressed,
        Color? color,
        double? width,
        double? fontSize,
        required IconData icon
      }) {
    return SizedBox(
      width: width ?? double.maxFinite,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.grey)
              )
          ),
            backgroundColor: MaterialStatePropertyAll<Color>(color?? Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 30,),
            Text(text, style: TextStyle(color: Colors.black, fontSize: fontSize ?? 17.sp, fontWeight: FontWeight.bold)),
            Icon(icon, color: Colors.black, size: 30,)
          ],
        ),
      ),
    );
  }

  static customDialog(BuildContext ctx, String title, dynamic content, Function() onPressedYes,bool onPressedNo, {Function()? actionNo}){
        // Platform.isAndroid?
    showDialog(context: ctx, builder: (ctx) =>
        AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          actionsPadding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          title: Center(child: Text(title)),
          content: content.runtimeType == String?Text(content):content,
          actions: [
            if(onPressedNo) textButton('취소',onPressed: (){
              if(actionNo!=null){actionNo?.call();}
              Navigator.of(ctx).pop();}),
            textButton('확인', onPressed: onPressedYes)
          ],
        ));
    // :
    //     showCupertinoDialog(context: ctx, builder: (ctx) => CupertinoAlertDialog(
    //       title: Text(title),
    //       content: content.runtimeType == String?Text(content):content,
    //       actions: [
    //         if(onPressedNo) TextButton(onPressed: ()=>Navigator.of(ctx).pop(), child: const Text('취소')),
    //         CupertinoDialogAction(onPressed: onPressedYes, child: const Text('확인'))
    //       ],
    //     )
    // );
  }
  static dajungDialog(BuildContext ctx, String title, String yesText, Function() onPressedYes, bool onPressedNo){
    showDialog(context: ctx, builder: (ctx) =>
        AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          actionsPadding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          title: Center(child: Text(title, style: Theme.of(ctx).textTheme.titleSmall), ),
          // content: content.runtimeType == String?Text(content):content,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            if(onPressedNo) Padding(
              padding: const EdgeInsets.only(right: 10),
              child: textButton('취소',onPressed: ()=>Navigator.of(ctx).pop(),width: 120, height: 40, textColor : Colors.black, color: Colors.white, borderColor: Colors.grey[300], pressedColor: CC.mainColorShadedLight),
            ),
                textButton(yesText,onPressed: onPressedYes,width: 120, height: 40),
              ],
            )
          ],
        )
    );
  }
}
