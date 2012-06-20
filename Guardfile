# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'minitest' do
  watch(%r|^test/(.*)\/?test_(.*)\.rb|)
  watch(%r{^models/(.+)\.rb$}) { |m| "test/models/test_#{m[1]}.rb" }
end
