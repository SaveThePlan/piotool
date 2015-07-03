json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :email, :address, :phone, :website
  json.url contact_url(contact, format: :json)
end
