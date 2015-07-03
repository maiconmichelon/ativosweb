random = Random.new

namespace :db do
  task :populate => :environment do
    require 'faker'

    populate 1, User do |user|
      user.full_name = Faker::Name.name
      user.email = Faker::Internet.email
      user.password = '12345678'
      user.save!

      populate 1, Company do |company|
        company.owner = user
        company.name = Faker::Company.name
        company.save!

        populate 10, Provider do |provider|
          provider.name = Faker::Company.name
          provider.cpfCnpj = Faker::Company.ein
          provider.phone = Faker::PhoneNumber.phone_number
          provider.localization = Faker::Address.city
          provider.company = company
          provider.save!
        end

        (1..5).each do 
          type = Type.find_or_create_by(description: Faker::Lorem.word, company: company) do |type|
            type.initial_code = 1
            # create_component_type(type, 3, true)
            create_component_type(type, 1, false)
          end
          type.save!

          (1..10).each do |i|
            f = Fixture.find_or_create_by(number: i, type: type) do |f|
              f.warranty = random.rand(1..24)
              f.provider = company.providers.sample
              f.acquisition = Faker::Time.backward(720, :morning)
              f.purchase_value = random.rand(500..2000)
              f.company = type.company
              f.person = company.people.sample
              f.purchase_request = company.purchase_requests.sample
            end

            (1..3).each do
              ComponentFixture.find_or_create_by(component: f.type.component_types.sample.component, fixture: f) do |cf|
                cf.description =  Faker::Lorem.word
                cf.quantity = random.rand(1..4)
              end
            end
          end
        end

        (1..5).each do 
          group = Group.find_or_create_by(name: Faker::Team.name, company: company)
          person = Person.find_or_create_by(name: Faker::Name.name, group: group)
        end

        populate 30, PurchaseRequest do |pr|
          pr.title = Faker::Lorem.sentence
          pr.date = Faker::Time.backward(720, :morning) 
          pr.responsible = 
          pr.approval_responsible = user
          pr.description = Faker::Lorem.sentence
          pr.company_id = company.id
          pr.status = 0
          pr.save!
        end

        populate 300, Maintenance do |m|
          m.date = Faker::Time.backward(300, :morning) 
          m.description = Faker::Lorem.sentence
          m.value = random.rand(100..500)
          m.person = company.groups.sample.people.sample
          m.fixture = company.fixtures.sample

          m.maintenance_request = create_maintenance_request(company, user, m.fixture)
          m.save!
        end

        (1..10).each do
          create_maintenance_request(company, user, company.fixtures.sample)
        end
      end
    end

    populate 10, User do |user|
      user.full_name = Faker::Name.name
      user.email = Faker::Internet.email
      user.password = '12345678'
      user.save!
    end
  end
end

def populate(number, klass, &populate)
  (1..number).each do 
    model = klass.new
    populate.call(model)
  end
end

def create_component_type(type, number, pre_selected)
  (1..number).each do
    component = Component.find_or_create_by(name: Faker::Lorem.word, company: type.company) 
    component.save!
    type.component_types.new(component: component, pre_selected: pre_selected)
  end
end

def create_maintenance_request(company, user, fixture, mr = nil)
  mr ||= MaintenanceRequest.new

  mr.title = Faker::Lorem.sentence
  mr.description = Faker::Lorem.sentence
  mr.date = Faker::Time.backward(700, :morning)
  mr.responsible = user
  mr.approval_responsible = user
  mr.company = company
  mr.fixture = fixture
  mr.save!

  populate(Random.new.rand(1..5), Budget) do |budget|
    create_budgets(mr, budget)
  end

  mr.budget_approved = mr.budgets.sample
  mr.approved!

  mr
end

def create_budgets(request, budget = nil)
  budget ||= Budget.new

  budget.date = Faker::Time.backward(700, :morning)
  budget.request = request
  budget.value = Random.new.rand(100..900)
  budget.provider = request.company.providers.sample

  budget.save!
end
