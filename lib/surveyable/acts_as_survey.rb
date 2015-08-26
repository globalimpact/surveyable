module Surveyable
  module ActsAsSurvey
    extend ActiveSupport::Concern
    included do
      has_many :questions, as: :survey

    end
    module ClassMethods
      def acts_as_survey(responses, options = {})
        cattr_accessor :responses
        self.responses = responses
      end
    end
  end
end

ActiveRecord::Base.send :include, Surveyable::ActsAsSurvey