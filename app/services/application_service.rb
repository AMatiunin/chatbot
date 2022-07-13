require 'facebook/messenger'

class ApplicationService
  attr_reader :arg

  def self.perform(arg)
    new(arg).call
  end

  def initialize(arg)
    @arg = arg
  end

  def call
    raise NotImplementedError, "class #{self.class.name} must implement abstract method 'call()'"
  end
end
