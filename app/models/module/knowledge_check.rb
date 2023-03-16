# frozen_string_literal: true

require_relative './dialog'

# Module with calculation
module KnowledgeCheck
  def check_name(name)
    User.create(name:) if User.find_by(name:).nil?
  end

  def numbers_generate
    ar = []
    11.times do |i|
      ar.push(i)
    end
    ar
  end

  def create_hash_of_numbers
    hash_of_numbers = {}
    hash_of_numbers['0'] = numbers_generate
    hash_of_numbers['1'] = numbers_generate

    hash_of_numbers
  end

  def knowledge_check
    data_for_question = create_data_for_question
    data_with_result = create_data_with_result

    121.times do
      data_for_question = calc_data_for_question(data_for_question)
      question(data_for_question['m'], data_for_question['n'])
      answer = enter_answer
      data_with_result = analiz_answer(data_for_question, answer, data_with_result)
    end
    data_with_result
  end

  def create_data_with_result
    data_with_result = {}
    data_with_result['false_count'] = 0
    data_with_result['true_count'] = 0
    data_with_result['false_question'] = []
    data_with_result['false_answer'] = []
    data_with_result
  end

  def analiz_answer(data_for_question, answer, data_with_result)
    number0 = data_for_question['m']
    number1 = data_for_question['n']
    if (number0 * number1).to_s == answer
      data_with_result['true_count'] += 1
    else
      data_with_result['false_count'] += 1
      false_count = data_with_result['false_count'] - 1
      data_with_result['false_question'][false_count] = "#{number0} * #{number1} = "
      data_with_result['false_answer'][false_count] = answer
    end
    data_with_result
  end

  def create_data_for_question
    hash_of_numbers = create_hash_of_numbers
    questions = []
    data_for_question = {}
    data_for_question['hash_of_numbers'] = hash_of_numbers
    data_for_question['questions'] = questions
    data_for_question['m'] = 0
    data_for_question['n'] = 0
    data_for_question
  end

  def calc_data_for_question(data_for_question)
    elements = find_elements(data_for_question['hash_of_numbers'], data_for_question['questions'])

    data_for_question['m'] = elements['m']
    data_for_question['n'] = elements['n']
    data_for_question['questions'] << "#{elements['m']} * #{elements['n']} = "
    data_for_question
  end

  def find_elements(arrays_with_indexes, questions)
    elements = {}
    i = false
    while i == false
      q0 = find_element(arrays_with_indexes['0'])
      q1 = find_element(arrays_with_indexes['1'])
      i = true unless (questions.include? "#{q0} * #{q1} = ") || questions.length > 121
    end
    elements['m'] = q0
    elements['n'] = q1
    elements
  end

  def find_element(array_with_indexes)
    element_id = rand(array_with_indexes.length)
    array_with_indexes[element_id]
  end
end
