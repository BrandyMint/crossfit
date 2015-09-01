module WorkoutsHelper
  def display_moves(moves)
    if moves.any?
      content_tag :ul do
        moves.each do |move|
          concat content_tag(:li, display_move(move))
        end
      end
    end
  end

  def display_move(move)
    content_tag :span do
      items = [move.title]
      %i(reps weight_kilos distance_meters height_meters time_seconds).each do |param|
        items << label_for(param, move)
      end
      items.compact.join(' ').html_safe
    end
  end

  def label_for(param, move)
    if move.send(param) > 0
      send(:"#{param}_label", move)
    end
  end

  def reps_label(move)
    content_tag :span, t(:reps, count: move.reps), class: "label label-primary"
  end

  def weight_kilos_label(move)
    content_tag :span, "#{move.weight_kilos} кг", class: "label label-success"
  end

  def distance_meters_label(move)
    content_tag :span, "#{move.distance_meters} м", class: "label label-default"
  end

  def height_meters_label(move)
    content_tag :span, "#{move.height_meters} м", class: "label label-default"
  end

  def time_seconds_label(move)
    content_tag :span, "#{move.time_seconds} c", class: "label label-info"
  end
end
