json.array!(@users) do |user|
  json.extract! user, :id, :email
  json.is_admin user.has_role?(:admin)
end
