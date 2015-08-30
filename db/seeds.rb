countries = [
  { name: 'Japan' },
  { name: 'Norway' },
  { name: 'Germany' },
  { name: 'Singapore' }
]

countries.each do |country|
  @country = Country.create(country)
  puts "created #{@country.attributes}"
end
