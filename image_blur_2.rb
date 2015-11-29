class Image

  def initialize(org_array)
    @org_array = org_array
  end

  def blur
    i_array = Array.new

    i_count = 0
    j_count = 0

    @org_array.each do |x|
      j_array = Array.new(x.length)
      i_array << j_array
    end

    @org_array.each do |x|
      j_count = 0

      x.each do |y|
        if y == 1
          i_array[i_count][j_count] = 1

          if j_count - 1 >= 0 && j_count - 1 < x.length
            i_array[i_count][j_count - 1] = 1
          end

          if j_count + 1 >= 0 && j_count + 1 < x.length
            i_array[i_count][j_count + 1] = 1
          end

          if i_count - 1 >= 0 && i_count - 1 < @org_array.length
            i_array[i_count - 1][j_count] = 1
          end

          if i_count + 1 >= 0 && i_count + 1 < @org_array.length
            i_array[i_count + 1][j_count] = 1
          end
        end

        j_count = j_count + 1
      end
      i_count += 1
    end

    i_count = 0

    i_array.each do |x|
      j_count = 0
      x.each do |y|
        if y != 1
          i_array[i_count][j_count] = 0
        end
        j_count += 1
      end
      i_count += 1
    end

    return Image.new(i_array)
  end

  def output_image
   @org_array.each do |i|
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
puts " "
x = image.blur
x.output_image


