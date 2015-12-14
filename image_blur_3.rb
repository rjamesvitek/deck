class Image

  attr_accessor :distance

  def initialize(org_array)
    @org_array = org_array
  end

  def blur(distance)
    mah = distance
    i_array = Array.new

    i_count = 0
    j_count = 0

    @org_array.each do |x|
      j_array = Array.new(x.length)
      i_array << j_array
    end

    @org_array.each do |x|
      j_count = 0
      blurlength = mah * 2 + 1

      x.each do |y|
        startpt = j_count - mah
        pt = startpt
        if y == 1
          counter = 1
          while counter <= blurlength
            if pt >= 0 && pt <= x.length - 1
              i_array[i_count][pt] = 1
            end
            counter += 1
            pt += 1
          end

          i_blurlength = blurlength
          i_startpt = startpt
          i_counter = 1
          while i_counter <= mah
            i_startpt += 1
            i_blurlength -= 2
            counter = 1
            pt = i_startpt
            if i_count - i_counter >= 0
              while counter <= i_blurlength
                if pt >= 0 && pt <= x.length - 1
                  i_array[i_count - i_counter][pt] = 1
                end
                counter += 1
                pt += 1
              end
            end
            i_counter += 1
          end

          i_blurlength = blurlength
          i_startpt = startpt
          i_counter = 1
          while i_counter <= mah
            i_startpt += 1
            i_blurlength -= 2
            counter = 1
            pt = i_startpt
            if i_count + i_counter <= i_array.length - 1
              while counter <= i_blurlength
                if pt >= 0 && pt <= x.length - 1
                  i_array[i_count + i_counter][pt] = 1
                end
                counter += 1
                pt += 1
              end
            end
            i_counter += 1
          end

        end
        j_count += 1
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
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])

image.output_image
puts " "
x = image.blur(3)
x.output_image


