//
//  QuizQuestion.swift
//  Trivia
//
//  Created by Ariya Khaton on 3/12/25.
//

import UIKit

class QuizViewController: UIViewController{
    
//    struct QuizQuestions{
//        
//        let questions: String
//        let answer: [String]
//        let correctAnswer: String
//    }

    
    
    
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
//    @IBOutlet weak var answerButton1: UIButton!
//    //@IBOutlet var answerButtons: UIButton!
//    @IBOutlet weak var answerButton2: UIButton!
//    
//    @IBOutlet weak var answerButton3: UIButton!
//    @IBOutlet weak var answerButton4: UIButton!
    
    
    let questions = [
        ("What is the capital of France?", ["Paris", "Berlin", "Rome", "Madrid"], "Paris"),
        ("What is the largest ocean?", ["Pacific", "Atlantic", "Indian", "Arctic"], "Pacific"),
        ("Which planet is known as the Red Planet?", ["Mercury", "Venus", "Earth", "Mars", "Jupiter"], "Mars") ] //as [Any] as [Any]
    
    var currentQuestionIndex: Int = 0
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
    }
    
    func loadQuestions(){
        guard currentQuestionIndex < questions.count else {
            return
        }
        let currentQuestion = questions[currentQuestionIndex]
        
        questionsLabel.text = currentQuestion.0
        print("Loading Questions: \(currentQuestion.0)")
        
        for (index, button) in answerButtons.enumerated(){
            if index < currentQuestion.1.count{
                button.setTitle(currentQuestion.1[index], for: .normal)
                    button.isHidden = false
                    print("Setting button \(index) title to \(currentQuestion.1[index])")
            } else {
                button.isHidden = true
            }
        }
        progressLabel.text = "Question \(currentQuestionIndex + 1) of \(questions.count)"
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]
        let selectedAnswer = sender.currentTitle ?? ""
            
        if selectedAnswer == currentQuestion.2 {
            print("Correct")
        } else {
            print("Incorrect")
        }
        
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count {
            loadQuestions()
        }else {
            print("Quiz complete")
        }
        }
    }
