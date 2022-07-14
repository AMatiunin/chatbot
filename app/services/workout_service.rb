class WorkoutService < ApplicationService
  attr_reader :user, :conversation, :answer

  def initialize(user, answer)
    @user= user
    @answer = answer
  end

  def call

    #TODO Add logic of choosing exercises
  end
end
