leslie = User.create(name: "Leslie", email: "leslie@leslie.org", password: "password1")
dave = User.create(name: "Dave", email: "dave@dave.edu", password: "password2")

leslie1 = leslie.stock_boxes.create(name: "Leslie1")
dave1 = dave.stock_boxes.create(name: "Dave1")

torso = leslie1.stocks.create(name: "torso")
snake = dave1.stocks.create(name: "snake")
