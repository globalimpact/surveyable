module Surveyable
  class AnswerChoice < ActiveRecord::Base
    belongs_to :question
    has_one :answer
  end
end
