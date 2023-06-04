release: ./bin/rails db:migrate db:seed
web: ./bin/rails server -p $PORT -b 0.0.0.0
worker: ./bin/rake jobs:work
