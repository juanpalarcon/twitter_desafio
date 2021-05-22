# README

-con el boton my friends se puede ir a la lista de amigos que sigue y ver sus tweets

- hacer post por consola, cuando hice migraciones hoy con el profe pierre no me volvio a tomar los tweets por el local solo por consola y postman, no lo pude solucionar

- para crearlos se le tiene que pasar:
- ejemplo
- Tweet.create(content: 'creado desde la consola', user_id: 1)

- activeadmin
- http://localhost:3000/admin/

- entrar a la pestaña User

- email: test7@example.com pass: 123123

para busar tweet por fechas

- "/api/:fecha1/:fecha2"
- ejemplo http://localhost:3000/api/2021-05-10/2021-05-15

para crear un tweets desde la api. POST: http://localhost:3000/api/create

- basic auth:juanpablo password:juanpablo
- se tiene que pasar un content y un user_id para poder crearlo
