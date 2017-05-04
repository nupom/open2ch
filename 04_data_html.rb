ff=File.open("test.html",'w')

html=<<"EOS"
<html>
<head>
<title="test">
</head>
<body>
EOS
#
html_end=<<"EOS"
</body>
</html>
EOS


ff.puts(html)

File.open("test.txt"){|fr|
     fr.each{|ln|
         t=ln.split(/,/)
         ff.puts('<img src="'+t[2].chomp+'" width="100" height="100" alt="'+t[0]+'_'+t[1]+'" title="'+t[0]+'_'+t[1]+'">')
      }
}


ff.puts(html_end)

ff.close

