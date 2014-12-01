contact_attributes = [
  { first_name: 'Liz', last_name: 'Lemon', phone_number: '1234567890' },
  { first_name: 'Jenna', last_name: 'Maroney', phone_number: '1234567890' },
  { first_name: 'Pete', last_name: 'Hornberger', phone_number: '1234567890' },
  { first_name: 'JD', last_name: 'Lutz', phone_number: '1234567890' },
  { first_name: 'Kellen', last_name: 'Lutz', phone_number: '1234567890' },
  { first_name: 'Frank', last_name: 'Rositano', phone_number: '1234567890' },
  { first_name: 'James', last_name: 'Spurlock', phone_number: '1234567890' },
  { first_name: 'Jack', last_name: 'Donaghy', phone_number: '1234567890' },
  { first_name: 'Sue', last_name: 'Van Der Hoot', phone_number: '1234567890' },
  { first_name: 'Kenneth Ellen', last_name: 'Parcel', phone_number: '1234567890' },
  { first_name: 'Don', last_name: 'Geiss', phone_number: '1234567890' },
  { first_name: 'Kathy', last_name: 'Geiss', phone_number: '1234567890' },
  { first_name: 'Tracy', last_name: 'Jordan', phone_number: '1234567890' },
  { first_name: 'Kevin', last_name: 'Grizzwald', phone_number: '1234567890' },
  { first_name: 'Fiance', last_name: 'Grizzwald', phone_number: '1234567890' },
  { first_name: 'Walter', last_name: 'Slattery', phone_number: '1234567890' },
]

contact_attributes.each do |attributes|
  Contact.create(attributes)
end
