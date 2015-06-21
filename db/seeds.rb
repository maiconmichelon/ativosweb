data = Date.strptime('03-02-2012', '%d-%m-%Y')

user = User.create({full_name: 'Maicon Michelon', email: 'maicon.f.michelon@gmail.com', password: '12345678'})
user2 = User.create({full_name: 'Joao', email: 'joao@gmail.com', password: '12345678'})
user3 = User.create({full_name: 'Jose', email: 'jose@gmail.com', password: '12345678'})
user4 = User.create({full_name: 'Josias', email: 'josias@gmail.com', password: '12345678'})
user5 = User.create({full_name: 'Maria', email: 'maria@gmail.com', password: '12345678'})

company = Company.create({owner: user, name: 'Gruber'})
CompanyUser.create({user: user2, company: company, admin: false})
CompanyUser.create({user: user3, company: company, admin: true})

type = Type.create({description: 'Computador', initial_code: 1, company: company})
group = Group.create({name: 'TI',company: company})
person = Person.create({name: 'Person', group: group})
leader = Person.create({name: 'Leader', group: group})

provider = Provider.create({name: 'Mercadão da Informática', cpfCnpj: '74969434000130',
  phone: '33781234', localization: 'Toledo', company: company})

placa_mae = Component.create({name: 'Placa mãe', company: company})
hd = Component.create({name: 'HD', company: company})
ram = Component.create({name: 'Memória Ram', company: company})

pr = PurchaseRequest.create({title: 'Compra de Computador' , date: data, description: 'descricao qualquer',
  responsible: user2, approval_responsible: user, company: company})
b = pr.budgets.build({date: data, value: 200, provider: provider})
pr.budget_approved = b
pr.approved!

fixture = Fixture.create({number: 1, warranty: 24, provider: provider, acquisition: Date.strptime('03-02-2012', '%d-%m-%Y'),
  type: type, purchase_value: 1300, company: company, person: person, purchase_request: pr})
fixture.component_fixtures << ComponentFixture.new(description: 'abc', component: placa_mae, fixture: fixture, quantity: 1)
fixture.component_fixtures << ComponentFixture.new(component: hd, fixture: fixture, quantity: 1)
fixture.component_fixtures << ComponentFixture.new(component: ram, fixture: fixture, quantity: 1)
fixture.save

maintenance = Maintenance.create({date: data, description: 'Troca de memória Ram', value: 10,
  person: person, fixture: fixture})

type.component_types.new(component: placa_mae)
type.component_types.new(component: hd, pre_selected: false)
type.component_types.new(component: ram)
type.save

mr = MaintenanceRequest.create({title: 'Troca de memória', date: data, description: 'descricao qualquer',
  responsible: user2, fixture: fixture, approval_responsible: user, company: company})
mr.budgets.build({date: data, value: 200, provider: provider})
mr.save