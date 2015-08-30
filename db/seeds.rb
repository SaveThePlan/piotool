admin = User.create!(email: 'realnanook@gmail.com', password: '12345678', password_confirmation: '12345678')

user = User.create!(email: 'user@example.com', password: '12345678', password_confirmation: '12345678')

Contacts::Person.create!(
    name: 'John Doe',
    email: 'john.doe@example.com',
    address: '1, Sunny street \n ZIP234 City',
    phone: '+33 1 23 45 67 89',
    mobile: '+33 6 23 45 67 89',
    job: 'CEO',
    user: user
)

Contacts::Person.create!(
    name: 'Jane Doe',
    email: 'jane.doe@example.com',
    address: '1, Sunny street \n ZIP234 City',
    phone: '+33 1 23 45 67 89',
    mobile: '+33 6 23 45 67 89',
    job: 'CTO',
    user: user
)

Contacts::Company.create!(
    name: 'Google',
    email: 'contact@example.com',
    address: '1, Sunny street \n ZIP234 City',
    phone: '+33 1 23 45 67 89',
    fax: '+33 1 23 45 67 80',
    website: 'http://example.com',
    siret: '90876',
    tva: 'tva-124356',
    employees_count: 12,
    user: user
)
