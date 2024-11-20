-- Vitória
INSERT INTO resultado (ID_Partida, Pontos_Conquistados, Status_Partida)
VALUES 
    (1, 3, 'V');

-- Empate
INSERT INTO resultado (ID_Partida, Pontos_Conquistados, Status_Partida)
VALUES 
    (2, 1, 'E');

-- Derrota
INSERT INTO resultado (ID_Partida, Pontos_Conquistados, Status_Partida)
VALUES 
    (3, 0, 'D');


SELECT * FROM tabela_classificacao;

DELIMITER $$

CREATE TRIGGER atualizar_classificacao
AFTER INSERT ON resultado
FOR EACH ROW
BEGIN
    -- Verifica se já existe um registro na tabela_classificacao para o mesmo resultado
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
            Derrotas = Derrotas + IF(NEW.Status_Partida = 'D', 1, 0)
        WHERE ID_Resultado = NEW.ID_Resultado;
    ELSE
        -- Insere um novo registro na classificação
        INSERT INTO tabela_classificacao (
            ID_Resultado, Pontos_Totais, Vitorias, Empates, Derrotas
        )
        VALUES (
            NEW.ID_Resultado,
            NEW.Pontos_Conquistados,
            IF(NEW.Status_Partida = 'V', 1, 0),
            IF(NEW.Status_Partida = 'E', 1, 0),
            IF(NEW.Status_Partida = 'D', 1, 0)
        );
    END IF;
END$$

DELIMITER ;


