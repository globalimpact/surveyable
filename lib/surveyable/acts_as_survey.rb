module Surveyable
  module ActsAsSurvey
    def self.included(base)
      base.send :extend, ClassMethods
    end
    module ClassMethods
      def acts_as_survey(response_relationship, options = {})
        has_many :questions, as: :survey, class_name: 'Surveyable::Question'
        #cattr_accessor :responses
        #self.responses = responses
      end
    end
  end
end