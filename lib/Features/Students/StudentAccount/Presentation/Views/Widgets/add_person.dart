import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../constant.dart';

class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  String groupvalue = "Yes";
  String? selecteditem = "الأول";
  DateTime date = DateTime.now();
  bool _isTextField1Valid = false;
  bool _isTextField2Valid = false;
  bool _isTextField3Valid = false;
  bool _isTextField4Valid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .9,
        decoration: BoxDecoration(color: KPrimeryColor5),
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.9,
                    decoration: BoxDecoration(
                        color: KPrimeryColor1,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(70))),
                    child: Image.asset(
                      scale: 2.5,
                      'assets/images/watercolor-end-school-illustration_23-2149415372-removebg-preview.png',
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
                decoration: BoxDecoration(
                  color: KPrimeryColor1,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
                decoration: BoxDecoration(
                    color: KPrimeryColor5,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(70))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .55,
                            top: MediaQuery.of(context).size.width * .033,
                          ),
                          child: Text(
                            "ابن ",
                            style: TextStyle(
                              color: KPrimeryColor1,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            child: Radio(
                                hoverColor: KPrimeryColor1,
                                activeColor: KPrimeryColor1,
                                value: "Yes",
                                groupValue: groupvalue,
                                onChanged: (value) {
                                  setState(() {
                                    groupvalue = value!;
                                  });
                                }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .033,
                            top: MediaQuery.of(context).size.width * .033,
                          ),
                          child: Text(
                            "ابنة ",
                            style: TextStyle(
                                color: KPrimeryColor1,
                                fontSize: 20,
                                fontFamily: KFont2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            child: Radio(
                                activeColor: KPrimeryColor1,
                                focusColor: KPrimeryColor1,
                                value: "No",
                                groupValue: groupvalue,
                                onChanged: (value) {
                                  setState(() {
                                    groupvalue = value!;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            " :السنة الدراسية ",
                            style: TextStyle(
                                fontFamily: KFont2,
                                fontSize: 20,
                                color: const Color.fromARGB(255, 73, 73, 73),
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        DropdownButton<String>(
                            dropdownColor: KPrimeryColor2,
                            style: TextStyle(
                                color: KPrimeryColor1,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                            alignment: Alignment.centerRight,
                            value: selecteditem,
                            items: [
                              DropdownMenuItem(
                                  value: "الأول", child: Text("الأول")),
                              DropdownMenuItem(
                                  value: "الثاني", child: Text("الثاني")),
                              DropdownMenuItem(
                                  value: "الثالث", child: Text("الثالث")),
                              DropdownMenuItem(
                                  value: "الرابع", child: Text("الرابع")),
                              DropdownMenuItem(
                                  value: "الخامس", child: Text("الخامس")),
                              DropdownMenuItem(
                                  value: "السادس", child: Text("السادس")),
                            ],
                            onChanged: (item) {
                              setState(() {
                                selecteditem = item;
                              });
                            }),
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            " : تاريخ الميلاد  ",
                            style: TextStyle(
                                fontFamily: KFont2,
                                fontSize: 20,
                                color: const Color.fromARGB(255, 73, 73, 73),
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        TextButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2025),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData().copyWith(
                                        colorScheme: ColorScheme.light(
                                            primary: KPrimeryColor1)),
                                    child: child!,
                                  );
                                },
                              );
                              if (newDate == null) return;
                              setState(() {
                                date = newDate;
                              });
                              if (selecteditem == "الأول" &&
                                  newDate.year >= 2017 &&
                                  newDate.year <= 2018) {
                                setState(() {
                                  date = newDate;
                                });
                              } else if (selecteditem == "الثاني" &&
                                  newDate.year >= 2016 &&
                                  newDate.year <= 2017) {
                                setState(() {
                                  date = newDate;
                                });
                              } else if (selecteditem == "الثالث" &&
                                  newDate.year >= 2015 &&
                                  newDate.year <= 2016) {
                                setState(() {
                                  date = newDate;
                                });
                              } else if (selecteditem == "الرابع" &&
                                  newDate.year >= 2014 &&
                                  newDate.year <= 2015) {
                                setState(() {
                                  date = newDate;
                                });
                              } else if (selecteditem == "الخامس" &&
                                  newDate.year >= 2013 &&
                                  newDate.year <= 2014) {
                                setState(() {
                                  date = newDate;
                                });
                              } else if (selecteditem == "السادس" &&
                                  newDate.year >= 2012 &&
                                  newDate.year <= 2013) {
                                setState(() {
                                  date = newDate;
                                });
                              } else {
                                // Choose an appropriate error display method (e.g., Overlay, Dialog)
                                showErrorDialog(context,
                                    "عمر الطفل غير متناسب مع السنة الدراسية ");
                                // Example using Dialog
                                setState(() {
                                  date = DateTime.now();
                                });
                              }
                            },
                            child: Text(
                              '${date.day}/${date.month}/${date.year}',
                              style: TextStyle(
                                color: KPrimeryColor1,
                              ),
                            ))
                      ],
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _isTextField1Valid = value.isNotEmpty;
                        });
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[\u0600-\u06FF]'), // يسمح فقط بالحروف
                        ),
                      ],
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(right: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "الاسم ",
                        hintStyle: TextStyle(
                          fontSize: 23,
                          fontFamily: KFont2,
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: KPrimeryColor1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _isTextField3Valid = value.isNotEmpty;
                        });
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[\u0600-\u06FF]'), // يسمح فقط بالحروف
                        ),
                      ],
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(right: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "اسم الأب ",
                        hintStyle: TextStyle(
                          fontSize: 23,
                          fontFamily: KFont2,
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: KPrimeryColor1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _isTextField2Valid = value.isNotEmpty;
                        });
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[\u0600-\u06FF]'), // يسمح فقط بالحروف
                        ),
                      ],
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(right: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: "اسم الأم",
                          hintStyle: TextStyle(
                            fontSize: 23,
                            fontFamily: KFont2,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: KPrimeryColor1),
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _isTextField4Valid = value.isNotEmpty;
                        });
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // يسمح فقط بالأرقام
                      ],

                      cursorColor: Colors.black,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          prefixText: '     +963 ',
                          prefixStyle: TextStyle(color: Colors.blue),
                          contentPadding: EdgeInsets.only(right: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: "رقم الهاتف ",
                          hintStyle: TextStyle(
                            fontSize: 23,
                            fontFamily: KFont2,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: KPrimeryColor1),
                            borderRadius: BorderRadius.circular(30),
                          )),

                      //
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: KPrimeryColor3,
                            fixedSize: Size(150, 40),
                            textStyle:
                                TextStyle(color: KPrimeryColor1, fontSize: 20)),
                        onPressed: () {
                          if (_isTextField1Valid &&
                              _isTextField2Valid &&
                              _isTextField3Valid &&
                              _isTextField4Valid) {
                            // ... إضافة البيانات ..
                            print("ok");
                          } else
                            showErrorDialog(context, "يرجى تعبئة كافة الحقول");
                          // if (_isTextField1Valid==false){
                          // showErrorDialog(context, "يرجى تعبئة كافة الحقول");
                          // print("no");
                          // }
                          // else if(_isTextField2Valid==false){
                          // showErrorDialog(context, "يرجى تعبئة كافة الحقول");
                          // print("no");
                          // }
                          // else
                          // print("ok");
                        },
                        child: Text(
                          "إضافة",
                          style: TextStyle(color: KPrimeryColor1),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'خطأ',
        style: TextStyle(
            color: Colors.red,
            fontFamily: KFont2,
            fontSize: 28,
            fontWeight: FontWeight.bold),
      ),
      content: Text(
        errorMessage,
        style: TextStyle(fontFamily: KFont2, fontSize: 23),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('حسناً',
              style: TextStyle(color: KPrimeryColor1, fontSize: 20)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}

//
