user = User.create({email: 'maicon.f.michelon@gmail.com', password: '123'})
company = Company.create({owner: user, name: 'Gruber'})

type = Type.create({description: 'Computador', initial_code: 1, company: company})
group = Group.create({name: 'TI',company: company})
person = Person.create({name: 'Maicon', group: group})

provider = Provider.create({name: 'Mercadão da Informática', cpfCnpj: '74969434000130',
  phone: '33781234', localization: 'Toledo', company: company})

component = Component.create({name: 'Placa mãe', company: company})
hd = Component.create({name: 'HD', company: company})
ram = Component.create({name: 'Memória Ram', company: company})

fixture = Fixture.create({number: 1, warranty: 24, provider: provider, acquisition: Date.strptime('03-02-2012', '%d-%m-%Y'),
  type: type, purchase_value: 1300, company: company, person: person})
fixture.component_fixtures << ComponentFixture.new(component: component, fixture: fixture, quantity: 1)
fixture.component_fixtures << ComponentFixture.new(component: hd, fixture: fixture, quantity: 1)
fixture.component_fixtures << ComponentFixture.new(component: ram, fixture: fixture, quantity: 1)
fixture.save

maintenances = Maintenance.create({date: Date.new, description: 'Troca de memória Ram', value: 10,
  person: person, fixture: fixture})
