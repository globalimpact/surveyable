module Surveyable
  module ActsAsResponse
    extend ActiveSupport::Concern
    included do
      has_many :answers, as: :response
    end
    module ClassMethods
      def acts_as_response(survey, options = {})
        cattr_accessor :survey
        self.survey = survey
      end
    end
  end
end

ActiveRecord::Base.send :include, Surveyable::ActsAsResponse