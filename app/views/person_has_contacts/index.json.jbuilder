json.array!(@person_has_contacts) do |person_has_contact|
  json.extract! person_has_contact, :id, :person, :contact
  json.url person_has_contact_url(person_has_contact, format: :json)
end
