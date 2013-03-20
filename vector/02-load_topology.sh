if [ -e nodes.csv ]; then vwload -H -f "," -t nodes vw_geo nodes.csv; fi
if [ -e edges.csv ]; then vwload -H -f "," -t edges vw_geo edges.csv; fi
if [ -e faces.csv ]; then vwload -H -f "," -t faces_tin vw_geo faces.csv; fi 
