# tickets-api

REST API to create, view and manage support requests.

* Ruby/Rails version

Ruby 2.3 + Rails 5

* Database creation

Standard Ruby on Rails procedures:

```
rails db:create; rails db:migrate; rails db:seed
```

* How to run the test suite

```rake```

* Services and Jobs

There are two services other than standard CRUD actions: Assign User to Issue and Finalize Issue. There are no background jobs since the API does not perform any long running tasks nor doesn't integrate with external services
