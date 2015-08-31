require "surveyable/version"



module Surveyable
  # Your code goes here...
end
require "surveyable/acts_as_survey"
require "surveyable/acts_as_response"
require "surveyable/answer"
require "surveyable/answer_choice"
require 'surveyable/question'

ActiveSupport.on_load(:active_record) do
  include Surveyable::ActsAsSurvey
  include Surveyable::ActsAsResponse

end