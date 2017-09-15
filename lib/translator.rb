# require modules here
require "yaml"
def load_library(file_path)
  hash = {"get_meaning" => {}, "get_emoticon"=> {}}
  library = YAML.load_file(file_path)
  library.each do |emotion, array|
    hash["get_meaning"][library[emotion][1]] = emotion
    hash["get_emoticon"][library[emotion][0]] = [library[emotion][1]].join
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  if hash["get_emoticon"].has_key?(emoticon)
    return hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  if hash["get_meaning"].has_key?(emoticon)
    return hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
