import 'package:flutter/material.dart';
import 'package:way_zema/pages/theme_color.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final IconData icon;
  final bool isPassword;

  const CustomInputField({
    Key? key,
    required this.controller,
    required this.placeholder,
    required this.icon,
    this.isPassword = false, required iconColor,
  }) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: themeColors.cardColor, 
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: themeColors.iconColor),
          labelText: widget.placeholder,
          labelStyle: TextStyle(color: themeColors.textColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: themeColors.iconColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.width = 200,
    this.padding = const EdgeInsets.all(16.0),
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);

    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor ?? themeColors.purpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor ?? themeColors.textColor),
        ),
      ),
    );
  }
}

class TimedImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeColors = ThemeColors.fromContext(context);
    final imageData = getCurrentImageData();

    return Container(
      width: 340,
      height: 196,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imageData.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(29, 30, 20, 0),
        child: Column(
          children: [
            Text(
              imageData.text,
              style: TextStyle(
                color: themeColors.textColor,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              imageData.subtext,
              style: TextStyle(
                color: themeColors.secondaryTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  ImageData getCurrentImageData() {
    final now = DateTime.now();
    for (var imageData in imageDataList) {
      if (now.isAfter(imageData.startDate) && now.isBefore(imageData.endDate)) {
        return imageData;
      }
    }
    return defaultImageData;
  }
}

// ImageData Class
class ImageData {
  final String image;
  final String text;
  final String subtext;
  final DateTime startDate;
  final DateTime endDate;

  ImageData({
    required this.image,
    required this.text,
    required this.subtext,
    required this.startDate,
    required this.endDate,
  });
}

final List<ImageData> imageDataList = [
  ImageData(
    image: 'assets/image/zemenekremt.jpg',
    text: 'ዘመነ ክረምት',
    subtext: 'ሰማዩን በደመናት ይሸፍናል ለምድርም ዝናምን ያዘጋጃል ሣርን በተራሮች ላይ ያበቅላል፤ለምለሙንም ለሰው ልጆች ጥቅም መዝሙር146:8',
    startDate: DateTime(2024, 7, 3),
    endDate: DateTime(2024, 10, 5),
  ),
  ImageData(
    image: 'assets/image/zemenetsgie.jpg',
    text: 'ዘመነ ጽጌ',
    subtext: '',
    startDate: DateTime(2024, 10, 6),
    endDate: DateTime(2024, 11, 14),
  ),
  ImageData(
    image: 'assets/image/zemeneastemhero.jpg',
    text: 'ዘመነ አስተምህሮ',
    subtext: '',
    startDate: DateTime(2024, 11, 15),
    endDate: DateTime(2024, 12, 22),
  ),
];

final ImageData defaultImageData = ImageData(
  image: 'assets/image/logo.png',
  text: 'እግዚአብሔርን አመስግኑ፤ መዝሙር መልካም ነውና። ለአምላካችን ምስጋና ያማረ ነው። መዝሙር146:1',
  subtext: '',
  startDate: DateTime(2024, 1, 1),
  endDate: DateTime(2100, 1, 1),
);
