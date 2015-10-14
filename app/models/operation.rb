# == Schema Information
#
# Table name: operations
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Operation < ActiveRecord::Base
  ADDITION = 1
  SUBTRACTION = 2
  MULTIPLICATION = 3
  DIVISION = 4

end
