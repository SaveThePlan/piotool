class Contacts::Company < Contact

  has_many :people, inverse_of: :company, class_name: Contacts::Person

end
