class ApplicationService

  def self.perform(*args)
    new(*args).call
  end

  def initialize(*_); end

  def call
    raise NotImplementedError, "class #{self.class.name} must implement abstract method 'call()'"
  end
end
