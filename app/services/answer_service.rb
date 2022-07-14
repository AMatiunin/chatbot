class AnswerService < ApplicationService
  attr_reader :postback

  def call
    @postback = arg
    postback_answer(postback)
  end

  def postback_answer(postback)
    answer = postback.messaging[:postback][:payload]

    case answer
    when "EXIT"
      exit_survey
    when "START"
      start_exercise(1)
    when "EXERCISE_2"
      start_exercise(2)
    when "EXERCISE_3"
      start_exercise(3)
    when "EXERCISE_4"
      start_exercise(4)
    when "EXERCISE_5"
      finish
    else
      exit_survey
    end
  end

  def start_exercise(number)
    {
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: "This is the #{number} exercise, when you done it, go for another?",
          buttons: [
            { type: 'postback', title: 'Go next', payload: "EXERCISE_#{number + 1}" },
            { type: 'postback', title: 'No', payload: 'EXIT' }
          ]
        }
      }
    }
  end

  def exit_survey
    { text: 'Oh, it`s so sad' }
  end

  def finish
    { text: 'You are done all of it' }
  end
end