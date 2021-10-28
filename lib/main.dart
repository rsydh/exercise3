import 'package:flutter/material.dart';
//import 'package:v'

void main() {
  runApp(MaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30),
                    child: Text(
                      'Welcome to BeSquare',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  child: Image.network(
                    "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.6435-9/167989111_122052736569342_2932569327583921419_n.png?_nc_cat=107&ccb=1-5&_nc_sid=973b4a&_nc_ohc=NSuR_bm2vZAAX-1kYGy&_nc_ht=scontent.fkul8-1.fna&oh=46bdd3dd9e3d12e4e7e5063c5a78ed25&oe=619D1175",
                  height: 150,
                  width: 120,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    // validator: (String? valid) {
                    //   if (valid == null || valid.isEmpty) {
                    //     return 'Please enter your email';
                    //   }else if (valid.isEmpty ||
                    //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    //           .hasMatch(valid)) {
                    //     return 'Please enter a valid email!';
                    //   }
                    //   return null;
                    // },
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: 400,
                  child: DropDownList(),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: RaisedButton(
                       textColor: Colors.white,
                       color: Colors.black,
                      child: Text('Sign Up'),
                      onPressed: () {
                        final snackBar = SnackBar(
                            content: const Text("Congratulations! You have signed up successfully"),
                       );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        print(name.text);
                        print(email.text);
                        print(password.text);
                      },
                    )),
              ],
            )));
  }
}

class DropDownList extends StatefulWidget {

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  var chosenGender;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: chosenGender,
      icon: Icon(Icons.keyboard_arrow_down_rounded),
      hint: Text('Select your gender'),
      items: <String>[
        'Male',
        'Female',
        'Rather not to say'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          chosenGender = value;
        });
        print(value);
      },
    );
  }
}