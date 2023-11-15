SELECT SYMBOL, PRICE, TIMESTAMP,QTY
FROM (
    SELECT 
        SYMBOL,
        PRICE,QTY,
        TIMESTAMP,
        ROW_NUMBER() OVER (PARTITION BY SYMBOL ORDER BY TIMESTAMP DESC) as row_num
    FROM stockexchangeprediction.StreamingCrypto.streaming
) AS ranked
WHERE row_num = 1