module CarriagesHelper

 def carriages_count(train, carriage_type)
   train.carriages.where(type: carriage_type).count
 end

 def calculate_seats(train, carriage_type, seats_type)
   train.carriages.where(type: carriage_type).sum(seats_type)
 end
 
 def sti_carriage_path(type = "carriage", carriage = nil, action = nil)
  send "#{format_sti(action, type, carriage)}_path", carriage
 end

 def format_sti(action, type, carriage)
   action || carriage ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
 end

 def format_action(action)
   action ? "#{action}_" : ""
 end
 
 
end
