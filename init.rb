# frozen_string_literal: true

Redmine::Plugin.register :task1 do
  name 'Задание 1'
  author 'm.nikishin@elins.ru '
  description 'Плагин Задание1'
  version '0.0.1'

  menu :top_menu,
       :counters,
       {
         controller: :counters,
         action: :index
       },
       caption: 'Счетчики'

  menu :application_menu,
       :counters,
       {
         controller: :counters,
         action: :index
       },
       caption: 'Счетчики'
end
