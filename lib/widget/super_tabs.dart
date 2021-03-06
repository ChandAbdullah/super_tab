import 'package:flutter/material.dart';
import 'package:super_tabs/widget/custom_button.dart';

class SuperTabs extends StatelessWidget {
  SuperTabs({
    required this.list,
    required this.onClick,
    required this.selectedColor,
    required this.unselectedColor,
    this.selectedIndex = 0,
    this.radius,
  });

  List<String> list;
  int? selectedIndex;
  double? radius = 7.0;
  Color selectedColor;
  Color unselectedColor;
  Function(int) onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < list.length; index++)
          Expanded(
            child: CustomButton(
              text: list[index],
              isSmallText: true,
              onPress: () {
                onClick(index);
              },
              color: selectedColor,
              isOutlined: index != selectedIndex,
              textColor:
                  index == selectedIndex ? unselectedColor : selectedColor,
              borderRadius: index == 0
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
}
