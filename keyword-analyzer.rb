# encoding: utf-8

require 'csv'
require 'MeCab'


file = './20130501.csv'

data = CSV.read(file)

mecab = MeCab::Tagger.new()

n_data = Array.new

i = 0
data.each do |data|
  
  node = mecab.parseToNode(data[0])
  while node do
    n_data[i] = Array.new
    n_data[i].push(node)
    n_data[i].push(data[1])
    n_data[i].push(data[2])
    i += 1
    node = node.next
  end
end

puts n_data[0][0]
puts n_data[0][1]
puts n_data[0][2]

