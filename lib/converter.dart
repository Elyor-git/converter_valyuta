import 'dart:convert';

import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import 'model/api.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String? countryNameAmount = "USD";
  String? countryNameConverted = "USD";
  String? flagNameAmount = "us";
  String? flagNameConverted = "us";

  String convertedValue = "";
  String askedValue = "";
  String countryRate = "";
  String secondCountry = "";

  String countryForOne = "1 USD = ";
  String valueForOne = "USD";
  double res = 1;



  List<Valyuta> values = [];

  @override
  void initState() {
    super.initState();
    dataBase();
  }

  Future<void> dataBase() async {
    Uri uri = Uri.parse("https://cbu.uz/uz/arkhiv-kursov-valyut/json/");
    Response response = await get(uri);
    values = List<Map<String, Object?>>.from(jsonDecode(response.body))
        .map(Valyuta.fromJson)
        .toList();
    setState(() {});

  }

  String logicConverter() {
    double value = double.tryParse(askedValue) ?? 0.0;
    double rate = double.tryParse(countryRate) ?? 1.0;
    double secondCountryRate = double.tryParse(secondCountry) ?? 1.0;
    double uzSum = rate * value;
    double result = uzSum / secondCountryRate;
    res = (rate * 1) / secondCountryRate;
    return result.toStringAsFixed(2);
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white70.withOpacity(0.90),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 45),
              child: SizedBox(
                width: double.infinity,
                height: 29,
                child: Text(
                  "Currency Converter",
                  style: TextStyle(
                    color: Color(0xFF1F2261),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 30, right: 30, top: 13, bottom: 35),
              child: SizedBox(
                width: double.infinity,
                height: 38,
                child: Text(
                  "Check live rates, set rate alerts, receive notifications and more.",
                  style: TextStyle(
                    color: Color(0xFF808080),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
             DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: 280,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(left: 23, bottom: 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5, left: 15, bottom: 1),
                              child: Text(
                                "Amount",
                                style: TextStyle(
                                  color: Color(0xFF989898),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 4,
                                ),
                                CircleFlag(
                                  flagNameAmount!,
                                  size: 38,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                DropdownButton(
                                  items: [
                                    for (int i = 0; i < values.length; i++)
                                      DropdownMenuItem(
                                        onTap: () {
                                          countryForOne = "1 ${values[i].Ccy} = ";
                                          countryNameAmount = values[i].Ccy;
                                          flagNameAmount =
                                              values[i].Ccy!.substring(0, 2);
                                          countryRate = values[i].Rate!;
                                          setState(() {});
                                        },
                                        value: "${values[i].Ccy}",
                                        child: Text("${values[i].Ccy}"),
                                      ),
                                  ],
                                  onChanged: (value) {},
                                  icon: const Icon(
                                    CupertinoIcons.chevron_down,
                                    size: 14,
                                  ),
                                  hint: Text("$countryNameAmount"),
                                  menuMaxHeight: 150,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  height: 55,
                                  width: 140,
                                  child: TextField(
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      filled: true,
                                      focusColor: Colors.black26.withOpacity(0.5),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      askedValue = value;
                                      convertedValue = logicConverter();
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1.5,
                            width: 108,
                            color: const Color(0xFFE7E7EE),
                          ),
                          const CircleAvatar(
                            radius: 23,
                            backgroundColor: Color(0xFF26278D),
                            child: Icon(
                              CupertinoIcons.arrow_up_arrow_down,
                              size: 22,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 1.5,
                            width: 108,
                            color: const Color(0xFFE7E7EE),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                        width: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5, left: 15, bottom: 1),
                              child: Text(
                                "Converted Amount",
                                style: TextStyle(
                                  color: Color(0xFF989898),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 4,
                                ),
                                CircleFlag(
                                  flagNameConverted!,
                                  size: 38,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                DropdownButton(
                                  items: [
                                    for (int i = 0; i < values.length; i++)
                                      DropdownMenuItem(
                                          onTap: () {
                                            valueForOne = values[i].Ccy!;
                                            countryNameConverted = values[i].Ccy;
                                            secondCountry = values[i].Rate!;
                                            flagNameConverted =
                                                values[i].Ccy!.substring(0, 2);
                                            setState(() {});
                                          },
                                          value: "${values[i].Ccy}",
                                          child: Text("${values[i].Ccy}")),
                                  ],
                                  onChanged: (value) {},
                                  icon: const Icon(
                                    CupertinoIcons.chevron_down,
                                    size: 14,
                                  ),
                                  hint: Text("$countryNameConverted"),
                                  menuMaxHeight: 150,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  height: 55,
                                  width: 140,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEFEFEF),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Align(
                                      alignment: const Alignment(0.8, 0),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 10, right: 10),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            convertedValue,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 70,
                width: 300,
                child: RichText(
                  textAlign: TextAlign.left,
                  text:  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Indicative Exchange Rate\n\n",
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: "$countryForOne${res.toStringAsFixed(2)} $valueForOne",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
