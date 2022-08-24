import 'package:flutter/material.dart';
import 'package:flutter_pkg/flutter_pkg.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int a = 0;
  late int b = 0;
  int res = 0;
  String sym = '';
  final acontrol = TextEditingController();
  final bcontrol = TextEditingController();
  Widget result = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing Packages"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: acontrol,
              onChanged: (val) {
                a = int.parse(acontrol.text);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter a number",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                    minWidth: double.minPositive,
                    onPressed: () {
                      setState(() {
                        sym = '+';
                        res = add(a, b);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      '+',
                      style: TextStyle(color: Colors.white),
                    )),
                MaterialButton(
                    minWidth: double.minPositive,
                    onPressed: () {
                      setState(() {
                        sym = '-';
                        res = sub(a, b);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                    )),
                MaterialButton(
                    minWidth: double.minPositive,
                    onPressed: () {
                      setState(() {
                        sym = 'x';
                        res = multiply(a, b);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      "x",
                      style: TextStyle(color: Colors.white),
                    )),
                MaterialButton(
                    minWidth: double.minPositive,
                    onPressed: () {
                      setState(() {
                        sym = '/';
                        res = divide(a, b);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      "/",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            TextField(
              controller: bcontrol,
              onChanged: (val) {
                b = int.parse(bcontrol.text);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter another number",
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  result = Container(
                    width: double.infinity,
                    height: 60,
                    child: Center(
                      child: Text(
                        (a != 0 && b != 0) ? "$a $sym $b = $res" : '-',
                        style: TextStyle(color: Colors.white, fontSize: 40.5),
                      ),
                    ),
                    color: Colors.blue,
                  );
                });
                acontrol.clear();
                bcontrol.clear();
              },
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            result,
          ],
        ),
      ),
    );
  }
}
