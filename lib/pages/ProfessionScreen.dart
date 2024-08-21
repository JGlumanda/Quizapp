import 'package:flutter/material.dart';
import 'package:quizapp/services/DataService.dart';

import '../models/Detail.dart';
import '../models/Info.dart';
import '../models/Profession.dart';
import 'QuizScreen.dart';

enum LayoutOption { imageLeft, imageRight, textNextToImage, nothing }

class ProfessionScreen extends StatefulWidget {
  final List<Profession> professions = DataService().professions;
  final List<Info> infos = DataService().infos;

  ProfessionScreen();

  @override
  _ProfessionScreenState createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends State<ProfessionScreen> {
  late dynamic selectedItem;
  bool isProfessionSelected = true;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.professions[0];
  }

  LayoutOption parseLayoutOption(String? layout) {
    switch (layout) {
      case 'imageLeft':
        return LayoutOption.imageLeft;
      case 'imageRight':
        return LayoutOption.imageRight;
      case 'textNextToImage':
        return LayoutOption.textNextToImage;
      default:
        return LayoutOption.nothing;
    }
  }

  List<Widget> buildDetailContents(List<Detail> details) {
    List<Widget> contentWidgets = [];
    for (int i = 0; i < details.length; i++) {
      if (details[i].type == 'image') {
        LayoutOption layoutOption = parseLayoutOption(details[i].layout);
        Widget imageWidget = Image.asset(
          details[i].content,
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.3,
          fit: BoxFit.contain,
        );

        if (i + 1 < details.length &&
            details[i + 1].type == 'text' &&
            parseLayoutOption(details[i + 1].layout) ==
                LayoutOption.textNextToImage) {
          String text = details[i + 1].content;
          Widget textWidget = Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );

          if (layoutOption == LayoutOption.imageLeft) {
            contentWidgets.add(Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                imageWidget,
                textWidget,
              ],
            ));
          } else if (layoutOption == LayoutOption.imageRight) {
            contentWidgets.add(Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                textWidget,
                imageWidget,
              ],
            ));
          }
          i++;
        } else {
          if (layoutOption == LayoutOption.imageLeft) {
            contentWidgets.add(Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                imageWidget,
              ],
            ));
          } else if (layoutOption == LayoutOption.imageRight) {
            contentWidgets.add(Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                imageWidget,
              ],
            ));
          } else {
            contentWidgets.add(Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imageWidget,
              ],
            ));
          }
        }
      } else if (details[i].type == 'text') {
        Widget textWidget = Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              details[i].content,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        );
        contentWidgets.add(IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textWidget,
            ],
          ),
        ));
      } else if (details[i].type == 'heading') {
        contentWidgets.add(Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            details[i].content,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ));
      }
      contentWidgets.add(const SizedBox(height: 64.0));
    }
    return contentWidgets;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Uhlmann Quizapp'),
      ),
      body: Row(
        children: [
          // Permanent Flyout Menu
          buildPermanentFlyout(),
          // Main content
          buildMainProfessionContent(screenWidth, screenHeight, context),
        ],
      ),
    );
  }

  Expanded buildMainProfessionContent(
      double screenWidth, double screenHeight, BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedItem.name,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Image.asset(
                    selectedItem.imageUrl,
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.3,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedItem.introText,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 16.0),
                        if (isProfessionSelected)
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QuizScreen(profession: selectedItem),
                                ),
                              );
                            },
                            child: const Text('Quiz starten!'),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 64),
              ...buildDetailContents(selectedItem.details),
            ],
          ),
        ),
      ),
    );
  }

  Container buildPermanentFlyout() {
    return Container(
      width: 250,
      color: Colors.grey[200],
      child: ListView(children: [
        //Profession Section
        ...widget.professions.map((profession) {
          return Container(
            color: profession == selectedItem
                ? Colors.blue.withOpacity(0.2)
                : Colors.transparent,
            child: ListTile(
              title: Text(profession.name),
              onTap: () {
                setState(() {
                  selectedItem = profession;
                  isProfessionSelected = true;
                });
              },
            ),
          );
        }).toList(),
        const Divider(),
        ...widget.infos.map((info) {
          return Container(
            color: info == selectedItem && !isProfessionSelected
                ? Colors.blue.withOpacity(0.2)
                : Colors.transparent,
            child: ListTile(
              title: Text(info.name),
              onTap: () {
                setState(() {
                  selectedItem = info;
                  isProfessionSelected = false;
                });
              },
            ),
          );
        }).toList(),
      ]),
    );
  }
}
