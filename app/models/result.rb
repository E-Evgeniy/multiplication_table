# frozen_string_literal: true

require_relative './module/dialog'
require_relative './module/knowledge_check'

# Model for processing tests
class Result < ApplicationRecord
  belongs_to :user

  include Dialog
  include KnowledgeCheck

  def self.exam
    result = Result.new
    name = result.greeting
    result.check_name(name)
    result.begin_test(name)
    data_with_result = result.knowledge_check
    result.result = result.output_of_the_result(data_with_result, name)
    result.user_id = User.find_by(name:).id
    puts("result #{result}")
    result.save
  end
end
