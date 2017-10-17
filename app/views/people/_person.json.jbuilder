json.extract! person, :id, :name, :lastname, :email, :phone, :biography, :created_at, :updated_at
json.url person_url(person, format: :json)
