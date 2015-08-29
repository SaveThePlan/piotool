json.array!(@contacts_companies) do |contacts_company|
  json.extract! contacts_company, :id, :siret, :tva, :employees_count
  json.url contacts_company_url(contacts_company, format: :json)
end
