 
Select u_storeID,u_storeLink,
REPLACE(REPLACE(REPLACE(eventName,'MANAGE_PLUGINS-CLICK--',''),'MANAGE_PLUGINS-INSTALL--',''),'MANAGE_PLUGINS-UNINSTALL--','') AS plugin_id,
sum(case when eventName  like 'MANAGE_PLUGINS-CLICK%' then 1 else 0 end) as "Landed_on_page",
sum(case when eventName  like 'MANAGE_PLUGINS-INSTALL%' then 1 else 0 end) as "Installed",
sum(case when eventName  like 'MANAGE_PLUGINS-UNINSTALL%' then 1 else 0 end) as "Uninstalled"

from events
where d_source != 'BUYER-WEB'
and eventName like '%MANAGE_PLUGINS%'
and u_storeID is not null
GROUP by 1,2,3
