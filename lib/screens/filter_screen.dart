import 'package:biz/utils/colors.dart';
import 'package:biz/utils/utils.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> hobbyList = [
    'Director',
    'Producer',
    'Writer',
    'UPM',
    'Assistant Director',
    'PA',
    'Sound Dept.',
    'Cinematographer',
    'Camera Dept',
    'Grip Electric',
    'Editorial Dept.',
    'Post Dept.',
  ];
  List<String> unionList = [
    'Non-Union',
    'Union',
  ];
  List<String> genreList = [
    'Any',
    'Action',
    'Adventure',
    'Comedy',
    'Crime',
    'Drama',
    'Documentary',
    'Epic',
    'Foreign',
    'Horror',
    'Musical',
    'Sci-Fi',
    'Thriller',
    'War',
    'Other',
  ];

  List<String>? selectedGene = [];
  List<String>? selectedUnion = [];
  List<String>? selectedHobby = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        leading: ExpandTapWidget(
          tapPadding: EdgeInsets.all(10),
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 23,
          ),
        ),
        title: Text(
          "Filter",
          style: TextStyle(color: Colors.white, fontSize: Get.width * 0.04),
        ),
        centerTitle: true,
        actions: [
          ExpandTapWidget(
            tapPadding: EdgeInsets.all(10),
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/images/click.png",
                scale: 3,
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text("Role:",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.90),
                      fontSize: Get.width * 0.05)),
              verticalSpace(height: 10),
              Wrap(
                children: hobbyList.map(
                  (hobby) {
                    bool isSelected = false;
                    if (selectedHobby!.contains(hobby)) {
                      isSelected = true;
                    }
                    return GestureDetector(
                      onTap: () {
                        if (!selectedHobby!.contains(hobby)) {
                          if (selectedHobby!.length < 12) {
                            selectedHobby!.add(hobby);
                            setState(() {});
                            print(selectedHobby);
                          }
                        } else {
                          selectedHobby!
                              .removeWhere((element) => element == hobby);
                          setState(() {});
                          print(selectedHobby);
                        }
                      },
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 18),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.30),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              hobby,
                              style: TextStyle(
                                  color: isSelected ? Colors.white : textColor,
                                  fontSize: 14),
                            ),
                          )),
                    );
                  },
                ).toList(),
              ),
              verticalSpace(height: 10),
              Text("Union:",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.90),
                      fontSize: Get.width * 0.05)),
              verticalSpace(height: 10),
              Wrap(
                children: unionList.map(
                  (union) {
                    bool isSelected = false;
                    if (selectedUnion!.contains(union)) {
                      isSelected = true;
                    }
                    return GestureDetector(
                      onTap: () {
                        if (!selectedUnion!.contains(union)) {
                          if (selectedUnion!.length < 2) {
                            selectedUnion!.add(union);
                            setState(() {});
                            print(selectedUnion);
                          }
                        } else {
                          selectedUnion!
                              .removeWhere((element) => element == union);
                          setState(() {});
                          print(selectedUnion);
                        }
                      },
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 18),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.30),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              union,
                              style: TextStyle(
                                  color: isSelected ? Colors.white : textColor,
                                  fontSize: 14),
                            ),
                          )),
                    );
                  },
                ).toList(),
              ),
              verticalSpace(height: 10),
              Text("Genre:",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.90),
                      fontSize: Get.width * 0.05)),
              verticalSpace(height: 10),
              Wrap(
                children: genreList.map(
                  (gene) {
                    bool isSelected = false;
                    if (selectedGene!.contains(gene)) {
                      isSelected = true;
                    }
                    return GestureDetector(
                      onTap: () {
                        if (!selectedGene!.contains(gene)) {
                          if (selectedGene!.length < 15) {
                            selectedGene!.add(gene);
                            setState(() {});
                            print(selectedGene);
                          }
                        } else {
                          selectedGene!
                              .removeWhere((element) => element == gene);
                          setState(() {});
                          print(selectedGene);
                        }
                      },
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 18),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.30),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              gene,
                              style: TextStyle(
                                  color: isSelected ? Colors.white : textColor,
                                  fontSize: 14),
                            ),
                          )),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
