import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:dotted_border/dotted_border.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int tip = 0;
  int person = 1;
  double amount = 0;
  double bill_per_person = 0;
  double tip_per_person = 0;
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/bg.png"),
              fit: BoxFit.cover,
            )
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:55),
                      child: Text("Split Smart,",style: TextStyle(
                        fontSize: 36,
                        color: Color(0xFF5E5DD2),
                        fontFamily: 'Gilroy',
                        height: 1.4,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(

                      padding: const EdgeInsets.only(right:55,bottom: 25),
                      child: Text("Pay Easy",style: TextStyle(
                        fontSize: 36,
                        color: Color(0xFF5E5DD2),
                        fontFamily: 'Gilroy',
                        height: 1.4,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/img/OBJECTS.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only( topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, -3),
                          blurRadius: 10,
                          color: Color(0x7B7B7B40),
                        ),
                      ],
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            height: 4,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Enter Total Amount On Bill:',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF1D1D1D),
                              fontFamily: 'Gilroy',
                              height: 1.3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: amountController,
                            decoration: InputDecoration(
                              hintText: '220.46',
                              hintStyle: TextStyle(color: Color(0x80CDCDCD)),
                              border: InputBorder.none,

                            ),
                            style: TextStyle(
                              fontSize: 54,
                              color: Color(0xFF331D1D),
                              fontFamily: 'Gilroy',
                              height: 1.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20,),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/img/hand.png',
                                      width: 28,
                                      height: 24,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Tip',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF5E5DD3),
                                        fontFamily: 'Gilroy',
                                        height: 1.0,
                                      ),
                                    ),
                                    SizedBox(width: 100),
                                    Image.asset(
                                      'assets/img/person.png',
                                      width: 28,
                                      height: 24,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Person',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF5E5DD3),
                                        fontFamily: 'Gilroy',
                                        height: 1.0,
                                      ),
                                    )

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    QuantityInput(
                                      acceptsZero: true,
                                      maxValue: 100,
                                      value: tip,
                                      onChanged: (value) {
                                        final enteredValue = int.parse(value.replaceAll(',', ''));
                                        final clampedValue = enteredValue.clamp(0, 100);
                                        setState(() => tip = clampedValue);
                                      },
                                      buttonColor: Color(0xFF5E5DD2),
                                      decoration: InputDecoration(
                                        suffixText: '%',
                                      ),
                                    ),
                                    SizedBox(width: 40,),
                                    QuantityInput(
                                      value: person,
                                      onChanged: (value) => setState(() => person = int.parse(value.replaceAll(',', ''))),
                                      buttonColor: Color(0xFF5E5DD2),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                    onPressed: (){
                                      setState(() {
                                        amount = double.tryParse(amountController.text) ?? 0;
                                        bill_per_person = amount/person;
                                        tip_per_person = bill_per_person*tip/100;
                                      });
                                    },
                                    child:
                                        Text("SPLIT BILL",style: TextStyle(fontSize: 20),),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF5E5DD2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      minimumSize: Size(350,50),
                                    ),

                                ),
                                SizedBox(height: 40,),
                                DottedBorder(
                                  color: Color(0xFF5E5DD3),
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(10),
                                  dashPattern: [8,7],
                                  strokeWidth: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: 290,
                                      height: 200,
                                      child: Column(
                                        children: [
                                          Text(
                                            'Each Have To Pay',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Color(0xFF5E5DD3),
                                              fontFamily: 'Gilroy',
                                              height: 1.35,
                                            ),

                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 30,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/img/bill.png',
                                                width: 28,
                                                height: 24,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                'Bill Amount',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFF5E5DD3),
                                                  fontFamily: 'Gilroy',
                                                  height: 1.0,
                                                ),
                                              ),
                                              SizedBox(width: 85-bill_per_person.toStringAsFixed(2).length.toDouble()*5),
                                              Text(
                                                bill_per_person.toStringAsFixed(2),
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFF5E5DD3),
                                                  fontFamily: 'Gilroy',
                                                  height: 1.0,
                                                ),
                                              ),

                                            ],
                                          ),

                                          Row(
                                            children: [
                                              SizedBox(width: 230,),
                                              Text(
                                                "+",
                                                style: TextStyle(
                                                  color: Color(0xFF5E5DD3),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/img/hand.png',
                                                width: 28,
                                                height: 24,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                'Tip',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFF5E5DD3),
                                                  fontFamily: 'Gilroy',
                                                  height: 1.0,
                                                ),
                                              ),
                                              SizedBox(width: 160 - tip_per_person.toStringAsFixed(2).length.toDouble()*5),


                                              Text(
                                                tip_per_person.toStringAsFixed(2),
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFF5E5DD3),
                                                  fontFamily: 'Gilroy',
                                                  height: 1.0,
                                                ),
                                              )

                                            ],
                                          ),
                                          Divider(
                                            height: 30,
                                            color: Color(0xFF5E5DD3),
                                            thickness: 1.2,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(width: 10,),
                                              Text(
                                                'Total Amount',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  color: Color(0xFF5E5DD3),
                                                  fontFamily: 'Gilroy',
                                                  height: 1.0,
                                                ),
                                              ),
                                              SizedBox(width: 60-(bill_per_person+tip_per_person).toStringAsFixed(2).length.toDouble()*5,),
                                              Container(
                                                width: 100+(bill_per_person+tip_per_person).toStringAsFixed(2).length.toDouble()*1.5,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(width: 2, color: Color(0xFF5E5DD3)),
                                                  color: Color(0x338D8CE0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    (bill_per_person+tip_per_person).toStringAsFixed(2),
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color:Color(0xFF5E5DD3),
                                                      fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
          ]
            ),
          ),
        ),
      ),
    );
  }
}
