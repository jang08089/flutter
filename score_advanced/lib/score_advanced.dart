import 'dart:io';





class Score {
  int? score;

  void showinfo(){
    print('점수:$score');
  }
}

class StudentScore extends Score{
  String? name;
  

  @override
   void showinfo(){
    print('이름: $name, 점수: $score');
   }
}





List<StudentScore> loadStudentData(String filePath) {
  
  List<StudentScore> studentlist = [];
  
  
  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');
      print(parts);
      StudentScore studentScore = StudentScore();

      studentScore.name = parts[0];
      studentScore.score = int.parse(parts[1]);
      
      studentlist.add(studentScore);
      
      

      
      
      
      
       
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  return studentlist; 
}

void saveResults(String filePath, String content) {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content);
    print("저장이 완료되었습니다.");
  } catch (e) {
    print("저장에 실패했습니다: $e");
  }
  
}





String? scoreadvance(List<StudentScore> studentlist){
  stdout.write('어떤 학생의 통계를 확인하시겠습니까?');
  String? input = stdin.readLineSync();
  
  for (var n in studentlist) {
    
    if (n.name == input) {
      n.showinfo();
      return '이름: ${n.name}, 점수${n.score}';
    }
    else {
      print('잘못된 학생 이름을 입력하셨습니다.');
    }
  }
  return null;

   
  
}

void main(){
 
}


void addchallenge(List<StudentScore> studentlist){
  
  double total = 0;
  stdout.write('''메뉴를 선택하세요:
  1.우수생 출력
  
  2.전체 평균 점수 출력
  
  3.종료
  
  입력 :   ''');
  String? input = stdin.readLineSync();
  if (input == '1'){
    var compare = studentlist.reduce((a,b) => (a.score ?? 0 ) > (b.score ?? 0) ? a : b);
    print('우수생: ${compare.name} 점수: ${compare.score}');
  }
  else if (input == '2'){
    for (var n in studentlist){
         
      
           total += n.score! ;
      
      
      
      
    }
     print('평균 : ${total/2} 점');
    
    
  }
 
  
}




