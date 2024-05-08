import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator/component/MyButton.dart';
import 'package:my_calculator/constant_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          Text(
                            userInput.toString(),
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            answer.toString(),
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(
                            title: 'AC',
                            color: colorgray,
                            onpressed: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+/_',
                            color: colorgray,
                            onpressed: () {
                              userInput += '+/_';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '%',
                            color: colorgray,
                            onpressed: () {
                              userInput += '%';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '/',
                            color: colorlightblue,
                            onpressed: () {
                              userInput += '/';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '7',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '7';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '8',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '8';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '9',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '9';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'x',
                            color: colorlightblue,
                            onpressed: () {
                              userInput += 'x';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '4',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '5',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '5';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '6',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '6';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '-',
                            color: colorlightblue,
                            onpressed: () {
                              userInput += '-';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '1',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '2',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '2';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '3',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '3';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+',
                            color: colorlightblue,
                            onpressed: () {
                              userInput += '+';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '0',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '.',
                            color: Colors.white,
                            onpressed: () {
                              userInput += '.';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'DEL',
                            color: Colors.white,
                            onpressed: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);

                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '=',
                            color: colorgradient,
                            onpressed: () {
                              equalPres();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void equalPres() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
