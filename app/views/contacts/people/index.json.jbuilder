json.array!(@contacts_people) do |contacts_person|
  json.extract! contacts_person, :id, :mobile, :job
  json.url contacts_person_url(contacts_person, format: :json)
end
