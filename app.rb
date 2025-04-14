require "sinatra"
require "sinatra/reloader"

get("/howdy") do 
  erb(:hello)
end 

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get ("/square/results") do 
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root)
end

get ("/square_root/results") do 
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5

  erb(:square_root_results)
end

get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  user_min = params.fetch("user_min").to_i
  user_max = params.fetch("user_max").to_i

  @random_result = rand(user_min..user_max)

  erb(:random_results)
end

get("/payment/new") do
  erb(:new_payment)
end

get("/payment/results") do
  user_apr   = params.fetch("user_apr").to_f
  user_years = params.fetch("user_years").to_i
  user_pv    = params.fetch("user_pv").to_f

  monthly_rate = user_apr / 100 / 12
  num_payments = user_years * 12

  numerator   = monthly_rate * user_pv
  denominator = 1 - (1 + monthly_rate) ** -num_payments

  monthly_payment = numerator / denominator

  erb(:payment_results, { :locals => { 
    :monthly_payment => monthly_payment,
    :monthly_rate    => monthly_rate,
    :user_pv         => user_pv,
    :num_payments    => num_payments 
  }})
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
