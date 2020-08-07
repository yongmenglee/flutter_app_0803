// Section 15. APP - Build a Flutter Tip Calculator App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_04_tip_calculator/util/hexcolor.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // main container
      body: Container(
        alignment: Alignment.center,
        // Trick: Use MediaQuery for dynamic heights?
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        color: Colors.white,
        // Trick: Use ListView for form (with text field)
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            //region Total Per Person
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Per Person"),
                    // Escape character: Use "\$" for dollar sign.
                    Text("\$123"),
                  ],
                ),
              ),
            ),
            //endregion
            //region Calculator
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
//                color: Colors.transparent
                border: Border.all(
                    color: Colors.blueGrey.shade100, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    // Note: Use InputDecoration for text field
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      // Note: to catch invalid input.
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                        final snackBar = SnackBar(
                          content: Text("Bill amount is reset to \$0.00.",
                              textAlign: TextAlign.center),
                          backgroundColor: Colors.black12.withOpacity(0.7),
                          duration: Duration(milliseconds: 1500),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                ],
              ),
            )
            //endregion
          ],
        ),
      ),
    );
  }
}
