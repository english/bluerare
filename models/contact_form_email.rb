class ContactFormEmail
  def initialize msg
    @msg = msg
  end

  def from
    "no-reply@bluerare.co.uk"
  end

  def to
    "contact-form@bluerare.co.uk"
  end

  def reply_to
    @msg.email
  end

  def subject
    "New contact form message from #{@msg.name}"
  end

  def body
    "#{@msg.name} <#{@msg.email}> has completed the contact form with: #{@msg.content}"
  end

  def to_hash
    {
      :from => from,
      :to   => to,
      :reply_to => reply_to,
      :subject  => subject,
      :body     => body
    }
  end
end
