// Section 15. APP - Build a Flutter Tip Calculator App

import 'package:flutter/material.dart';
import 'package:flutterapp0803/flutter_playground_04_tip_calculator/util/hexcolor.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  Color _purple = HexColor("#6908D6");

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  bool _isInvalidBillAmount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // main container
      body: Container(
        alignment: Alignment.center,
        // Trick: Use MediaQuery for dynamic heights
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        color: Colors.white,
        // Trick: Use ListView for form (with text field)
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(15.5),
          children: <Widget>[
            //region Total Per Person
            Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total Per Person",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: _purple,
                      ),
                    ),
                    // Escape character: Use "\$" for dollar sign.
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        // Note: .toStringAsFixed(N) converts num to
                        // string of numbers with N decimal places.
                        "\$${calculateTotalPerPerson().toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: _purple),
                      ),
                    ),
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
                  //region Bill Amount
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    // Note: Use InputDecoration for text field
                    cursorColor: _purple,
                    decoration: InputDecoration(
                      prefixText: "\$",
                      errorText: _isInvalidBillAmount
                          ? "The bill amount is reset to \$0.00."
                          : null,
                      labelText: "Bill Amount",
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _purple)),
//                      focusColor: _purple
                    ),
                    onChanged: (String value) {
                      // Note: to catch invalid input.
                      try {
                        _billAmount = double.parse(value);

                        if (_isInvalidBillAmount == true) {
                          _isInvalidBillAmount = false;
                        }
                      } catch (exception) {
                        _billAmount = 0.0;

                        if (_isInvalidBillAmount == false) {
                          _isInvalidBillAmount = true;
                        }
                        debugPrint("Hello Cannot");
                      }
                    },
                  ),
                  //endregion

                  //region Split person
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter -= 1;
                                } else {
                                  // Do nothing...
                                }
                              });
                            },
                            child: buildSplitButtonContainer("-"),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                                color: _purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter += 1;
                              });
                            },
                            child: buildSplitButtonContainer("+"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //endregion

                  //region Tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          "\$${calculateTipAmount().toStringAsFixed(2)}",
                          style: TextStyle(
                            color: _purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  //region Tip Percentage Slider
                  Column(
                    children: <Widget>[
                      Text(
                        "${_tipPercentage.toStringAsFixed(1)}%",
                        style: TextStyle(
                          color: _purple,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Note: slider value must be double!
                      Slider(
                        min: 0, // default: 0
                        max: 100, // default: 1
                        activeColor: _purple,
                        inactiveColor: Colors.grey,
                        divisions: 10, // optional
                        value: _tipPercentage.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            _tipPercentage = value.round();
                          });
                        },
                      ),
                    ],
                  ),
                  //endregion
                ],
              ),
            )
            //endregion
          ],
        ),
      ),
    );
  }

  /// Builds simple button enclosed within a container.
  Container buildSplitButtonContainer(String btnTitle) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: _purple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Center(
        child: Text(
          btnTitle,
          style: TextStyle(
            color: _purple,
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }

  /// Calculates tip amount from [\_billAmount] and [\_tipPercentage].
  double calculateTipAmount() {
    double _totalTip = this._billAmount * (this._tipPercentage / 100);
    return _totalTip;
  }

  /// Adds tip amount to [\_billAmount], then divide the sum by [\_personCounter].
  double calculateTotalPerPerson() {
    double _billAmountPlusTipPercentage =
        this._billAmount + this.calculateTipAmount();
    double _totalPerPerson =
        (_billAmountPlusTipPercentage / this._personCounter);
    return _totalPerPerson;
  }
}
