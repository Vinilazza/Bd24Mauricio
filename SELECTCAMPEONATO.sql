
SELECT r.ID_Partida, t.Nome AS Time, r.Pontos_Conquistados, r.Status_Partida 
FROM resultado r
JOIN time t ON r.ID_Resultado = t.ID_Time
WHERE r.ID_Partida = 1;

SELECT t.Nome AS Time, c.Pontos_Totais, c.Vitorias, c.Empates, c.Derrotas 
FROM tabela_classificacao c
JOIN time t ON c.ID_Resultado = t.ID_Time;


// Número de Vitórias

SELECT 
    t.Nome AS Time,
    c.Pontos_Totais,
    c.Vitorias,
    c.Empates,
    c.Derrotas 
FROM 
    tabela_classificacao c
JOIN 
    time t ON c.ID_Resultado = t.ID_Time
ORDER BY 
    c.Vitorias DESC, -- Ordenação principal por número de vitórias (do maior para o menor)
    c.Pontos_Totais DESC; 
    
    
   //Pontos Totais 
    
    SELECT 
    t.Nome AS Time,
    c.Pontos_Totais,
    c.Vitorias,
    c.Empates,
    c.Derrotas 
FROM 
    tabela_classificacao c
JOIN 
    time t ON c.ID_Resultado = t.ID_Time
ORDER BY 
    c.Pontos_Totais DESC, -- Ordenação principal por pontos totais (do maior para o menor)
    c.Vitorias DESC; -- Ordenação secundária por vitórias em caso de empate de pontos
