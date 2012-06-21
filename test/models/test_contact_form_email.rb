gem 'minitest'
require 'minitest/autorun'
require 'ostruct'

require_relative '../../models/contact_form_email'

class ContactFormEmailTest < Minitest::Unit::TestCase
  def subject
    msg = OpenStruct.new :name => "John Smith",
                         :email => "john@example.com",
                         :content => "Bla bla bla"
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
end
