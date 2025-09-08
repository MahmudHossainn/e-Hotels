--Query 2: Each hotel chain and the ammount of phones and email they have. 
WITH A AS ( --A is all hotels and their emails and phones, including ones which don't have a phone and/or email. 
    SELECT hotel_chain.chain_name, email, phone
    FROM "ProjectPrototype".hotel_chain
    LEFT JOIN "ProjectPrototype".chain_email 
        ON chain_email.chain_name = hotel_chain.chain_name
    LEFT JOIN "ProjectPrototype".chain_phone 
        ON chain_phone.chain_name = hotel_chain.chain_name
)
SELECT A.chain_name, COUNT(DISTINCT email) AS email_count, COUNT(DISTINCT phone) AS phone_count FROM A
GROUP BY A.chain_name
