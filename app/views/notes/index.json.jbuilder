json.array!(@notes) do |note|
  json.extract! note, :id, :content, :kind
  json.url note_url(note, format: :json)
end
