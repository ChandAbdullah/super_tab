import 'package:flutter/material.dart';
import 'package:super_tabs/model/model.dart';

class SuperTabs extends StatelessWidget {
  SuperTabs({
    required this.list,
    required this.selectedColor,
    required this.unselectedColor,
    this.selectedIndex,
    this.radius,
  });

  List<SuperButton> list;
  int? selectedIndex = 1;
  double? radius = 7.0;
  Color selectedColor;
  Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < list.length; index++)
          Expanded(
            child: customButton(
              context,
              list[index].text,
              list[index].onPress,
              unselectedColor,
              index == selectedIndex ? unselectedColor : selectedColor,
              index == 0
                  ? BorderRadius.only(
                      topLeft: Radius.circular(radius ?? 7.0),
                      bottomLeft: Radius.circular(radius ?? 7.0),
                      topRight: Radius.zero,
                      bottomRight: Radius.zero,
                    )
                  : index == list.length - 1
                      ? BorderRadius.only(
                          topLeft: Radius.zero,
                          bottomLeft: Radius.zero,
                          topRight: Radius.circular(radius ?? 7.0),
                          bottomRight: Radius.circular(radius ?? 7.0),
                        )
                      : BorderRadius.zero,
            ),
          ),
      ],
    );
  }

  Widget customButton(
    BuildContext context,
    String text,
    Function() onPress,
    Color color,
    Color textColor,
    BorderRadiusGeometry borderRadius,
  ) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
              side: BorderSide(
                color: color,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          overlayColor: MaterialStateProperty.all(
            textColor.withOpacity(.1),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
