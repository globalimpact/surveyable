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
  class InfoField < Question
    def field_type
      'noAnswer'
    end
  end


  class HiddenField < Question
    def field_type
      'hidden'
    end
  end

  class BooleanField < Question
    def field_type
      'boolean'
    end
  end

  class DateField < Question
    def field_type
      'date'
    end
  end

  class SingleSelectField < Question
    def field_type
      'select'
    end
  end

  class RelationshipSelectField < SingleSelectField

  end

  class MultiSelectField < Question
    def field_type
      'select'
    end
  end

  class TextField < Question
    def field_type
      'textarea'
    end
  end

  class StringField < Question
    def field_type
      'text'
    end
  end

  class IntegerField < Question
    def field_type
      'number'
    end
  end

  class MoneyAmountField < Question
    def field_type
      'text'
    end
  end

  class SingleDocumentField < Question
    def field_type
      'file'
    end
  end

  class MultiDocumentField < Question
    def field_type
      'file'
    end
  end

  class TelephoneField < Question
    def field_type
      'tel'
    end
  end
end