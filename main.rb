require 'streamio-ffmpeg'
require 'fileutils'
require 'tempfile'

def screenshot
  current_path = File.expand_path('./movie.mp4')

  tempfile = Tempfile.open(['movie', '.jpg'])

  movie = FFMPEG::Movie.new(current_path)
  movie.screenshot(tempfile.path, resolution: '512x312', preserve_aspect_ratio: :width)

  FileUtils.cp(tempfile.path, File.expand_path('./public'))
  tempfile.unlink
end

def images
  Dir.chdir(File.expand_path('./public')) do
    Dir.glob('*.jpg')
  end
end
