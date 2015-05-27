require 'cuba'
require 'mote'
require 'mote/render'

Cuba.plugin(Mote::Render)

Cuba.define do
  on root do
    res.write('Hello World!')
  end
end