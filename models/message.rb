class Message
  include ActiveModel::Validations

  validates_presence_of :name, :email, :content

  validates_format_of :email, :message => "Invalid email address",
    :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  attr_accessor :name, :email, :content

  def initialize attrs={}
    attrs.each { |k,v| send "#{k}=", v }
  end
end
