wd = Dir.pwd
for logs in Dir["logs/*"]
    File.delete("#{wd}/#{logs}")
end