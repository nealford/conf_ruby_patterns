open(image_file) do |in|
  case identify_image_format(in)
  when "JPG"
    in.extend(JPGMethods) # readframe, readsof
  when "TIFF"
    in.extend(TIFFMethods) # readlong, readdirent
  end
end

