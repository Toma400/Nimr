wd = Dir.pwd
for log in Dir["logs/*"]
    if not log.include? ".gitignore"
        File.delete("#{wd}/#{log}")
    end
end