import 'package:calci/providers/input_provider.dart';
import 'package:calci/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final input = ref.watch(inputProvider);
    return CupertinoPageScaffold(
      child: Container(
        color: CupertinoColors.black,
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              color: CupertinoColors.darkBackgroundGray,
              height: size.height * 0.35,
              child: Text(
                input,
                style: const TextStyle(
                  color: CupertinoColors.lightBackgroundGray,
                  fontSize: 45,
                  fontFamily: 'SFPro',
                  letterSpacing: 2,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.65,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(text: 'C'),
                      Buttons(text: '±'),
                      Buttons(text: '%'),
                      Buttons(text: '÷', isOperator: true),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(text: '7', isExtra: false),
                      Buttons(text: '8', isExtra: false),
                      Buttons(text: '9', isExtra: false),
                      Buttons(text: 'x', isOperator: true),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(text: '4', isExtra: false),
                      Buttons(text: '5', isExtra: false),
                      Buttons(text: '6', isExtra: false),
                      Buttons(text: '−', isOperator: true),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(text: '1', isExtra: false),
                      Buttons(text: '2', isExtra: false),
                      Buttons(text: '3', isExtra: false),
                      Buttons(text: '+', isOperator: true),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(text: '...', isExtra: false),
                      Buttons(text: '0', isExtra: false),
                      Buttons(text: '.', isExtra: false),
                      Buttons(text: '=', isOperator: true),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
