import 'package:flutter/material.dart';
import '../models/Profession.dart';
import 'QuizScreen.dart';

enum LayoutOption { imageLeft, imageRight, textNextToImage }

class ProfessionScreen extends StatefulWidget {
  final List<Profession> professions;

  ProfessionScreen({required this.professions});

  @override
  _ProfessionScreenState createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends State<ProfessionScreen> {
  late Profession selectedProfession;

  @override
  void initState() {
    super.initState();
    selectedProfession = widget.professions[0]; // Default to the first profession
  }

  LayoutOption parseLayoutOption(String? layout) {
    switch (layout) {
      case 'imageLeft':
        return LayoutOption.imageLeft;
      case 'imageRight':
        return LayoutOption.imageRight;
      case 'textNextToImage':
      default:
        return LayoutOption.textNextToImage;
    }
  }

  Widget buildDetailContent(Detail detail) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    LayoutOption layoutOption = parseLayoutOption(detail.layout);

    if (detail.type == 'image') {
      Widget imageWidget = Image.asset(
        detail.content,
        width: screenWidth * 0.4,
        height: screenHeight * 0.3,
        fit: BoxFit.contain,
      );

      switch (layoutOption) {
        case LayoutOption.imageLeft:
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWidget,
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    'Image on left layout',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        case LayoutOption.imageRight:
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Image on right layout',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width: 16.0),
                imageWidget,
              ],
            ),
          );
        case LayoutOption.textNextToImage:
        default:
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWidget,
                SizedBox(height: 16.0),
              ],
            ),
          );
      }
    } else if (detail.type == 'text') {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text(
          detail.content,
          style: TextStyle(fontSize: 18),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Uhlmann Quizapp'),
      ),
      body: Row(
        children: [
          // Permanent Flyout Menu
          Container(
            width: 250,
            color: Colors.grey[200],
            child: ListView(
              children: widget.professions.map((profession) {
                return Container(
                  color: profession == selectedProfession ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                  child: ListTile(
                    title: Text(profession.name),
                    onTap: () {
                      setState(() {
                        selectedProfession = profession;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedProfession.name,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Image.asset(
                          selectedProfession.imageUrl,
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.3,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 16.0),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                selectedProfession.introText,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 16.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QuizScreen(profession: selectedProfession),
                                    ),
                                  );
                                },
                                child: Text('Button um das Quiz zu starten'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ...selectedProfession.details.map((detail) {
                      return buildDetailContent(detail);
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
