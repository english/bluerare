gem 'minitest'
require 'minitest/autorun'

require 'active_model'
require_relative '../../models/message'

class MessageTest < Minitest::Unit::TestCase
  def subject
    @message ||= Message.new(:name => "John Smith",
                             :email => "john@example.com",
                             :content => "Bla bla bla")
  end

  def test_name_required
    subject.name = nil
    refute subject.valid?

    subject.name = "John"
    assert subject.valid?
  end

  def test_email_validations
    subject.email = nil
    refute subject.valid?

    subject.email = "someone@example.com"
    assert subject.valid?

    subject.email = "someone.example.com"
    refute subject.valid?
  end

  def test_content_required
    subject.content = nil
    refute subject.valid?

    subject.content = "Some content"
    assert subject.valid?
  end
end
