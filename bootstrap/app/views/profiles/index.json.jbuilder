json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :age, :city, :state, :country
  json.url profile_url(profile, format: :json)
end
