module Surveyable
  module ActsAsSurvey
    extend ActiveSupport::Concern
    included do
      has_many :questions, as: :survey, class_name: 'Surveyable::Question'

    end
    module ClassMethods
      def acts_as_survey(response_relationship, options = {})
        #cattr_accessor :responses
        #self.responses = responses
      end
    end
  end
end

ActiveRecord::Base.send :include, Surveyable::ActsAsSurvey