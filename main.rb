# 読み込み部分
require 'streamio-ffmpeg'
require 'fileutils'
require 'tempfile'

# 処理部分
# version :screenshot do
#   process :screenshot
#   def full_filename(_for_file = model.logo.file)
#     'screenshot.jpg'
#   end
# end

def screenshot
  current_path = '/home/gou/ffmpeg/movie.mp4'
  current_path = File.expand_path('./movie.mp4')

  tempfile = Tempfile.open(['movie', '.jpg'])

  movie = FFMPEG::Movie.new(current_path)
  movie.screenshot(tempfile.path, resolution: '512x312', preserve_aspect_ratio: :width)
  # File.open(File.expand_path('./thumbnail.jpg'), 'w') do |f|
  #   f.write tempfile.read
  # end
  FileUtils.cp(tempfile.path, File.expand_path('./public'))
  tempfile.unlink

  # File.rename("#{current_path}.jpg", current_path)

  # File.delete(tmpfile)
end

def images
  Dir.chdir(File.expand_path('./public')) do
    Dir.glob('*.jpg')
  end
end
