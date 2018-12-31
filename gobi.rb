require 'mecab'
require 'natto'

class Gobi
  def self.add_gobi(str)
    nm = Natto::MeCab.new
    result = ""
    flag = false
    nm.parse(str) do |n|
      result += 'ぷり' if flag && n.feature.split(',')[0] != '名詞' && n.feature.split(',')[0] != '助動詞'
      flag = false
      flag = true if n.feature.split(',')[0] == '助動詞'
      result += "#{n.surface}"
    end
    result
  end
end
