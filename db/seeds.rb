user = User.create({email: 'maicon.f.michelon@gmail.com', password: '123'})
company = Company.create({owner_id: user.id, name: 'Gruber'})

type = Type.create({description: 'Computador', initial_code: 1, company: company})
group = Group.create({name: 'TI',company: company})
person = Person.create({name: 'Maicon', group: group})

provider = Provider.create({name: 'Mercadão da Informática', cpfCnpj: '74969434000130',
  phone: '33781234', localization: 'Toledo', company: company})

component = Component.create({name: 'Placa mãe', company: company})
hd = Component.create({name: 'HD', company: company})
ram = Component.create({name: 'Memória Ram', company: company})

fixture = Fixture.create({number: 1, warranty: 24, provider: provider, acquisition: Date.new,
  type: type, purchaseValue: 1300, company: company, person: person})
fixture.component_fixtures << Component_fixture.new(component: component, fixture: fixture, number: 1)
fixture.component_fixtures << Component_fixture.new(component: hd, fixture: fixture, number: 1)
fixture.component_fixtures << Component_fixture.new(component: ram, fixture: fixture, number: 1)
fixture.save

maintenances = Maintenance.create({date: Date.new, description: 'Troca de memória Ram', value: 10,
  person: person, fixture: fixture})
