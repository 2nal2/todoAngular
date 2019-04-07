json.id @customer.id
json.province_id @customer.province_id
json.country @customer.province.country_id
json.phone @customer.phone
json.email @customer.email
json.preferential_price @customer.preferential_price
json.discount @customer.discount
json.exonerate_iva @customer.exonerate_iva
json.exonerate_1 @customer.exonerate_1
json.exonerate_2 @customer.exonerate_2
json.credit_limit @customer.credit_limit
json.credit_time_limit @customer.credit_time_limit
json.interest_rate @customer.interest_rate
json.direction @customer.direction
json.comments @customer.comments
json.status @customer.status
json.type_customer @customer.type_customer
json.person @customer.person if @customer.type_customer == 'n'
json.organization @customer.organization if @customer.type_customer == 'j'