class Contacts::Person < Contact

  belongs_to :company, inverse_of: :people, class_name: Contacts::Company

end
