import 'package:calci/providers/input_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

class Buttons extends ConsumerStatefulWidget {
  final String text;
  final bool isOperator;
  final bool isExtra;

  const Buttons({
    super.key,
    required this.text,
    this.isOperator = false,
    this.isExtra = true,
  });

  @override
  ConsumerState<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends ConsumerState<Buttons> {
  late String answer;
  bool newCalculation = false;

  void equalPressed() {
    String finaluserinput = ref.read(inputProvider.notifier).state;
    finaluserinput = finaluserinput.replaceAll('x', '*').replaceAll('−', '-');

    Parser p = Parser();
    try {
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        answer = eval.toString();
      });
    } catch (e) {
      setState(() {
        answer = 'Invalid Syntax';
      });
      setState(() {
        newCalculation = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final buttonSize = size.width * 0.2;

    return IconButton(
      onPressed: () {
        if (newCalculation) {
          ref.read(inputProvider.notifier).state = '';
          setState(() {
            newCalculation = false;
          });
        }

        if (widget.text == 'C') {
          ref.read(inputProvider.notifier).state = '';
        } else {
          if (widget.text != "...") {
            if (widget.text == "=") {
              equalPressed();
              ref.read(inputProvider.notifier).state = answer;
              setState(() {
                newCalculation = true;
              });
            } else {
              ref.read(inputProvider.notifier).state += widget.text;
            }
          }
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(widget.isOperator
            ? CupertinoColors.activeOrange
            : widget.isExtra
                ? CupertinoColors.lightBackgroundGray
                : CupertinoColors.darkBackgroundGray),
        fixedSize: MaterialStatePropertyAll(Size(buttonSize, buttonSize)),
      ),
      highlightColor: widget.isExtra && !widget.isOperator
          ? CupertinoColors.darkBackgroundGray.withAlpha(50)
          : CupertinoColors.lightBackgroundGray.withAlpha(10),
      icon: Text(
        widget.text,
        style: TextStyle(
          color: widget.isExtra && !widget.isOperator
              ? CupertinoColors.black
              : CupertinoColors.white,
          fontSize: 40,
          fontFamily: 'SFPro',
        ),
      ),
    );
  }
}
