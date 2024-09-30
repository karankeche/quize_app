
import "package:flutter/material.dart";
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}
class _QuizAppState extends State {
  List<Map> allQuestions = [
     {
      'question': 'Which of the following is the correct way to declare a variable in Dart?',
      'options': ['int x = 10;', 'var x = 10;', 'final x = 10;', 'All of the above'],
      'correctAnswer': 3,
    },
    {
      'question': 'Which of the following is used to define a constant in Dart?',
      'options': ['const', 'final', 'var', 'static'],
      'correctAnswer': 0,
    },
    {
      'question': 'In Dart, which keyword is used to define a function?',
      'options': ['function', 'def', 'void', 'None of the above'],
      'correctAnswer': 3, // Dart uses return type to define functions
    },
    {
       'question': 'Which collection in Dart does not allow duplicate values?',
      'options': ['List', 'Map', 'Set', 'Queue'],
      'correctAnswer': 2,
    },
    {
      'question': 'Which of the following is not a data type in Dart?',
      'options': ['int', 'float', 'bool', 'double'],
      'correctAnswer': 1, // Dart uses 'double' for decimal numbers, not 'float'
    },
  ];

  bool questionPage = true;
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int score = 0; // Score tracker added

  WidgetStateProperty<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex ==
          allQuestions[currentQuestionIndex]["correctAnswer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }

  Scaffold isQuestionScreen() {
    if (questionPage == true) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
          

            ),
            
          ),
          centerTitle: true,
                  ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            /// QUESTION NUMBER
            Row(
              children: [
                const SizedBox(
                  width: 130,
                ),
                Text(
                  "Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            /// QUESTION
            SizedBox(
              width: 330,
              height: 80,
              child: Text(
                allQuestions[currentQuestionIndex]["question"],
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 99, 34, 110),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            /// OPTION 1
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(0),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;
                    if (selectedAnswerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
                      score++; // Increment score if the answer is correct
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "A. ${allQuestions[currentQuestionIndex]['options'][0]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            /// OPTION 2
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(1),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;
                    if (selectedAnswerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
                      score++; // Increment score if the answer is correct
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "B. ${allQuestions[currentQuestionIndex]['options'][1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            /// OPTION 3
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(2),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;
                    if (selectedAnswerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
                      score++; // Increment score if the answer is correct
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "C. ${allQuestions[currentQuestionIndex]['options'][2]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            /// OPTION 4
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                    if (selectedAnswerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
                      score++; // Increment score if the answer is correct
                    }
                    setState(() {});
                  }
                },
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
                ),
                child: Text(
                  "D. ${allQuestions[currentQuestionIndex]['options'][3]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedAnswerIndex != -1) {
              /// THIS CHECK THE CONDITION AND SHOWS THE RESULT SCREEN
              if (currentQuestionIndex < allQuestions.length - 1) {
                currentQuestionIndex++;
              } else {
                questionPage = false;
              }
              selectedAnswerIndex = -1;
              setState(() {});
            }
          },
          backgroundColor: Colors.amberAccent,
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text(
            "Quiz Result",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 170, 255),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://media1.tenor.com/images/e7e211a3c1a5b8e18a1801c3bc84c46a/tenor.gif?itemid=13729315",
                height: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                "Congratulations",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 220, 218, 214),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Score: $score / ${allQuestions.length}", // Display final score
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
             questionPage = true;
               currentQuestionIndex = 0;
               selectedAnswerIndex = -1;
               score = 0;
              setState(() {});
          },
          
          backgroundColor: Colors.amberAccent,
          child: const Text("Retest")
        ),
      );
    }
  }
}