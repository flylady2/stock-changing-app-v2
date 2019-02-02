require './config/environment'
require 'date'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use UsersController
use StockBoxesController
use StocksController
run ApplicationController
