module Surveyable
  module ActsAsResponse
    extend ActiveSupport::Concern
    included do
      has_many :answers, as: :response
      def survey
        self.send(survey_relationship)
      end
    end
    module ClassMethods
      def acts_as_response(survey_relationship, options = {})
        cattr_accessor :survey
        self.survey_relationship = survey_relationship.to_s
      end
    end
  end
end
ActiveRecord::Base.send :include, Surveyable::ActsAsResponse