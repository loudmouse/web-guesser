require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = colorize_message(message)
  erb :index, :locals => { :number => SECRET_NUMBER, :message => message, :guess => guess, :color => color }
end

def check_guess(guess)
  if guess == SECRET_NUMBER
    "You got it right! The number was #{SECRET_NUMBER}."
  elsif guess > SECRET_NUMBER
    if guess - 5 > SECRET_NUMBER
      "Way too high!"
    else
      "Too high!"
    end
  else guess < SECRET_NUMBER
    if guess + 5 < SECRET_NUMBER
      "Way too low!"
    else
      "Too low!"
    end
  end
end

def colorize_message(message)
  if message == "Way too high!" || message == "Way too low!"
    "#E81C0C"
  elsif message == "Too high!" || message == "Too low!"
    "#FFA92F"
  else
    "#06F545"
  end
end
