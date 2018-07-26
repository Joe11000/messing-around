json.array! Dog.all do |dog|
  json.partial! "dogs/dog", dog: dog
end
