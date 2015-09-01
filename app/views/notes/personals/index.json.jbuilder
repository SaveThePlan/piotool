json.array!(@notes) do |note|
  json.extract! note, :id
  json.url notes_personal_url(note, format: :json)
end
