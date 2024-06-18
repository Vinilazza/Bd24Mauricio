-- A) Listagem de Aeronaves ordenadas por tipo

SELECT id_tipo_aeronave, Nome_Aeronave FROM aeroporto.aeronave;


-- B)  Relatório de Vôos das Aeronaves por período (dia/semana/mês);
SELECT
    YEAR(e.Horario_Partida_Prog) AS Ano,
    MONTH(e.Horario_Partida_Prog) AS Mes,
    DAY(e.Horario_Partida_Prog) AS Dia,
    a.Nome_Aeronave,
    COUNT(v.Id_Voos) AS Total_Voos
FROM
    voos v
JOIN
    escala e ON v.Id_Escala = e.Id_Escala
JOIN
    aeronave a ON v.Id_Aeronave = a.Id_Aeronave
GROUP BY
    Ano, Mes, dia, a.Nome_Aeronave
ORDER BY
    Ano, Mes,dia , a.Nome_Aeronave;

-- C) Listagem de vôos que fazem escala em um determinado local;
SELECT
    v.Id_Voos,
    ao.Nome_Aeroporto AS Aeroporto_Origem,
    ad.Nome_Aeroporto AS Aeroporto_Destino,
    e.Horario_Partida_Prog,
    e.Horario_Chegada_Prog,
    e.Horario_Partida_Real,
    e.Horario_Chegada_Real,
    ae.Nome_Aeroporto AS Aeroporto_Escala
FROM
    voos v
JOIN
    escala e ON v.Id_Escala = e.Id_Escala
JOIN
    aeroporto ao ON v.Id_Aeroporto_Origem = ao.Id_Aeroporto
JOIN
    aeroporto ad ON v.Id_Aeroporto_Destino = ad.Id_Aeroporto
JOIN
    aeroporto ae ON e.Id_Aeroporto = ae.Id_Aeroporto
WHERE
    ae.Nome_Aeroporto = 'Neon';

-- D) Exibição de poltronas disponíveis em um determinado vôo/avião;
SELECT 
    p.Id_Poltrona,
    p.Coluna,
    p.Fileira
FROM 
    poltrona p
LEFT JOIN 
    reserva r ON p.Id_Poltrona = r.Id_Poltrona AND r.Id_Aeronave = @Id_Aeronave AND r.Id_Escala = @Id_Escala
WHERE 
    r.Id_Reserva IS NULL;
