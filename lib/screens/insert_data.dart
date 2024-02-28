import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:questionnari/widgets/snack_bar.dart';


class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final _formKey = GlobalKey<FormState>();
  final sahurMainDishesController = TextEditingController();
  final sahurSideDishesController = TextEditingController();
  final sahurDirnkController = TextEditingController();
  final fattorMainDishesController = TextEditingController();
  final fattorSideDishesController = TextEditingController();
  final fattorDirnkController = TextEditingController();
  final fattorDessertController = TextEditingController();
  final nightShowController = TextEditingController();
  final noteController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final fontFamily = "Brando";


  bool isLoading = false;

  clickToSend() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      Map<String, String> students = {
        'name': nameController.text,
        'phoneNumber': phoneNumberController.text,
        "sahurMainDishes": sahurMainDishesController.text,
        "sahurSideDishes": sahurSideDishesController.text,
        "sahurDrink": sahurDirnkController.text,
        "fattorMainDishes": fattorMainDishesController.text,
        "fattorSideDishes": fattorSideDishesController.text,
        "fattorDrink": fattorDirnkController.text,
        "fattorDessert": fattorDessertController.text,
        "nightShow": nightShowController.text,
        'note': noteController.text,
        "isReaded": "No",
      };

      dbRef.push().set(students);

      sahurMainDishesController.clear();
      sahurSideDishesController.clear();
      sahurDirnkController.clear();
      fattorMainDishesController.clear();
      fattorSideDishesController.clear();
      fattorDirnkController.clear();
      fattorDessertController.clear();
      nightShowController.clear();
      noteController.clear();
      nameController.clear();
      phoneNumberController.clear();
      setState(() {
        isLoading = false;
      });
      if (!mounted) return;

      // Navigator.pop(context);
      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "",
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation1, animation2) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                content:  Text("شكرا", style: TextStyle(fontFamily: fontFamily),),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none),
              ),
            ),
          );
        },
      );

      // showSnackBar(context, "You Just created new account");
    } else {
      showSnackBar(context, "ERROR");
    }
  }

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();

    dbRef = FirebaseDatabase.instance.ref().child('questionnaireform');
  }

  @override
  void dispose() {
    sahurMainDishesController.dispose();
    sahurSideDishesController.dispose();
    sahurDirnkController.dispose();
    fattorMainDishesController.dispose();
    fattorSideDishesController.dispose();
    fattorDirnkController.dispose();
    fattorDessertController.dispose();
    nightShowController.dispose();
    noteController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          // fit: StackFit.expand,
          children: <Widget>[
            SizedBox(
                width: widthScreen,
                height: 100,
                child: Lottie.asset("assets/img/ram.json")),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(140, 86, 35, 1),
                                Color.fromRGBO(190, 143, 60, 1),
                                Color.fromRGBO(140, 86, 35, 1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        width: widthScreen,
                        decoration: BoxDecoration(
                          // boxShadow: [
                          //       BoxShadow(
                          //           color: const Color.fromARGB(255, 255, 183, 0),
                          //           blurRadius: 10,
                          //           spreadRadius: 1,
                          //           blurStyle: BlurStyle.outer,
                          //           offset: Offset.fromDirection(0))
                          //     ],
                          gradient: const RadialGradient(colors: [
                            Color.fromRGBO(142, 39, 64, 1),
                            Color.fromRGBO(69, 15, 36, 1)
                          ], radius: 1),

                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(children: [
                            Image.asset(
                              "assets/img/konya_logo.png",
                              height: 80,
                            ),

                            //-------writen part ---------//
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 151, 112, 49),
                                      Color.fromARGB(255, 250, 200, 119)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.circular(25),
                                // border: Border.all(width: 2, color: Colors.white30)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Container(
                                      //   margin: const EdgeInsets.all(1),
                                      //   decoration: const BoxDecoration(
                                      //       shape: BoxShape.circle,
                                      //       color:
                                      //           Color.fromRGBO(138, 0, 47, 1)),
                                      //   child: Container(
                                      //     margin: const EdgeInsets.all(2),
                                      //     padding: const EdgeInsets.all(5),
                                      //     decoration: const BoxDecoration(
                                      //         shape: BoxShape.circle,
                                      //         color: Color.fromARGB(
                                      //             255, 250, 200, 119)),
                                      //     child: const Text("٥٩",
                                      //         style: TextStyle(
                                      //           color: Color.fromRGBO(
                                      //               138, 0, 47, 1),
                                      //           fontSize: 24,
                                      //           fontWeight: FontWeight.bold,
                                      //         )),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        width: widthScreen >= 450
                                            ? null
                                            : widthScreen * 0.6,
                                        child:  Text(
                                          "زبائننا الكرام رمضان كريم 🌙🌙",
                                          style: TextStyle(
                                            fontFamily:fontFamily ,
                                            color:
                                                Colors.black,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                   Text(
                                    "لتقديم افضل خدمة في الشهر الفضيل نود اخذ مقترحاتكم في الاستبيان ادناه",
                                    style: TextStyle(
                                      fontFamily: fontFamily,
                                      color:const  Color.fromRGBO(138, 0, 47, 1),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),

                             Text(
                              'ما هي الاطباق التي تود تجربتها معنا في رمضان',
                              style: TextStyle(
                                fontFamily: fontFamily,
                                color:const  Color.fromARGB(255, 250, 200, 119),
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            //-------- ALSAHUUR -------//

                            Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      width: 3,
                                      color: const Color.fromARGB(
                                          255, 250, 200, 119))),
                              child: Column(
                                children: [
                                   Text(
                                    'وجبة السحور',
                                    style: TextStyle(
                                      fontFamily: fontFamily,
                                      color: const Color.fromARGB(255, 250, 200, 119),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),

                                  //----------*** 'اقترح الطبق الرئيسي' ***--------------//
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      return value!.isEmpty
                                          ? "Can Not be empty"
                                          : null;
                                    },
                                    // textInputAction: TextInputAction.newline,

                                    maxLines: 5,
                                    minLines: 1,
                                    controller: sahurMainDishesController,
                                    keyboardType: TextInputType.multiline,
                                    obscureText: false,
                                    decoration:  InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: 'اقترح الطبق الرئيسي',
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        // hintText: 'ادخل اسمك',

                                        hintStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 200, 119),
                                        ),
                                        labelStyle: TextStyle(
                                          fontFamily: fontFamily,
                                            color: const Color.fromARGB(
                                                179, 250, 200, 119))),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 250, 200, 119)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // ------------***'المقبلات والاطباق الرئيسية'***------------//
                                  TextFormField(
                                    validator: (value) {
                                      return value!.isEmpty
                                          ? "Can Not be empty"
                                          : null;
                                    },
                                    // textInputAction: TextInputAction.newline,

                                    maxLines: 5,
                                    minLines: 1,
                                    controller: sahurSideDishesController,
                                    keyboardType: TextInputType.multiline,
                                    obscureText: false,
                                    decoration:  InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: 'المقبلات والاطباق الجانبية',
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        // hintText: 'ادخل اسمك',

                                        hintStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 200, 119),
                                        ),
                                        labelStyle: TextStyle(
                                          fontFamily: fontFamily,
                                            color: const Color.fromARGB(
                                                179, 250, 200, 119))),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 250, 200, 119)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // ------------***'المشروبات'***------------//
                                  TextFormField(
                                    validator: (value) {
                                      return value!.isEmpty
                                          ? "Can Not be empty"
                                          : null;
                                    },
                                    // textInputAction: TextInputAction.newline,

                                    maxLines: 5,
                                    minLines: 1,
                                    controller: sahurDirnkController,
                                    keyboardType: TextInputType.multiline,
                                    obscureText: false,
                                    decoration:  InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: 'المشروبات',
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        // hintText: 'ادخل اسمك',

                                        hintStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 200, 119),
                                        ),
                                        labelStyle: TextStyle(
                                          fontFamily: fontFamily,
                                            color: const Color.fromARGB(
                                                179, 250, 200, 119))),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 250, 200, 119)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),

                            //-------- وجبة الافطار -------//

                            Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      width: 3,
                                      color: const Color.fromARGB(
                                          255, 250, 200, 119))),
                              child: Column(
                                children: [
                                   Text(
                                    'وجبة الافطار',
                                    style: TextStyle(
                                      fontFamily: fontFamily,
                                      color: const Color.fromARGB(255, 250, 200, 119),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),

                                  //----------*** 'اقترح الطبق الرئيسي' ***--------------//
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      return value!.isEmpty
                                          ? "Can Not be empty"
                                          : null;
                                    },
                                    // textInputAction: TextInputAction.newline,

                                    maxLines: 5,
                                    minLines: 1,
                                    controller: fattorMainDishesController,
                                    keyboardType: TextInputType.multiline,
                                    obscureText: false,
                                    decoration:  InputDecoration(
                                        border: const  OutlineInputBorder(),
                                        labelText: 'اقترح الطبق الرئيسي',
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        // hintText: 'ادخل اسمك',

                                        hintStyle: const TextStyle(
                                          
                                          color: Color.fromARGB(
                                              255, 250, 200, 119),
                                        ),
                                        labelStyle: TextStyle(
                                          fontFamily: fontFamily,
                                            color: const Color.fromARGB(
                                                179, 250, 200, 119))),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 250, 200, 119)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // ------------***'المقبلات والاطباق الرئيسية'***------------//
                                  TextFormField(
                                    validator: (value) {
                                      return value!.isEmpty
                                          ? "Can Not be empty"
                                          : null;
                                    },
                                    // textInputAction: TextInputAction.newline,

                                    maxLines: 5,
                                    minLines: 1,
                                    controller: fattorSideDishesController,
                                    keyboardType: TextInputType.multiline,
                                    obscureText: false,
                                    decoration:  InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: 'المقبلات والاطباق الجانبية',
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        // hintText: 'ادخل اسمك',

                                        hintStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 200, 119),
                                        ),
                                        labelStyle: TextStyle(
                                          fontFamily: fontFamily,
                                            color: const Color.fromARGB(
                                                179, 250, 200, 119))),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 250, 200, 119)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // ------------***'المشروبات'***------------//
                                  TextFormField(
                                    validator: (value) {
                                      return value!.isEmpty
                                          ? "Can Not be empty"
                                          : null;
                                    },
                                    // textInputAction: TextInputAction.newline,

                                    maxLines: 5,
                                    minLines: 1,
                                    controller: fattorDirnkController,
                                    keyboardType: TextInputType.multiline,
                                    obscureText: false,
                                    decoration:  InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: 'المشروبات',
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        // hintText: 'ادخل اسمك',

                                        hintStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 200, 119),
                                        ),
                                        labelStyle: TextStyle(
                                          fontFamily: fontFamily,
                                            color: const Color.fromARGB(
                                                179, 250, 200, 119))),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 250, 200, 119)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // ------------***'الحلويات'***------------//
                                  TextFormField(
                                    validator: (value) {
                                      return value!.isEmpty
                                          ? "Can Not be empty"
                                          : null;
                                    },
                                    // textInputAction: TextInputAction.newline,

                                    maxLines: 5,
                                    minLines: 1,
                                    controller: fattorDessertController,
                                    keyboardType: TextInputType.multiline,
                                    obscureText: false,
                                    decoration:  InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: 'الحلويات',
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        // hintText: 'ادخل اسمك',

                                        hintStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 200, 119),
                                        ),
                                        labelStyle: TextStyle(
                                          fontFamily: fontFamily,
                                            color: const Color.fromARGB(
                                                179, 250, 200, 119))),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 250, 200, 119)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),

                            //-------***** الامسيات. *****----//

                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Can Not be empty"
                                    : null;
                              },
                              // textInputAction: TextInputAction.newline,

                              maxLines: 5,
                              minLines: 1,
                              controller: nightShowController,
                              keyboardType: TextInputType.multiline,
                              obscureText: false,
                              decoration:  InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'ماذا تود مشاهدته في الامسيات',
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  // hintText: 'ادخل اسمك',

                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 250, 200, 119),
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: fontFamily,
                                      color:
                                          const Color.fromARGB(179, 250, 200, 119))),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 250, 200, 119)),
                            ),

                            //-------***** ملاحضات. *****----//

                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Can Not be empty"
                                    : null;
                              },
                              // textInputAction: TextInputAction.newline,

                              maxLines: 5,
                              minLines: 1,
                              controller: noteController,
                              keyboardType: TextInputType.multiline,
                              obscureText: false,
                              decoration:  InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText:
                                     "أخبرنا إذا كان لديك شيء ترغب في إضافته",
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  // hintText: 'ادخل اسمك',

                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 250, 200, 119),
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: fontFamily,
                                      color:
                                          const Color.fromARGB(179, 250, 200, 119))),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 250, 200, 119)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Can Not be empty"
                                    : null;
                              },
                              // textInputAction: TextInputAction.newline,

                              maxLines: 5,
                              minLines: 1,
                              controller: nameController,
                              keyboardType: TextInputType.multiline,
                              obscureText: false,
                              decoration:  InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText:
                                      'الاسم',
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  // hintText: 'ادخل اسمك',

                                  hintStyle: const  TextStyle(
                                    color: Color.fromARGB(255, 250, 200, 119),
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: fontFamily,
                                      color:
                                          const Color.fromARGB(179, 250, 200, 119))),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 250, 200, 119)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Can Not be empty"
                                    : null;
                              },
                              // textInputAction: TextInputAction.newline,

                              maxLines: 5,
                              minLines: 1,
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              obscureText: false,
                              decoration:  InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText:
                                      'رقم الهاتف',
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  // hintText: 'ادخل اسمك',

                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 250, 200, 119),
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: fontFamily,
                                      color:
                                        const   Color.fromARGB(179, 250, 200, 119))),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 250, 200, 119)),
                            ),

                            const SizedBox(
                              height: 30,
                            ),

                            InkWell(
                              onTap: () {
                                clickToSend();
                                // Map<String, String> students = {
                                //   'name': userNameController.text,
                                //   'dishesName': tabakNameController.text,
                                //   'note': notController.text
                                // };

                                // dbRef.push().set(students);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 250, 200, 119),
                                    borderRadius: BorderRadius.circular(24)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                child:  Text(
                                  "أرسل",
                                  style: TextStyle(
                                    fontFamily: fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color:const  Color.fromRGBO(138, 0, 47, 1)),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFullScreen(
      {required Widget child, required double height, required double width}) {
    // final size = _controller.value.size;
    // final width = size.width;
    // final height = size.height;

    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        height: height,
        child: child,
      ),
    );
  }
}
