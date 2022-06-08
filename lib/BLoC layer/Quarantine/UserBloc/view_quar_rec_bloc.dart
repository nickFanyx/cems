import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewQRRecord {
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round() + 1;
  }

  Color getColor(String status) {
    Color warning = Colors.red;
    Color lowrisk = Colors.yellowAccent;
    Color noresponse = Colors.grey;

    if (status == "Not Verify") {
      return noresponse;
    } else if (status == "Confirmed Case") {
      return warning;
    } else {
      return lowrisk;
    }
  }
}
