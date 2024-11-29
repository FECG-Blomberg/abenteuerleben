# Preview all emails at http://localhost:3000/rails/mailers/child_registration_mailer
class ChildRegistrationMailerPreview < ActionMailer::Preview
  def registered_mail
    parent = Parent::Parent.new
    parent.surname = 'Musterman'
    parent.forename = 'Max'
    parent.telephone = '01234567'
    parent.housephone = '0223456'
    parent.email = 'max_musterman@example.com'
    parent.street = 'musterstr.'
    parent.house = '111'
    parent.city = 'musterstadt'
    parent.post = '12345'

    child = Child.new
    child.surname = 'Musterman'
    child.forename = 'Asdfine'
    child.birthday = '2000-01-01'
    child.sex = 'girl'
    child.medicals = 'nothing'
    child.notes = 'also nothing'
    child.wishmate = 'The one from family B'
    camp = Camp.new
    camp.name = "One"
    camp.price = '123 EURO'
    camp.date_start = '2020-01-01'
    camp.date_end = '2020-01-02'

    child.camp = camp
    parent.children << child

    ChildRegistrationMailer.with(parent: parent, child: child).registered_mail
  end
end
