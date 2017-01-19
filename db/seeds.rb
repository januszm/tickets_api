User.create(first_name: 'Administrator', email: 'admin@nowhere.com', password: '12341234', admin: true)
user = User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@nowhere.com', password: '12341234')
agent = User.create(first_name: 'Jane', last_name: 'Smith', email: 'agent.smith@nowhere.com', password: '12341234', support_agent: true)
issues = Issue.create(3.times.map { { title: Faker::Book.title, creator: user } })
