module Surveyable
  class Answer < ActiveRecord::Base
    belongs_to :response, polymorphic: true
    belongs_to :question
    belongs_to :answer_choice

    scope :required, -> {joins(:question).where('questions.required'=>true)}
    scope :answered, -> {where("(answers.text IS NOT NULL AND answers.text <> '') OR answers.answer_choice_id IS NOT NULL")}
  end
end
