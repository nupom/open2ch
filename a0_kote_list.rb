require 'open-uri'
#open2ch 名前欄の集計
#
# スレッド一覧先
url="http://hayabusa.open2ch.net/news4vip/subback.html"
#
# 一覧読みとり url→Array
w=open(url).read
ur=w.scan(/news4vip\/(.*)\/l50/)      #ｱﾄﾞﾚｽﾊﾞﾝｺﾞｳ
#
# 各スレ集計
urlbase="http://hayabusa.open2ch.net/news4vip/dat/"
cn=Hash.new(0)
0.upto(9){|n|                               #件数指定
   t="#{urlbase}#{ur[n][0]}.dat"                             
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
dn=cn.sort{|a,b|
   a[1] <=> b[1]
}
dn.reverse!
dn.each do |key,value|
   print "#{key}:#{value}\n"
end
#
