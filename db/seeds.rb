users = [
  { email: 'yhoshino11@gmail.com',
    password: 'password',
    password_confirmation: 'password'
  }
]

users.each do |user|
  @user = User.create(user)
  puts "created #{@user.attributes}"
end
