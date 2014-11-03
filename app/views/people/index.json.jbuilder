json.array!(@people) do |person|
  json.extract! person, :id, :dude
  json.url person_url(person, format: :json)
end
