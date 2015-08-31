module Surveyable
  module ActsAsResponse
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def acts_as_response(options = {})
        has_many :answers, as: :response, class_name: 'Surveyable::Answer'

        send :include, InstanceMethods
      end
    end
    module InstanceMethods
      def survey
        nil
      end
    end
  end
end
