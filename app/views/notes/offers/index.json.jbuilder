json.array!(@notes) do |note|
  json.extract! note, :id
  json.url notes_offer_url(note, format: :json)
end
