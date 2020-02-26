require 'daru'
require 'nyaplot'
require 'ruby_linear_regression'

  data = Daru::DataFrame.from_csv("new.csv")

  data.plot(type: :scatter, x: 'GROSS SQUARE FEET', y: 'LAND SQUARE FEET') do |p, d|
    p.export_html("line.html")
    # `open line.html`
  end

  x = data['GROSS SQUARE FEET']
  y = data['SALE PRICE']
  d = []
  c = x.to_a
  c.each { |s| d.push([s])}
  x = d
  puts d.inspect
  puts x.to_a.inspect
  puts y.to_a.inspect
  linear_regression = RubyLinearRegression.new
  linear_regression.load_training_data(x, y)
  linear_regression.train_normal_equation
  prediction_data = [3000]
  predicted_price = linear_regression.predict(prediction_data)
  puts "Predicted price for a 1500 sq feet property: #{predicted_price.round}$"