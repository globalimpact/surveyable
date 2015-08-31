module Surveyable
  module ActsAsSurvey
    def self.included(base)
      base.send :extend, ClassMethods
    end
    module ClassMethods
      def acts_as_survey(options = {})
        has_many :questions, as: :survey, class_name: 'Surveyable::Question'
        send :include, InstanceMethods
      end
    end
    module InstanceMethods
      def responses
        []
      end
    end
  end
end