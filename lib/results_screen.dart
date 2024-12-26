import 'package:adva_flutter/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adva_flutter/questions%20summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget
{
  const ResultsScreen({super.key, required this.chooseAnswer});

  final List<String> chooseAnswer;

  List <Map<String, Object>> getSummeryData() // map is type of lis that generic type that specify keys and values.
  {
    final List <Map<String, Object>> summary=[];

    for (var i=0; i < chooseAnswer.length; i++)
    {
      summary.add(
        {
        'question_index': i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : chooseAnswer[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final summaryData = getSummeryData();
    final numTotalQuestions =questions.length;
    final numCorrectQuestions=summaryData.where((data) 
    {
      return data['user_answer']== data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(
              onPressed: (){}, 
              child: const Text('Restart Quiz'),
              )
          ],
       ),
      ),
    );
  }
}