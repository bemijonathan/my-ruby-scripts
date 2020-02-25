require 'daru'
require 'nyaplot'
require 'rumale'

data = Daru::DataFrame.from_csv("./scores.csv")

data.plot(type: :scatter, x: 'absences', y: 'failures') do |p, d|
  p.xrange [-10, 10]
  p.yrange [-10, 10]
  p.export_html("line.html")
  # `open line.html`
end

x = data["absences"]

y = data["absences"]



  estimator = Rumale::LinearModel::LinearRegression.new()
  estimator.fit(x.to_a, y.to_a)
  # results = estimator.predict(5)
  # puts results

  # puts x.to_a