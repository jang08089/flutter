import 'package:path/path.dart';
import 'package:score_advanced/score_advanced.dart';
import 'dart:io';
void main(List<String> arguments) {
  List<StudentScore> studentlist = loadStudentData('file/students.txt');
  String? result = scoreadvance(studentlist);
  if (result != null) {
    saveResults('file/result.txt', result);
  }
}