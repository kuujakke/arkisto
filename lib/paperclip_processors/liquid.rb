module Paperclip
  class Liquid < Thumbnail
    def transformation_command
      trans = []
      trans << "-resize" << %["#{@target_geometry}"]
      trans << "-liquid-rescale" << %["#{@target_geometry}"]
      trans
    end
  end
end