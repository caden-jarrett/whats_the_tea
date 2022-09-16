
## About the Repo
 Whts The Tea is a project that allows developers to create subscriptions for customers, and different teas. All endpoints are active through local host.  

## Built With 
   ![RoR](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
   ![pgsql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

## Gems 
   ![rspec](https://img.shields.io/gem/v/rspec-rails?label=rspec&style=flat-square)
   ![shoulda](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers&style=flat-square)
   ![capybara](https://img.shields.io/gem/v/capybara?label=capybara&style=flat-square)
   ![simplecov](https://img.shields.io/gem/v/simplecov?label=simplecov&style=flat-square)
   ![spring](https://img.shields.io/gem/v/spring?color=blue&label=spring)
   ![faker](https://img.shields.io/gem/v/faker?color=blue&label=faker)
   ![faraday](https://img.shields.io/gem/v/faraday?color=blue&label=faraday)

## Set Up
- Clone this repo
- `bundle install`
- `rails s`

## Database Creation
- `rails db:{create,migrate}``

## Database Structure

![Database](https://user-images.githubusercontent.com/98786948/190541037-5fc32d8e-8fa5-4374-8c0a-926aeee944a5.png)

## Testing Instructions

 - Clone this repo
 - in terminal (apple or integrated)    
    * bundle install
    * bundle exec rspec 

## End Points

#### Create Subscription 
```
        params = {
            customer_id: 1,
            tea_id: 1,
            title: 'The High Life',
            frequency: 'Twice a week',
            price: 25.50
            }
```

#### request:
```
post https://localhost:3000/create_subscriptions, params:params
```

#### response:
```
        {
            data: {
                customer_id: 1,
                tea_id: 1,
                status: 'active',
                title: 'The High Life'
                price: 25.50,
                frequency: 'Twice a week'
            }
        }
```

#### Cancel Subscription 
```
        params = {
            subscription_id: 1
            }
```

#### request:
```
post https://localhost:3000/customer_subscriptions_cancel, params:params
```

#### response:
```
        {
            data: {
                customer_id: 1,
                tea_id: 1,
                status: 'cancelled',
                title: 'The High Life'
                price: 25.50,
                frequency: 'Twice a week'
            }
        }
```

#### View all of a customers subscriptions 
```
        params = {
            customer_id: 1
            }
```

#### request:
```
post https://localhost:3000/customer_subscriptions, params:params
```

#### response:
```
        {
            data: {
                customer_id: 1,
                subscriptions: {
                    active:                         
                            [{
                                title: 'The High Life'
                                price: 25.50,
                                status: 'active',
                                frequency: 'Twice a week',
                                tea_id: 1
                            }],
                    cancelled:                         
                            [{
                                title: 'Sea Breeze'
                                price: 45.50,
                                status: 'cancelled',
                                frequency: 'Once a month',
                                tea_id: 2
                            }]
                    }

            }
        }
```
