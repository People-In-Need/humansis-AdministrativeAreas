require 'nokogiri'

def check_xml(file)
  codes = {}
  duplicates = []

  sample_data = File.open(file)
  parsed_info = Nokogiri::XML(sample_data)
  parsed_info.xpath("//*/@code").each do |node|
    code = node.to_s 
    if (codes.has_key?(code))
      duplicates << code
    else
      codes[code] = code
    end
  end
  return duplicates
end

correct_files = true

Dir.glob('./locations/*.xml') do |location_file|
  duplicates = check_xml(location_file)
  if (duplicates.length > 0)
    puts "#{location_file} has #{duplicates.length} duplicates: #{duplicates.join(', ')}"
    correct_files = false
  end
end

if (correct_files)
  exit 0
else
  exit 1
end