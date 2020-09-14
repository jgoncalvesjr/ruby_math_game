# Generates math questions

class Question

  attr_reader :question, :answer

  def initialize
    @question = new_question
    @answer = eval(question)
  end

  def num1
    num1 = rand(1..20)
  end

  def num2
    num2 = rand(1..20)
  end

  def operator
    operators = ['+', '-']
    operator = operators.sample.to_sym
  end

  def new_question
    question = "#{num1} #{operator} #{num2}"
  end

end