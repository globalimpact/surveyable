module Surveyable
  class Question < ActiveRecord::Base
    belongs_to :survey, polymorphic: true
    has_many :answers, :dependent => :restrict_with_error
    has_many :answer_choices, dependent: :destroy
    STI_TYPES = %w[InfoField HiddenField BooleanField DateField SingleSelectField MultiSelectField TextField StringField IntegerField MoneyAmountField SingleDocumentField MultiDocumentField TelephoneField RelationshipSelectField]
    accepts_nested_attributes_for :answer_choices, :allow_destroy => true,
                                  :reject_if => lambda { |a| a[:text].blank? }
    validates_presence_of :text
    validates_presence_of :type

    scope :required, -> { where(required:true)}
    def field_type
      'text'
    end
  end
  class InfoField < Surveyable::Question
    def field_type
      'noAnswer'
    end
  end


  class HiddenField < Surveyable::Question
    def field_type
      'hidden'
    end
  end

  class BooleanField < Surveyable::Question
    def field_type
      'boolean'
    end
  end

  class DateField < Surveyable::Question
    def field_type
      'date'
    end
  end

  class SingleSelectField < Surveyable::Question
    def field_type
      'select'
    end
  end

  class RelationshipSelectField < SingleSelectField

  end

  class MultiSelectField < Surveyable::Question
    def field_type
      'select'
    end
  end

  class TextField < Surveyable::Question
    def field_type
      'textarea'
    end
  end

  class StringField < Surveyable::Question
    def field_type
      'text'
    end
  end

  class IntegerField < Surveyable::Question
    def field_type
      'number'
    end
  end

  class MoneyAmountField < Surveyable::Question
    def field_type
      'text'
    end
  end

  class SingleDocumentField < Surveyable::Question
    def field_type
      'file'
    end
  end

  class MultiDocumentField < Surveyable::Question
    def field_type
      'file'
    end
  end

  class TelephoneField < Surveyable::Question
    def field_type
      'tel'
    end
  end
end