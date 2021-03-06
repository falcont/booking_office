module TrainsHelper
  def show_carriages(train)
    train.sort ? @sorted_carriages = train.carriages.order(:position) : @sorted_carriages = train.carriages.order(position: :desc)
    
    content_tag(:p, class: "carriages") do
      @sorted_carriages.each do |carriage|
        concat(link_to("#{carriage.number}", sti_carriage_path(carriage.type, carriage)))
        concat tag(:br)
      end
   end
  end
end