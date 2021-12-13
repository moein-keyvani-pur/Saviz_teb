import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  Rx<bool> isVisible = false.obs;
  Rx<bool> isRememberMe = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              tileMode: TileMode.decal,
              stops: [0.2, 0.7],
              colors: [
                Color(0xff14AC78),
                Color(0xff084F36),
              ],
              begin: Alignment.center,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            children: [
              Flexible(
                flex: 8,
                fit: FlexFit.loose,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(100, 50))),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        scale: 1,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      MyDivider(
                                        isRight: true,
                                        width: 20,
                                      ),
                                      MyDivider(
                                        isRight: true,
                                        width: 5,
                                      ),
                                      MyDivider(
                                        isRight: true,
                                        width: 12,
                                      ),
                                    ]),
                              ),
                              Text(
                                'برای ادامه دادن لطفا وارد حساب کاربری خود شوید',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      MyDivider(
                                        isRight: false,
                                        width: 20,
                                      ),
                                      MyDivider(
                                        isRight: false,
                                        width: 5,
                                      ),
                                      MyDivider(
                                        isRight: false,
                                        width: 12,
                                      ),
                                    ]),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'ورود',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: Get.width * 0.8,
                          child: CustomeTextField(
                            lableText: 'پست الکترونیکی',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: Get.width * 0.8,
                          child: Obx(() => CustomeTextField(
                              isObsecure: isVisible.value,
                              lableText: 'رمز عبور',
                              textInputAction: TextInputAction.send,
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    isVisible.value = !isVisible.value;
                                  },
                                  icon: isVisible.value
                                      ? Icon(Icons.visibility_off_outlined)
                                      : Icon(Icons.visibility_rounded))))),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: Get.width * 0.8,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('بازیابی رمز عبود',
                                style: TextStyle(color: Colors.black)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('مرا به خاطر بسپار',
                                    style: TextStyle(color: Colors.black)),
                                // Obx(() => Transform.scale(
                                //       scale: 0.7,
                                //       child: Radio<bool>(
                                //         splashRadius: 12,
                                //         value: true,
                                //         groupValue: isRememberMe.value,
                                //         onChanged: (value) {
                                //           print(value);
                                //           isRememberMe.value = value ?? false;
                                //         },
                                //         activeColor: Color(0xff1DB983),
                                //       ),
                                //     )),
                                Obx(() => GestureDetector(
                                      onTap: () => isRememberMe.value =
                                          !isRememberMe.value,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: isRememberMe.value
                                                ? Color(0xff19B184)
                                                : Colors.transparent,
                                            border: Border.all(
                                              color: Color(0xff19B184),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        width: 10,
                                        height: 10,
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ButtonLogin(),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          text: TextSpan(
                              text: 'اکانت ندارید؟ ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    // recognizer: Gesturerecogna,
                                    text: 'ثبت نانم',
                                    style: TextStyle(color: Colors.green))
                              ]))
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginWithSocialWidget(
                          title: 'ورود با اکانت گوگل',
                          image: 'assets/icons/google.svg',
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LoginWithSocialWidget(
                          title: 'ورود با اکانت توئیتر',
                          image: 'assets/icons/twitter.svg',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key, required this.width, this.isRight = true})
      : super(key: key);
  final double width;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 2,
          bottom: 2,
          right: isRight ? width : 0.0,
          left: isRight ? 0.0 : width),
      // width: width,
      height: 2,
      color: Color(0x40707070),
    );
  }
}

class LoginWithSocialWidget extends StatelessWidget {
  const LoginWithSocialWidget(
      {Key? key, required this.image, this.onTap, required this.title})
      : super(key: key);
  final String title;
  final String image;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        highlightColor: Colors.green.withOpacity(0.4),
        splashColor: Colors.green,
        onTap: () {
          if (onTap != null) onTap!();
        },
        child: Container(
          width: Get.width * 0.8,
          // decoration: BoxDecoration(
          //   color: Colors.white,
          // ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                image,
                width: 40,
                height: 40,
              ),
              // SvgPicture.asset(image),
              Expanded(
                child: Align(child: Text(title)),
              ),
              Container(
                padding: EdgeInsets.all(5),
                // width: 30,
                // height: 30,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff19B184),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Icon(Icons.arrow_back, color: Color(0xff19B184)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      decoration: ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
              colors: [Color(0xff1DB983), Color(0xff28BA67)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: StadiumBorder(),
        child: Text(
          'ورود',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          print('Hello!');
        },
      ),
    );
    // return Container(
    //   width: Get.width * 0.8,
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20),
    //       gradient: LinearGradient(
    //           colors: [Color(0xff1DB983), Color(0xff28BA67)],
    //           begin: Alignment.bottomLeft,
    //           end: Alignment.topRight)),
    //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    //   child: GestureDetector(
    //     onTap: () {},
    //     child: Center(
    //       child: Text(
    //         'ورود',
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {Key? key,
      this.textEditingController,
      this.hintText,
      this.lableText,
      this.textInputAction,
      this.isObsecure = false,
      this.prefixIcon,
      this.keyboardType})
      : super(key: key);
  final TextEditingController? textEditingController;
  final String? hintText;
  final String? lableText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isObsecure;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right,
      controller: textEditingController,
      keyboardType: keyboardType,
      textDirection: TextDirection.rtl,
      textInputAction: textInputAction,
      obscureText: isObsecure,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        // alignLabelWithHint: false,

        labelText: lableText,
        labelStyle: TextStyle(color: Color(0xff676767)),
        hintTextDirection: TextDirection.rtl,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff636363), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff636a6a), width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
