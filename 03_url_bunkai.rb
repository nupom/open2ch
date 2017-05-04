require 'open-uri'
urlbase="http://hayabusa.open2ch.net/test/read.cgi/news4vip/"
tt=[1426227723,1428965542,1431793014,1434990047,1440072764,1443530022,1448193567,1454688593,1465398724,1474016219]

datafolder="url_data/"   #ﾀﾞｳﾝﾛｰﾄﾞﾃﾞｰﾀﾌｫﾙﾀﾞ(ｻｸｾｲｼﾃｶﾗ)

=begin
# 連続ダウンロード
tt.each{|w|
   ww=w.to_s
   File.write(datafolder+ww,open(urlbase+ww+"/").read)
}
=end

# ファイル名Array
fmeis=[]
Dir.foreach(datafolder){|t|
   unless t.start_with?(".") then
      fmeis.push t
   end
}

# 文字列切り出し
def kiri(w,kubun)    #(対象文字列,区分)
   ret=nil
   #
   if kubun=="no" then          #ﾚｽno
      ps=w.index('<dt res="')
      pe=w.index('"',ps+9) if ps
      return w[ps+9,pe-ps-9] if ps
   end
   #
   if kubun=="imgur" then       #imgur
      ps=w.index('href=http://imgur.com/')
      pe=w.index('>',ps) if ps
      return w[ps+5,pe-ps-5] if ps
   end
   #
   if kubun=="img" then         #img
      ps=w.index('href=http://img.open2ch.net/p/')
      pe=w.index('>',ps) if ps
      return w[ps+5,pe-ps-5] if ps
   end
   #
   return ret
end

t_no=""     #ｽﾚno
res_no=""   #ﾚｽno
ff = File.open('test.txt','a')
fmeis.each{|f|
    t_no=f
    File.foreach(datafolder+f,encoding:'UTF-8:UTF-8'){|w|
       a=kiri(w,"no")
       res_no=a if a
       #
       a=kiri(w,"imgur")
       ff.puts t_no+","+res_no+","+a if a
       #
       a=kiri(w,"img")
       ff.puts t_no+","+res_no+","+a if a
    }
    
  #  break  #テスト
}
ff.close

