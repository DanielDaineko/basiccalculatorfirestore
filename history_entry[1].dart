import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryEntry {
  final String expression;
  final double result;
  final Timestamp timestamp;

  HistoryEntry({
    required this.expression,
    required this.result,
    required this.timestamp,
  });

  factory HistoryEntry.fromJson(Map<String, dynamic> json) {
    return HistoryEntry(
      expression: json['expression'],
      result: json['result'].toDouble(),
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expression': expression,
      'result': result,
      'timestamp': timestamp,
    };
  }
}
