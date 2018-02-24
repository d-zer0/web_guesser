require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
message = "Too low!"

get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
	guess = guess.to_i

	if guess > SECRET_NUMBER
		if (guess - 5) > SECRET_NUMBER
			message = "Way too high!"
		else
			message = "Too high!"
		end
	elsif guess < SECRET_NUMBER
		if (guess +5) < SECRET_NUMBER
			message = "Way too low!"
		else
			messsage = "Too low!"
		end
	else
		message = "You got it right!  The SECRET NUMBER is #{SECRET_NUMBER}"
	end
end