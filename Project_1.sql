/* Displaying table */

SELECT * FROM tax_lien.taxliendata;

/*ASSESSED VALUE MORE THAN 250000 AND LOCATED BLOCK AND LOT*/

select BLOCK, LOT,ASSESSED_VALUE from tax_lien.taxliendata where ASSESSED_VALUE >250000;

/* grouping by COUNCIL_DISTRICT AND GETTING SUM OF ASSESSED_VALUE */

select  COUNCIL_DISTRICT, sum(ASSESSED_VALUE) from tax_lien.taxliendata  group  by COUNCIL_DISTRICT;

/* Displaying only DETAIL LOCATED IN VALLEY COUNTY*/
select * from tax_lien.taxliendata where PROPERTY_ADDRESS like '%VALLEY%';

/* Listing ONLY VALUES WHERE THE BLOCK NUMBER IS BETWEEN 7000 to 9000 */
select * from tax_lien.taxliendata where BLOCK between 7000 and 9000;