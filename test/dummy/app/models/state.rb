class State < ActiveRecord::Base
  add_symbolic_names symbolic_name_attrib: :abbr, value_attrib: :name
end
