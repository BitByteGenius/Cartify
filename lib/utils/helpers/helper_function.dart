import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunction {
  static Color? getColor(String value) {
    if (value == 'green') {
      return Colors.green;
    } else if (value == 'red') {
      return Colors.red;
    } else if (value == 'blue') {
      return Colors.blue;
    } else if (value == 'yellow') {
      return Colors.yellow;
    } else if (value == 'orange') {
      return Colors.orange;
    } else if (value == 'purple') {
      return Colors.purple;
    } else if (value == 'pink') {
      return Colors.pink;
    } else if (value == 'black') {
      return Colors.black;
    } else if (value == 'white') {
      return Colors.white;
    } else if (value == 'grey' || value == 'gray') {
      return Colors.grey;
    } else if (value == 'brown') {
      return Colors.brown;
    } else if (value == 'cyan') {
      return Colors.cyan;
    } else if (value == 'teal') {
      return Colors.teal;
    } else if (value == 'indigo') {
      return Colors.indigo;
    } else if (value == 'lime') {
      return Colors.lime;
    } else if (value == 'amber') {
      return Colors.amber;
    } else if (value == 'deep orange' || value == 'deeporange') {
      return Colors.deepOrange;
    } else if (value == 'deep purple' || value == 'deeppurple') {
      return Colors.deepPurple;
    } else if (value == 'light blue' || value == 'lightblue') {
      return Colors.lightBlue;
    } else if (value == 'light green' || value == 'lightgreen') {
      return Colors.lightGreen;
    } else if (value == 'blue grey' || value == 'bluegrey') {
      return Colors.blueGrey;
    }

    return Colors.transparent;
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
