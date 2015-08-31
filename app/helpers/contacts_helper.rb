module ContactsHelper

  def full_name contact
    full_name = contact.name
    full_name += " #{contact.first_name}" if contact.is_a?(Contacts::Person)
    full_name
  end

end
