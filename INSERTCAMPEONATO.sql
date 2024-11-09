INSERT INTO modalidade (Nome, Tipo) VALUES 
('Futebol', 'Equipe'),
('Vôlei', 'Equipe');

-- Inserir fases
INSERT INTO fase (Nome, Tipo) VALUES 
('Fase de Grupos', 'Pontos Corridos'),
('Quartas de Final', 'Eliminatória'),
('Semifinal', 'Eliminatória'),
('Final', 'Eliminatória');

-- Inserir grupos
INSERT INTO grupo (Nome, ID_Fase) VALUES 
('Grupo A', 1),
('Grupo B', 1);

INSERT INTO torneio (Nome, Data_Inicio, Data_Fim, Formato, id_modalide) VALUES 
('Torneio de Futebol', '2024-03-01', '2024-12-31', 'Pontos Corridos', 1);

-- Inserir times
INSERT INTO time (Nome, País, ID_Modalidade) VALUES 
('Time A', 'Brasil', 1),
('Time B', 'Argentina', 1),
('Time C', 'Chile', 1),
('Time D', 'Uruguai', 1),
('Time E', 'Peru', 1),
('Time F', 'Colômbia', 1),
('Time G', 'Equador', 1),
('Time H', 'Paraguai', 1);

-- Inserir partidas
INSERT INTO partida (Data, Local, ID_Torneio) VALUES 
('2024-01-15', 'Estádio 1', 1),
('2024-01-16', 'Estádio 2', 1),
('2024-01-17', 'Estádio 3', 1),
('2024-01-18', 'Estádio 4', 1);

-- Inserir resultados das partidas
INSERT INTO resultado (ID_Partida, Pontos_Conquistados, Status_Partida) VALUES 
(1, 3, 'V'), -- Vitoria
(1, 0, 'D'), -- Derrota
(2, 3, 'V'), -- Vitoria
(2, 0, 'D'); -- Derrota

INSERT INTO tabela_classificacao (ID_Resultado, Pontos_Totais, Vitorias, Empates, Derrotas, Posicao, id_fase) VALUES 
(1, 3, 1, 0, 0, 1, 1),
(2, 0, 0, 0, 1, 2, 1),
(3, 3, 1, 0, 0, 1, 1),
(4, 0, 0, 0, 1, 2, 1);


-- Modalidade
INSERT INTO modalidade (Nome, Tipo) VALUES ('Futebol', 'Equipe');

-- Torneio
INSERT INTO torneio (Nome, Data_Inicio, Data_Fim, Formato, id_modalide) VALUES ('Campeonato de Futebol', '2024-11-01', '2024-11-30', 'Pontos Corridos', 1);

-- Fase
INSERT INTO fase (Nome, Tipo) VALUES ('Primeira Fase', 'Pontos Corridos');

-- Grupo
INSERT INTO grupo (Nome, ID_Fase) VALUES ('Grupo A', 1);


-- Times
INSERT INTO time (Nome, País, ID_Modalidade) VALUES 
('Time A', 'Brasil', 1),
('Time B', 'Argentina', 1);

-- Partida
INSERT INTO partida (Data, Local, ID_Torneio) VALUES ('2024-11-05', 'Estádio Principal', 1);

-- Resultado para o Time A (Empate)
INSERT INTO resultado (ID_Partida, Pontos_Conquistados, Status_Partida) VALUES 
(1, 1, 'E');

-- Resultado para o Time B (Empate)
INSERT INTO resultado (ID_Partida, Pontos_Conquistados, Status_Partida) VALUES 
(1, 1, 'E');

-- Atualizar Classificação para o Time A e Time B
INSERT INTO tabela_classificacao (ID_Resultado, Pontos_Totais, Vitorias, Empates, Derrotas, id_fase) VALUES 
(1, 1, 0, 1, 0, 1),  -- Time A
(2, 1, 0, 1, 0, 1);  -- Time B
