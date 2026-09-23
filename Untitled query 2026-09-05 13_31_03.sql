#filter nama unik pelanggan
select distinct customer_name
from showroom.data10cabang;

#rekap transaksi kredit
select order_id, branch, total_sales
from showroom.data10cabang
where payment_type = 'Kredit';

select * 
from showroom.data10cabang
order by quantity desc
limit 5;

#MODEL MOBI HITAM 
select distinct product_name
from showroom.data10cabang
where color = 'Hitam Metalik';

#komposisi metode
select payment_type, COUNT(*) AS jumlah_transaksi
from showroom.data10cabang
group by payment_type
order by payment_type desc;

#6 
SELECT 
  category,
  AVG(discount) AS rata_rata_diskon
FROM showroom.data10cabang
GROUP BY category
ORDER BY rata_rata_diskon DESC;

#7
SELECT 
  branch,
  SUM(total_sales) AS total_pendapatan
FROM showroom.data10cabang
GROUP BY branch
HAVING total_pendapatan > 50000000000
ORDER BY total_pendapatan DESC;



#Investigasi Diskon
SELECT 
  order_id,
  product_name, 
  discount
FROM showroom.data10cabang
WHERE discount > (
  SELECT AVG(discount) FROM showroom.data10cabang
);


#9
SELECT 
  tabel_filter.category,
  AVG(tabel_filter.total_sales) AS rata_rata_pendapatan
FROM (
  SELECT category, total_sales 
  FROM showroom.data10cabang
  WHERE status = 'completed'
) AS tabel_filter
GROUP BY tabel_filter.category;

#10
WITH hitung_transaksi AS (
  SELECT 
    product_name,
    COUNT(*) AS total_terjual
  FROM showroom.data10cabang
  GROUP BY product_name
)
SELECT 
  product_name,
  total_terjual
FROM hitung_transaksi
ORDER BY total_terjual DESC
LIMIT 3;



