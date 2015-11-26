class Image

def initialize(iarray)
    @iarray = iarray
  end

  def output_image
    @iarray.each do |i|
      puts i.join
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image