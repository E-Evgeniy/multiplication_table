# frozen_string_literal: true

require 'timeout'

# Module with messages
module Dialog
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
    3.times do |i|
      puts("==== #{3 - i} =====")
      sleep 1
      system('reset')
    end
    puts('***** GO! *****')
    sleep 1
    system('reset')
  end

  def enter_answer
    Timeout.timeout(3) {
      puts('Enter the answer')
      puts('')
      answer = gets.chop
      return answer
    }
    rescue
      'LONG THINK'
  end

  def output_of_the_result(data_with_result, name)
    system('reset')
    puts("Dear #{name}. Your results:")
    puts('')
    puts('Total questions 121')
    puts('')
    puts("Percentage of correct answers #{(data_with_result['true_count']*100/121).round}")
    puts('')
    puts("Correct answers #{data_with_result['true_count']}")
    puts('')
    puts("Incorrect answers #{data_with_result['false_count']}")
    puts('')
    return (data_with_result['true_count']*100/121).round if data_with_result['false_count'].zero?

    i = 0
    data_with_result['false_answer'].each do |answer|
      puts("#{data_with_result['false_question'][i]} your answer #{answer}")
      i += 1
    end

    (data_with_result['true_count']*100/121).round
  end
end
