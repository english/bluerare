gem 'minitest'
require 'minitest/autorun'
require 'ostruct'

require_relative '../../models/contact_form_email'

class ContactFormEmailTest < Minitest::Unit::TestCase
  def msg
    OpenStruct.new :name => "John Smith",
                   :email => "john@example.com",
                   :content => "Bla bla bla"
  end

  def subject
    @subject ||= ContactFormEmail.new(msg).to_hash
  end

  def test_from
    assert_equal "no-reply@bluerare.co.uk", subject[:from]
  end

  def test_to
    assert_equal "contact-form@bluerare.co.uk", subject[:to]
  end

  def test_reply_to
    assert_equal "john@example.com", subject[:reply_to]
  end

  def test_subject
    assert_equal "New contact form message from John Smith", subject[:subject]
  end

  def test_body
    assert_equal "John Smith <john@example.com> has completed the contact form with: Bla bla bla", subject[:body]
  end

  def test_dev_env
    subject = ContactFormEmail.new(msg, :development).to_hash
    assert_equal "jamienglish@gmail.com", subject[:to]
  end
end
