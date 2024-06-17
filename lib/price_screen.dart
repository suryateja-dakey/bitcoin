// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, sort_child_properties_last, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'BitModel.dart';
import 'package:http/http.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  var i;
  List i1 = [];
  var k;
  String c1 = '';
  String c2 = '';
  String c3 = '';
  bool flag = false;

  var c = Color.fromARGB(164, 46, 54, 85);
  var imag = "images/swipe.gif";
  // String ms="usd";
  String selectedCurrency = "USD";

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
      setState(() {
        i = (selectedCurrency);
      });
    }

    return dropdownItems;
  }

  void models() async {
    print(cryptoList.toString());
    // print(ms);
    //print(i);
    //print('https://rest.coinapi.io/v1/exchangerate/$ms/$i?apikey=2D74D5E3-DC82-4B3D-90DC-E846B5DD4F05');
    for (int j = 0; j < cryptoList.length; j++) {
      print(j);
      print('-----------');
      String xyz = cryptoList[j];
      var url = Uri.parse(
          "https://rest.coinapi.io/v1/exchangerate/$xyz/$i?apikey=CFC4C90F-8ECE-4661-AED2-307DC824C8F0");
      //  print(url.toString());
      //  2D74D5E3-DC82-4B3D-90DC-E846B5DD4F05
      Response response = await get(url);
      var sc = response.body;
      print('Response' + j.toString());
      print(sc.toString());
      BitModel bm = BitModel.fromJson(jsonDecode(sc));
      k = bm.rate;
      //print(k);

      i1.add(k);
    }

    print(i1.toList().toString());
    setState(() {
      flag = true;
      val();
    });
  }

  void val() {
    if (flag == true) {
      c1 = i1[0].toStringAsFixed(2);
      c2 = i1[1].toStringAsFixed(2);
      c3 = i1[2].toStringAsFixed(2);
    }
  }

  Widget build(BuildContext context) {
    getDropdownItems();
    // models();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 69, 23),
        title: Text('                       💰 Coin Ticker'),
      ),
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
//card 1
          Card(
            color: c,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 BTC = $c1 $i',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
//card 1+1
          Card(
            color: c,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 ETH = $c2 $i',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
//card 3
          Card(
            color: c,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 LTC = $c3 $i',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(imag),
          ),
// SizedBox(
//   height: 263,
// ),
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color.fromARGB(255, 99, 69, 23),
            child: DropdownButton(
                value: selectedCurrency,
                items: getDropdownItems(),
                onChanged: (value) {
                  setState(() {
                    imag = 'images/money.gif';

                    selectedCurrency = value;
                    models();
                    //   models("ETH");
                    // models("LTC");
                  });
                }), // DropdownButton
          ),
        ],
      ),
    );
  }
}
