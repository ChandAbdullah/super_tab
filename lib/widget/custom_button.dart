import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    required this.onPress,
    required this.color,
    this.isOutlined = false,
    this.icon,
    // required this.borderColor,
    required this.textColor,
    this.borderRadius,
    this.isSmallText = false,
  }) : super(key: key);

  String text;
  VoidCallback onPress;
  Color color;
  // Color borderColor;
  Color textColor;
  BorderRadiusGeometry? borderRadius;
  bool? isOutlined;
  IconData? icon;
  bool? isSmallText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  BorderRadius.circular(
                    4,
                  ),
              // side: BorderSide.none,
              side: BorderSide(
                color: color,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            isOutlined != true ? color : Colors.transparent,
          ),
          overlayColor: MaterialStateProperty.all(
            textColor.withOpacity(.1),
          ),
        ),
        onPressed: onPress,
        child: icon == null
            ? Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: isSmallText == true ? 14 : 19,
                ),
              )
            : Icon(
                icon,
                color: color,
              ),
      ),
    );
  }
}
