# Surveyable

Simple gem to deal with attaching 'surveys' to existing models. This involves question and answer types defined here.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'surveyable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install surveyable

## Usage

Run migrations (to be included as files soon)

### Migrations

    create_table :questions do |t|
          t.integer :survey_id
          t.string :survey_type
          t.text :text
          t.string :type
          t.boolean :required
        end
    create_table :answers do |t|
          t.integer :question_id
          t.integer :response_id
          t.string :response_type
          t.text :text
          t.integer :answer_choice_id
          t.index [:response_id,:response_type]
        end
    create_table :answer_choices do |t|
      t.integer :question_id
      t.text :text
      t.index :question_id
    end

### Attach to models
Put 'acts_as_survey' in your survey class (the model that needs custom questions).
Put 'acts_as_response' in your response class (the model that your answers will attach to).
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/globalimpact/surveyable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

##License

MIT License. Copyright 2015 Global Impact. https://charity.org