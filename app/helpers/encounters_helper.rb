module EncountersHelper

  def expansion_check_boxes(type)
    title = content_tag(:h4, "#{type.capitalize} Expansions")
    divs = []
    Expansion.method(type).call.each do |expansion|
      divs << content_tag(:div, :class => "#{type}-expansion") do
        check_box_tag('expansions[]', expansion.id, (params[:expansions].include?(expansion.id.to_s) if params[:expansions])) + " " +
        content_tag(:span, expansion.name) +
        if expansion.can_visit?
          content_tag(:span, " - Visiting? ", :class => "visiting") +
          check_box_tag('visiting[]', expansion.id, (params[:visiting].include?(expansion.id.to_s) if params[:visiting]))
        end
      end
    end
    title + divs.join.html_safe
  end

end
