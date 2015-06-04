user = User.create({email: 'maicon.f.michelon@gmail.com', password: '123'})
company = Company.create({owner: user, name: 'Gruber'})

type = Type.create({description: 'Computador', initial_code: 1, company: company})
group = Group.create({name: 'TI',company: company})
person = Person.create({name: 'Maicon', group: group})

provider = Provider.create({name: 'Mercadão da Informática', cpfCnpj: '74969434000130',
  phone: '33781234', localization: 'Toledo', company: company})

placa_mae = Component.create({name: 'Placa mãe', company: company})
hd = Component.create({name: 'HD', company: company})
ram = Component.create({name: 'Memória Ram', company: company})

fixture = Fixture.create({number: 1, warranty: 24, provider: provider, acquisition: Date.strptime('03-02-2012', '%d-%m-%Y'),
  type: type, purchase_value: 1300, company: company, person: person})
fixture.component_fixtures << ComponentFixture.new(component: placa_mae, fixture: fixture, quantity: 1)
fixture.component_fixtures << ComponentFixture.new(component: hd, fixture: fixture, quantity: 1)
fixture.component_fixtures << ComponentFixture.new(component: ram, fixture: fixture, quantity: 1)
fixture.save

maintenance = Maintenance.create({date: Date.strptime('03-02-2012', '%d-%m-%Y'), description: 'Troca de memória Ram', value: 10,
  person: person, fixture: fixture})

budget = Budget.create({date: Date.strptime('03-02-2012', '%d-%m-%Y'), description: 'Memória Ram', provider: provider,
	value: 200, company: company})

maintenance.budgets << budget
maintenance.save

type.component_types.new(component: placa_mae)
type.component_types.new(component: hd, pre_selected: false)
type.component_types.new(component: ram)
type.save