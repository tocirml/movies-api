# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies = Movie.create([
                        {
                          title: 'Star Wars',
                          description: 'Space fights',
                          stock: 3,
                          rental_price: 5,
                          sale_price: 10
                        },
                        {
                          title: 'Lord of the Rings',
                          description: 'Mid age fights',
                          stock: 3,
                          rental_price: 6,
                          sale_price: 12
                        },
                        {
                          title: 'Harry Potter',
                          description: 'Wizard fights',
                          stock: 3,
                          rental_price: 7,
                          sale_price: 13
                        },
                        {
                          title: 'Avengers',
                          description: 'Comic fights',
                          stock: 3,
                          rental_price: 8,
                          sale_price: 14
                        }
                      ])

Like.create([
              {
                customer_email: 'patitoperez@pepe.com',
                movie: movies.first
              },
              {
                customer_email: 'patitoperez2@pepe.com',
                movie: movies.first
              },
              {
                customer_email: 'patitoperez3@pepe.com',
                movie: movies.first
              }
            ])

Rental.create([
                {
                  movie: movies.first,
                  customer_email: 'asklbdkahsbda@lskdaksjlda.com'
                },
                {
                  movie: movies[2],
                  customer_email: 'kahsbda@lsksjlda.com'
                },
                {
                  movie: movies[3],
                  customer_email: 'asklbdkaha@lsksjlda.com'
                }
              ])

Sale.create([
              {
                movie: movies.first,
                customer_email: 'asklbdkahsbda@lskdaksjlda.com'
              },
              {
                movie: movies[2],
                customer_email: 'kahsbda@lsksjlda.com'
              },
              {
                movie: movies[3],
                customer_email: 'asklbdkaha@lsksjlda.com'
              }
            ])
