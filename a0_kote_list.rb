require 'open-uri'
#open2ch 名前欄の集計
#
# スレッド一覧先
url="http://hayabusa.open2ch.net/news4vip/subback.html"
#
# 一覧読みとり url→Array
w=open(url).read
ur=[]   #ｱﾄﾞﾚｽﾊﾞﾝｺﾞｳ
w.scan(/news4vip\/(.*)\/l50/){|m|
   ur.push m
}
#
# 各スレ集計
urlbase="http://hayabusa.open2ch.net/news4vip/dat/"
cn=Hash.new(0)
0.upto(499){|n|
   t="#{urlbase}#{ur[n][0]}.dat"                             ###?
   puts t
   w=open(t).read
   gy=w.split("\n")     #ｷﾞｮｳ
   gy.each{|gg|
      km=gg.split("<>") #ｺｳﾓｸ
      cn[km[0]]+=1
   }
}
#
# 表示
cn.sort{|a,b|                                                  ###?
   a[1] <=> b[1]
}.each do |key,value|
   print "#{key}:#{value}\n"
end
#
