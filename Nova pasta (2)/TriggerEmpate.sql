ALTER TABLE tabela_classificacao
ADD COLUMN Saldo_Gols INT DEFAULT 0,
ADD COLUMN Gols_Marcados INT DEFAULT 0,
ADD COLUMN Gols_Sofridos INT DEFAULT 0;

ALTER TABLE resultado 
ADD COLUMN Gols_Marcados INT DEFAULT 0,
ADD COLUMN Gols_Sofridos INT DEFAULT 0;

// Insert
INSERT INTO resultado (ID_Partida, Pontos_Conquistados, Status_Partida, Gols_Marcados, Gols_Sofridos)
VALUES 
    (1, 3, 'V', 3, 1),  -- Vitória por 3x1
    (2, 1, 'E', 2, 2),  -- Empate por 2x2
    (3, 0, 'D', 1, 4);  -- Derrota por 1x4

// Verificação da tabela
SELECT * 
FROM tabela_classificacao
ORDER BY 
    Pontos_Totais DESC,       -- Critério 1: Pontos
    Vitorias DESC,            -- Critério 2: Número de vitórias
    Saldo_Gols DESC,          -- Critério 3: Saldo de gols
    Gols_Marcados DESC;       -- Critério 4: Gols marcados

// Tabelas por ordenação
SELECT * FROM tabela_classificacao
ORDER BY Pontos_Totais DESC, Vitorias DESC, Saldo_Gols DESC, Gols_Marcados DESC;


DELIMITER $$

CREATE TRIGGER atualizar_classificacao
AFTER INSERT ON resultado
FOR EACH ROW
BEGIN
    -- Calcula o saldo de gols
    DECLARE Saldo INT;
    SET Saldo = NEW.Gols_Marcados - NEW.Gols_Sofridos;

    -- Verifica se já existe um registro para o ID_Resultado na classificação
    IF EXISTS (
        SELECT 1 
        FROM tabela_classificacao 
        WHERE ID_Resultado = NEW.ID_Resultado
    ) THEN
        -- Atualiza o registro existente
        UPDATE tabela_classificacao
        SET 
            Pontos_Totais = Pontos_Totais + NEW.Pontos_Conquistados,
            Vitorias = Vitorias + IF(NEW.Status_Partida = 'V', 1, 0),
            Empates = Empates + IF(NEW.Status_Partida = 'E', 1, 0),
            Derrotas = Derrotas + IF(NEW.Status_Partida = 'D', 1, 0),
            Gols_Marcados = Gols_Marcados + NEW.Gols_Marcados,
            Gols_Sofridos = Gols_Sofridos + NEW.Gols_Sofridos,
            Saldo_Gols = Saldo_Gols + Saldo
        WHERE ID_Resultado = NEW.ID_Resultado;
    ELSE
        -- Insere um novo registro na tabela_classificacao
        INSERT INTO tabela_classificacao (
            ID_Resultado, Pontos_Totais, Vitorias, Empates, Derrotas, 
            Gols_Marcados, Gols_Sofridos, Saldo_Gols
        )
        VALUES (
            NEW.ID_Resultado,
            NEW.Pontos_Conquistados,
            IF(NEW.Status_Partida = 'V', 1, 0),
            IF(NEW.Status_Partida = 'E', 1, 0),
            IF(NEW.Status_Partida = 'D', 1, 0),
            NEW.Gols_Marcados,
            NEW.Gols_Sofridos,
            Saldo
        );
    END IF;
END$$

DELIMITER ;
