class User < ApplicationRecord

  def self.exam
    name = check_name(greeting)
    puts('Press any key')
    begin_test
    #knowledge_check(name)
  end

  def self.begin_test
    system('reset')
    3.times do |i|
      puts("==== #{3 - i} =====")
      sleep 1
      system('reset')
    end
  end

  def self.greeting
    system('reset')
    puts('----- HELLO MY FRIEND! -----')
    puts('')
    puts('')
    puts('Enter your name please')
    gets
  end

  def self.check_name(name)
    User.create(name: name) if User.find_by(name: name).nil?
    name
  end

  def self.numbers_generate
    ar = []
    10.times do |i|
      ar.push(i)
    end
    ar
  end

  def self.create_hash_of_numbers
    hash_of_numbers = {}
    hash_of_numbers['0'] = numbers_generate
    hash_of_numbers['1'] = numbers_generate

    hash_of_numbers
  end

  def self.knowledge_check(name)
    hash_of_numbers = create_hash_of_numbers
    ar_questions = []

    for i in (0..120)
      question = generate_question(hash_of_numbers, ar_questions)



    end    
  end
end
