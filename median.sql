SELECT round(AVG(dd.lat_n),4)
FROM (
SELECT lat_n, @rownum:=@rownum+1 as `row_number`, @total_rows:=@rownum
  FROM station, (SELECT @rownum:=0) as a
  ORDER BY lat_n
) as dd
WHERE dd.row_number IN ( FLOOR((@total_rows+1)/2), FLOOR((@total_rows+2)/2) );