require 'filewatcher'

def red(mytext) ; "\e[31m#{mytext}\e[0m" ; end
def green(text) ; "\e[32m#{text}\e[0m" ; end

def movepictures
  `cd ~/Documents && mkdir pic`
  puts green("creating the mkdir folder")
  data = `cd ~/Downloads && ls`
  filearray = data.split("\n")
  filearray.each { |list|
    if list.include? ".png"
      hello = list.split(" ").join("\\ ")
      `mv ~/Downloads/#{hello} ~/Documents/pic/#{hello}`
    end
  }
end 

def watch
  FileWatcher.new(["~/Downloads/"]).watch() { |filename, event|
    puts  "Added file: " + red(filename) if (event == :new)
    if(filename.include? ".png") 
      puts green("moving #{filename}")

      movepictures

    end
  }
end
movepictures
watch