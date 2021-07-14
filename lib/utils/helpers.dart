import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constants/colors.dart';
import 'package:intl/intl.dart';

customYMargin(double value) {
  return SizedBox(height: value);
}

customXMargin(double value) {
  return SizedBox(width: value);
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      timeInSecForIosWeb: 5,
      backgroundColor: AppColors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

showErrorToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      webBgColor: "#e74c3c",
      timeInSecForIosWeb: 5,
      // backgroundColor: AppColors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

String capitalize(val) {
  return "${val[0].toUpperCase()}${val.substring(1)}";
}

formatDate(value) {
  final df = new DateFormat('dd-MM-yyyy');
  return df.format(value);
}

formatDay(value) {
  final df = new DateFormat('EEEE');
  return df.format(value);
}

formatDayMonth(value) {
  final df = new DateFormat('EEEE, MMM d');
  return df.format(value);
}

formatTime(value) {
  final df = new DateFormat('hh,mm,ss');
  return df.format(value);
}



class Status {
  static final sent = 'sent';
  static final delivered = 'delivered';
  static final read = 'read';
}
