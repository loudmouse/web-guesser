require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => { :number => SECRET_NUMBER, :message => message, :guess => guess }
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
