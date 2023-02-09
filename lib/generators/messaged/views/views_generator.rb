module Messaged
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      def set_source_paths
        @source_paths = [
          File.expand_path('templates', __dir__),
          File.expand_path('../../../..', __dir__),
        ]
      end

      def copy_message_view_templates
        copy_file \
          'messages/_form.html.erb',
          'app/views/messaged/messages/_form.html.erb'

        copy_file \
          'messages/_message.html.erb',
          'app/views/messaged/messages/_message.html.erb'

        copy_file \
        'messages/create.turbostream.erb',
        'app/views/messaged/messages/create.turbostream.erb'

        copy_file \
          'messages/edit.html.erb',
          'app/views/messaged/messages/edit.html.erb'

        copy_file \
        'messages/index.html.erb',
        'app/views/messaged/messages/index.html.erb'

        copy_file \
          'messages/new.html.erb',
          'app/views/messaged/messages/new.html.erb'

        copy_file \
        'messages/show.html.erb',
        'app/views/messaged/messages/show.html.erb'
      end

      def copy_room_view_templates
        copy_file \
          'rooms/_form.html.erb',
          'app/views/messaged/rooms/_form.html.erb'

        copy_file \
          'rooms/_room.html.erb',
          'app/views/messaged/rooms/_room.html.erb'

        copy_file \
        'rooms/create.turbostream.erb',
        'app/views/messaged/rooms/create.turbostream.erb'

        copy_file \
          'rooms/edit.html.erb',
          'app/views/messaged/rooms/edit.html.erb'

        copy_file \
        'rooms/index.html.erb',
        'app/views/messaged/rooms/index.html.erb'

        copy_file \
          'rooms/new.html.erb',
          'app/views/messaged/rooms/new.html.erb'

        copy_file \
        'rooms/show.html.erb',
        'app/views/messaged/rooms/show.html.erb'
      end
    end
  end
end