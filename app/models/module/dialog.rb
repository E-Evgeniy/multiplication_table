# frozen_string_literal: true

require 'timeout'

# Module with messages
module Dialog
  NUM_BEFORE_START = 3
  TIME_FOR_ANSWER = 5
  PAUSE_COUNT = 1 

  def greeting
    system('reset')
    puts('----- HELLO MY FRIEND! -----')
    puts('')
    puts('')
    puts('Enter your name please')
    puts('')
    gets.chop
  end

  def begin_test(name)
    system('reset')
    puts("Welcome #{name}")
    puts('')
    puts('To start press Enter')
    gets.chop
    countdown
  end

  def question(number0, number1)
    system('reset')
    puts('')
    puts("#{number0} * #{number1} = ")
    puts('')
  end

  def countdown
    system('reset')
    NUM_BEFORE_START.times do |i|
      puts("==== #{NUM_BEFORE_START - i} =====")
      sleep PAUSE_COUNT
      system('reset')
    end
    puts('***** GO! *****')
    sleep PAUSE_COUNT
    system('reset')
  end

  def enter_answer
    Timeout.timeout(TIME_FOR_ANSWER) {
      puts('Enter the answer')
      puts('')
      answer = gets.chop
      return answer
    }
    rescue
      'LONG THINK'
  end

  def output_of_the_result(data_with_result, name)
    output_info_about_result(data_with_result, name)
    total_combinations = data_with_result['total_combinations']
    return (data_with_result['true_count'] * 100 / total_combinations).round if data_with_result['false_count'].zero?

    i = 0
    data_with_result['false_answer'].each do |answer|
      puts("#{data_with_result['false_question'][i]}your answer #{answer}")
      i += 1
    end
    puts('')
    puts('**************************************************************************************')
    (data_with_result['true_count'] * 100 / total_combinations).round
  end

  def output_info_about_result(data_with_result, name)
    system('reset')
    total_combinations = data_with_result['total_combinations']
    puts('**************************************************************************************')
    puts('')
    puts("Dear #{name}. Your results:")
    puts('')
    puts("Total questions #{total_combinations}")
    puts('')
    puts("Percentage of correct answers #{(data_with_result['true_count'] * 100 / total_combinations).round}")
    puts('')
    puts("Correct answers #{data_with_result['true_count']}")
    puts('')
    puts("Incorrect answers #{data_with_result['false_count']}")
    puts('')
  end
end
