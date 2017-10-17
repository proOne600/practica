class Person
  include Mongoid::Document
  field :name, type: String
  field :lastname, type: String
  field :email, type: String
  field :phone, type: Integer
  field :biography, type: String
end
