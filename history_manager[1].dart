import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'history_entry.dart';

class HistoryManager {
  final String _collectionPath = 'calculator_history';

  Future<List<HistoryEntry>> getHistory() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(_collectionPath).get();
      List<HistoryEntry> historyEntries = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return HistoryEntry.fromJson(data);
      }).toList();
      return historyEntries;
    } catch (e) {
      print('Error fetching history: $e');
      return [];
    }
  }

  Future<void> addToHistory(String expression, double result) async {
    try {
      await FirebaseFirestore.instance.collection(_collectionPath).add({
        'expression': expression,
        'result': result,
        'timestamp': Timestamp.now(),
      });
    } catch (e) {
      print('Error adding to history: $e');
    }
  }
}
