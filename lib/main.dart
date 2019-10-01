import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _gender = ['Male', 'Female'];
  var _currentgender = 'Male';
  var _bmreqn = ['Mifflin - St Jeor(default)', 'Harris-Benedict'];
  var _currentbmreqn = 'Mifflin - St Jeor(default)';
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _age = TextEditingController();
  double height = 0.0, weight = 0.0, result = 0.0, resultcpd;
  int age = 0;
  String activity;
  Color factivity1,
      factivity2,
      factivity3,
      factivity4,
      factivity5,
      factivity6,
      output;
  Color fdefault, foutput;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('BMR Calculator'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Gender:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    items: _gender.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      _dropDownItemSelected(newValueSelected);
                    },
                    value: _currentgender,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'BMR Equation:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    items: _bmreqn.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      _dropDownItemSelectedeqn(newValueSelected);
                    },
                    value: _currentbmreqn,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Age:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Age",
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _age,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Height:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "height(cm)",
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _height,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Weight:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Weight(kg)",
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _weight,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please select your activity level',
                        style: TextStyle(
                            fontSize: 25, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      child: RaisedButton(
                        child: Text('I am sedentery(little or no exercies)'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: factivity1,
                        onPressed: () {
                          setState(() {
                            activity = 'I am sedentery(little or no exercies)';
                            factivity1 = Colors.deepOrangeAccent;
                            factivity2 = fdefault;
                            factivity3 = fdefault;
                            factivity4 = fdefault;
                            factivity5 = fdefault;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      child: RaisedButton(
                        child: Text(
                            'I am lightly active (light exercise or sports 1-3 days per week)'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: factivity2,
                        onPressed: () {
                          setState(() {
                            activity =
                                'I am lightly active (light exercise or sports 1-3 days per week)';
                            factivity2 = Colors.deepOrangeAccent;
                            factivity1 = fdefault;
                            factivity3 = fdefault;
                            factivity4 = fdefault;
                            factivity5 = fdefault;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      child: RaisedButton(
                        child: Text(
                            'I am moderately active (moderate exercise or sports 3-5 days per week)'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: factivity3,
                        onPressed: () {
                          setState(() {
                            activity =
                                'I am moderately active (moderate exercise or sports 3-5 days per week)';
                            factivity3 = Colors.deepOrangeAccent;
                            factivity1 = fdefault;
                            factivity2 = fdefault;
                            factivity4 = fdefault;
                            factivity5 = fdefault;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      child: RaisedButton(
                        child: Text(
                            'I am very active (hard exercise or sports 6-7 days per week)'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: factivity4,
                        onPressed: () {
                          setState(() {
                            activity =
                                'I am very active (hard exercise or sports 6-7 days per week)';
                            factivity4 = Colors.deepOrangeAccent;
                            factivity1 = fdefault;
                            factivity2 = fdefault;
                            factivity3 = fdefault;
                            factivity5 = fdefault;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Container(
                      child: RaisedButton(
                        child: Text(
                            'I am super active (very hard exercise and a physical job)'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: factivity5,
                        onPressed: () {
                          setState(() {
                            activity =
                                'I am super active (very hard exercise and a physical job)';
                            factivity5 = Colors.deepOrangeAccent;
                            factivity1 = fdefault;
                            factivity2 = fdefault;
                            factivity3 = fdefault;
                            factivity4 = fdefault;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: RaisedButton(
                      child: Text(
                        "Calculate BMR",
                      ),
                      onPressed: _onPress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Your BMR is: $result",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Your Maintainance Calories Per Day is: $resultcpd",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onPress() {
    age = int.parse(_age.text);
    height = double.parse(_height.text);
    weight = double.parse(_weight.text);
    if (_currentbmreqn == 'Mifflin - St Jeor(default)') {
      if (_currentgender == 'Male') {
        setState(() {
          result = (10.0 * weight) + (6.25 * height) - (5.0 * age) + 5.0;
          if (activity == 'I am sedentery(little or no exercies)') {
            setState(() {
              resultcpd = result * 1.2;
            });
          }
          if (activity ==
              'I am lightly active (light exercise or sports 1-3 days per week)') {
            setState(() {
              resultcpd = result * 1.375;
            });
          }
          if (activity ==
              'I am moderately active (moderate exercise or sports 3-5 days per week)') {
            setState(() {
              resultcpd = result * 1.55;
            });
          }
          if (activity ==
              'I am very active (hard exercise or sports 6-7 days per week)') {
            setState(() {
              resultcpd = result * 1.725;
            });
          }
          if (activity ==
              'I am super active (very hard exercise and a physical job)') {
            setState(() {
              resultcpd = result * 1.9;
            });
          }
        });
      } else {
        setState(() {
          result = (10.0 * weight) + (6.25 * height) - (5.0 * age) - 161.0;
          if (activity == 'I am sedentery(little or no exercies)') {
            setState(() {
              resultcpd = result * 1.2;
            });
          }
          if (activity ==
              'I am lightly active (light exercise or sports 1-3 days per week)') {
            setState(() {
              resultcpd = result * 1.375;
            });
          }
          if (activity ==
              'I am moderately active (moderate exercise or sports 3-5 days per week)') {
            setState(() {
              resultcpd = result * 1.55;
            });
          }
          if (activity ==
              'I am very active (hard exercise or sports 6-7 days per week)') {
            setState(() {
              resultcpd = result * 1.725;
            });
          }
          if (activity ==
              'I am super active (very hard exercise and a physical job)') {
            setState(() {
              resultcpd = result * 1.9;
            });
          }
        });
      }
    } else {
      if (_currentgender == 'Male') {
        setState(() {
          result = 66.5 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
          if (activity == 'I am sedentery(little or no exercies)') {
            setState(() {
              resultcpd = result * 1.2;
            });
          }
          if (activity ==
              'I am lightly active (light exercise or sports 1-3 days per week)') {
            setState(() {
              resultcpd = result * 1.375;
            });
          }
          if (activity ==
              'I am moderately active (moderate exercise or sports 3-5 days per week)') {
            setState(() {
              resultcpd = result * 1.55;
            });
          }
          if (activity ==
              'I am very active (hard exercise or sports 6-7 days per week)') {
            setState(() {
              resultcpd = result * 1.725;
            });
          }
          if (activity ==
              'I am super active (very hard exercise and a physical job)') {
            setState(() {
              resultcpd = result * 1.9;
            });
          }
        });
      } else {
        setState(() {
          result = 655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age);
          if (activity == 'I am sedentery(little or no exercies)') {
            setState(() {
              resultcpd = result * 1.2;
            });
          }
          if (activity ==
              'I am lightly active (light exercise or sports 1-3 days per week)') {
            setState(() {
              resultcpd = result * 1.375;
            });
          }
          if (activity ==
              'I am moderately active (moderate exercise or sports 3-5 days per week)') {
            setState(() {
              resultcpd = result * 1.55;
            });
          }
          if (activity ==
              'I am very active (hard exercise or sports 6-7 days per week)') {
            setState(() {
              resultcpd = result * 1.725;
            });
          }
          if (activity ==
              'I am super active (very hard exercise and a physical job)') {
            setState(() {
              resultcpd = result * 1.9;
            });
          }
        });
      }
    }
  }

  void _dropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentgender = newValueSelected;
    });
  }

  void _dropDownItemSelectedeqn(String newValueSelected) {
    setState(() {
      this._currentbmreqn = newValueSelected;
    });
  }
}
