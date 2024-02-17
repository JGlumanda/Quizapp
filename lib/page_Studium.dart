import 'package:flutter/material.dart';

class StudiumSelector extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  StudiumSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // Aligns the widgets along the main axis (vertical)
        crossAxisAlignment: CrossAxisAlignment.center,
        // Aligns the widgets along the cross axis (horizontal)
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Image(
                    image: AssetImage('images/uhlmann_logo.png'),
                  ),
                ),
                Flexible(
                  child: Image(
                    image: AssetImage('images/uhlmann_logo.png'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(256.0,0,256,0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(
                    items.length,
                    (index) {
                      return SizedBox(
                        height: (MediaQuery.of(context).size.height / items.length),
                        width: (MediaQuery.of(context).size.height / items.length),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                items[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
