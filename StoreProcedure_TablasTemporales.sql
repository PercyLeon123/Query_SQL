
--create procedure sp_Test
--@coAgen int
--as	
--	-- #tempCajero temporal de la tabla cajero
--	SELECT cagencia,mireg,ccajero, nomcajero,senlinea,tDiaEfec, numero, tUltAten, nTickAsignados,cSuspenso
--	,noperacion,ISNULL(hInisuspenso, getdate()) as hInisuspenso ,ISNULL(hing, getdate()) as hing ,ISNULL(hllamada, getdate()) as hllamada
--	,prefijo,cstatpto,login,cPtoAten into #tempCajero FROM cajero WHERE  cagencia = @coAgen and ccajero > 0 AND ccajero< 100000 and cactividad<>'A'
--	-- #tempMovicajero temporal de la tabla Movicajero
--	SELECT getdate() as horaactual,cagencia,isnull(hingreso,getdate()) as hingreso ,ISNULL(hsalida,getdate()) as hsalida 
--	,isnull(login,'     ') as login,cptoaten,ccajero,sptoaten into #tempMovicajero FROM Movicajero WHERE cagencia = @coAgen and hingreso > CONVERT(VARCHAR, GETDATE(), 112)
--	-- #tempSuspenso temporal de la tabla Suspenso
--	SELECT cagencia,tSuspensoAceptable ,dSuspenso ,cSuspenso into #tempSuspenso FROM Suspenso WHERE cagencia = @coAgen and cactividad <> 'A'
--	-- #tempPtoaten temporal de la tabla ptoaten
--	SELECT cagencia,cptoaten,ptoaten,cptoatenp into #tempPtoaten FROM ptoaten  WHERE cagencia = @coAgen and cactividad <> 'A' and cptoaten<>0
--	-- #tempPtoAtenPerf temporal de la tabla PtoAtenPerf
--	SELECT cagencia, descripC, cptoaten into #tempPtoAtenPerf FROM PtoAtenPerf WHERE cagencia = @coAgen and cactividad<>'A' and cptoaten<>0

--	-- Ejecutar QUERY TEST
--	select * from #tempCajero as c 
--	left join #tempMovicajero as m on c.cagencia = m.cagencia and c.ccajero = m.ccajero 
--	left join #tempSuspenso as s on c.cagencia = s.cagencia and c.cSuspenso = s.cSuspenso
--	left join #tempPtoaten as p on p.cagencia = c.cagencia and m.cptoaten = p.cptoaten
--	left join #tempPtoAtenPerf as pp on pp.cagencia = c.cagencia and pp.cptoaten = p.cptoaten
--	where c.mireg <> ''


--	-- Eliminar Temporales
--	drop table #tempCajero
--	drop table #tempMovicajero
--	drop table #tempSuspenso
--	drop table #tempPtoaten
--	drop table #tempPtoAtenPerf
--	go


exec sp_Test 593

--drop procedure sp_Test
