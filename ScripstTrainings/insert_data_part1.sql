
-- ========================================
-- TRAININGS Parte 1
-- ========================================

INSERT INTO trainingApp_training (
    name_training, pub_date, modificationDate, difficulty, estimatedDuration, 
    attempts_allowed, state_training, name_training_en, name_training_es
) VALUES
('Entrenamiento de muestra', '2024-04-24 17:16:05.850594', '2024-04-24 18:26:40.580825', 'Inicial', 15, 50, 'Activo', 'Sample Training', 'Entrenamiento de muestra'),
('Funciones Matemáticas', '2024-04-25 13:07:02.257531', '2024-05-28 14:33:47.860726', 'Inicial', 20, 5, 'Activo', 'Mathematical Functions', 'Funciones Matemáticas'),
('Funciones Matemáticas - Ejercitación', '2024-04-25 13:08:58.386107', '2024-06-27 12:15:58.455465', 'Intermedio', 15, 4, 'Activo', 'Mathematical Functions - Practice', 'Funciones Matemáticas - Ejercitación'),
('Funciones + Ruido', '2024-05-31 22:13:04.468458', '2024-06-05 15:29:50.881649', 'Intermedio', 10, 8, 'Activo', 'Functions + Noise', 'Funciones + Ruido');

-- ========================================
-- BLOCKS 
-- ========================================

INSERT INTO trainingApp_block (
    name_block, description, estimed_duration_block, state_block, training_id,
    name_block_en, name_block_es, description_en, description_es
) VALUES
-- Para Training "Entrenamiento de muestra" 
('Bloque muestra', 'Bloque para mostrar la dinámica de los entrenamientos', 15, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento de muestra'), 'Sample Block', 'Bloque muestra', 'Block to show training dynamics', 'Bloque para mostrar la dinámica de los entrenamientos'),

-- Para Training "Funciones Matemáticas" 
('Funciones Tipo 1', 'Funciones lineales', 10, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Funciones Matemáticas'), 'Type 1 Functions', 'Funciones Tipo 1', 'Linear functions', 'Funciones lineales'),
('Funciones Tipo 2', 'Funciones curvas: polinómicas y trigonométricas', 10, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Funciones Matemáticas'), 'Type 2 Functions', 'Funciones Tipo 2', 'Curved functions: polynomial and trigonometric', 'Funciones curvas: polinómicas y trigonométricas'),

-- Para Training "Funciones Matemáticas - Ejercitación" 
('Funciones Tipo 3', 'Combinación de funciones', 10, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Funciones Matemáticas - Ejercitación'), 'Type 3 Functions', 'Funciones Tipo 3', 'Function combinations', 'Combinación de funciones'),
('Funciones Tipo 4', 'Funciones combinadas: lineales + curvas', 10, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Funciones Matemáticas - Ejercitación'), 'Type 4 Functions', 'Funciones Tipo 4', 'Combined functions: linear + curved', 'Funciones combinadas: lineales + curvas'),

-- Para Training "Funciones + Ruido" 
('Funciones tipo 1', 'funciones lineales con ruido', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Funciones + Ruido'), 'Type 1 functions', 'Funciones tipo 1', 'linear functions with noise', 'funciones lineales con ruido'),
('Funciones tipo 2', 'Funciones curvas con ruido', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Funciones + Ruido'), 'Type 2 functions', 'Funciones tipo 2', 'Curved functions with noise', 'Funciones curvas con ruido');

-- ========================================
-- DEPLOYS 
-- ========================================

INSERT INTO trainingApp_deploy (
    block_id, question, deploy_image, deploy_sound,
    question_en, question_es
) VALUES
-- Para Block "Bloque muestra"
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque muestra'), 'Ha detectado sonido?', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/noise.wav', 'Have you detected sound?', 'Ha detectado sonido?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque muestra'), 'Ha detectado sonido?', 'trainingApp/images/SNR40.300-320.png', 'trainingApp/sound/sound-noise.300-320.SNR40.wav', 'Have you detected sound?', 'Ha detectado sonido?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque muestra'), 'Ha detectado sonido?', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/sound-noise.260-280.SNR85.wav', 'Have you detected sound?', 'Ha detectado sonido?'),

-- Para Block "Funciones Tipo 1"
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 1'), 'Identifica la función mostrada como:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/fc-constante_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 1'), 'Identifica la función mostrada como:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/decreciente_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 1'), 'Identifica la función mostrada como:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/triangular_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 1'), 'Identifica la función mostrada como:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/creciente_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 1'), 'Identifica la función mostrada como:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/sierra_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 1'), 'Identifica la función mostrada como:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/cuadrada_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),

-- Para Block "Funciones Tipo 2"
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 2'), 'Identifica la función mostrada como:', 'trainingApp/images/cuadratica2plot.png', 'trainingApp/sound/cuadratica2_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 2'), 'Identifica la función mostrada como:', 'trainingApp/images/cubicaplot.png', 'trainingApp/sound/cubica_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 2'), 'Identifica la función mostrada como:', 'trainingApp/images/senoplot.png', 'trainingApp/sound/seno_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 2'), 'Identifica la función mostrada como:', 'trainingApp/images/cuadraticaplot.png', 'trainingApp/sound/cuadratica_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 2'), 'Identifica la función mostrada como:', 'trainingApp/images/cosenoplot.png', 'trainingApp/sound/coseno_sound.mp3', 'Identify the function shown as:', 'Identifica la función mostrada como:'),

-- Para Block "Funciones Tipo 3"
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 3'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/Decr-Cte-Decrplot.png', 'trainingApp/sound/Decr-Cte-Decr_sound.wav', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 3'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/Cte-Cre-Decr-Cteplot.png', 'trainingApp/sound/Cte-Cre-Decr-Cte_sound.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 3'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/Cte-Decr-Cre_sound.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 3'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/Cre-Cte-Decr_sound.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),

-- Para Block "Funciones Tipo 4"
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 4'), 'Lo que escuchó fue una combinación de funciones:', 'trainingApp/images/Cubica-Cte-Decrplot.png', 'trainingApp/sound/Cubica-Cte-Decr_sound.mp3', 'What you heard was a combination of functions:', 'Lo que escuchó fue una combinación de funciones:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 4'), 'Lo que escuchó fue una combinación de funciones:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/Decr-Cte-Cre_sound.mp3', 'What you heard was a combination of functions:', 'Lo que escuchó fue una combinación de funciones:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 4'), 'Lo que escuchó fue una combinación de funciones:', 'trainingApp/images/Coseno-Cre-Decrplot.png', 'trainingApp/sound/Coseno-Cre-Decr_sound.mp3', 'What you heard was a combination of functions:', 'Lo que escuchó fue una combinación de funciones:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones Tipo 4'), 'Lo que escuchó fue una combinación de funciones:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/Cre-Seno-Cte_sound.mp3', 'What you heard was a combination of functions:', 'Lo que escuchó fue una combinación de funciones:'),

-- Para Block "Funciones tipo 1" (con ruido)
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 1' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/creciente_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 1' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/fc-constanteplot_noise.png', 'trainingApp/sound/fc-constante_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 1' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/triangular_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 1' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/decreciente_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 1' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/sin_imagen.png', 'trainingApp/sound/cuadrada_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 1' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/sierraplot_noise.png', 'trainingApp/sound/sierra_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:'),

-- Para Block "Funciones tipo 2" (con ruido)
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 2' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/cosenoplot_noise.png', 'trainingApp/sound/coseno_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 2' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/cubicaplot_noise.png', 'trainingApp/sound/cubica_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 2' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/cuadraticaplot_noise.png', 'trainingApp/sound/cuadratica_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 2' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/senoplot_noise.png', 'trainingApp/sound/seno_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones tipo 2' AND description LIKE '%ruido%'), 'Lo que escuchó fue una función:', 'trainingApp/images/cuadratica2plot_noise.png', 'trainingApp/sound/cuadratica2_noise.mp3', 'What you heard was a function:', 'Lo que escuchó fue una función:');

-- ========================================
-- CHOICES 
-- ========================================

INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'si', id, 'yes', 'si', FALSE FROM trainingApp_deploy WHERE question = 'Ha detectado sonido?' AND deploy_sound = 'trainingApp/sound/noise.wav';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'no', id, 'no', 'no', TRUE FROM trainingApp_deploy WHERE question = 'Ha detectado sonido?' AND deploy_sound = 'trainingApp/sound/noise.wav';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'tal vez', id, 'maybe', 'tal vez', FALSE FROM trainingApp_deploy WHERE question = 'Ha detectado sonido?' AND deploy_sound = 'trainingApp/sound/noise.wav';

-- Para deploy con sound-noise.300-320.SNR40.wav (respuesta correcta: "si")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'si', id, 'yes', 'si', TRUE FROM trainingApp_deploy WHERE question = 'Ha detectado sonido?' AND deploy_sound = 'trainingApp/sound/sound-noise.300-320.SNR40.wav';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'no', id, 'no', 'no', FALSE FROM trainingApp_deploy WHERE question = 'Ha detectado sonido?' AND deploy_sound = 'trainingApp/sound/sound-noise.300-320.SNR40.wav';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'tal vez', id, 'maybe', 'tal vez', FALSE FROM trainingApp_deploy WHERE question = 'Ha detectado sonido?' AND deploy_sound = 'trainingApp/sound/sound-noise.300-320.SNR40.wav';

-- Para deploy con sound-noise.260-280.SNR85.wav (respuesta correcta: "si")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'si', id, 'yes', 'si', TRUE FROM trainingApp_deploy WHERE question = 'Ha detectado sonido?' AND deploy_sound = 'trainingApp/sound/sound-noise.260-280.SNR85.wav';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'no', id, 'no', 'no', FALSE FROM trainingApp_deploy WHERE question = 'Ha detectado sonido?' AND deploy_sound = 'trainingApp/sound/sound-noise.260-280.SNR85.wav';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'tal vez', id, 'maybe', 'tal vez', FALSE FROM trainingApp_deploy WHERE question = 'Ha detectado sonido?' AND deploy_sound = 'trainingApp/sound/sound-noise.260-280.SNR85.wav';

-- Choices para deploys de identificación de funciones
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_sound.mp3'), 'Increasing', 'Creciente', FALSE),
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_sound.mp3'), 'Sawtooth', 'Sierra', FALSE),
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_sound.mp3'), 'Constant', 'Constante', TRUE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_sound.mp3'), 'Triangular', 'Triangular', FALSE),
('Pulso', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_sound.mp3'), 'Pulse', 'Pulso', FALSE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_sound.mp3'), 'Decreasing', 'Decreciente', FALSE);

-- Choices para función decreciente
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_sound.mp3'), 'Sawtooth', 'Sierra', FALSE),
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_sound.mp3'), 'Increasing', 'Creciente', FALSE),
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_sound.mp3'), 'Constant', 'Constante', FALSE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_sound.mp3'), 'Triangular', 'Triangular', FALSE),
('Pulso', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_sound.mp3'), 'Pulse', 'Pulso', FALSE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_sound.mp3'), 'Decreasing', 'Decreciente', TRUE);

-- Choices para función triangular
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_sound.mp3'), 'Constant', 'Constante', FALSE),
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_sound.mp3'), 'Increasing', 'Creciente', FALSE),
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_sound.mp3'), 'Sawtooth', 'Sierra', FALSE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_sound.mp3'), 'Triangular', 'Triangular', TRUE),
('Pulso', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_sound.mp3'), 'Pulse', 'Pulso', FALSE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_sound.mp3'), 'Decreasing', 'Decreciente', FALSE);

-- Choices para función creciente
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_sound.mp3'), 'Constant', 'Constante', FALSE),
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_sound.mp3'), 'Increasing', 'Creciente', TRUE),
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_sound.mp3'), 'Sawtooth', 'Sierra', FALSE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_sound.mp3'), 'Triangular', 'Triangular', FALSE),
('Pulso', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_sound.mp3'), 'Pulse', 'Pulso', FALSE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_sound.mp3'), 'Decreasing', 'Decreciente', FALSE);

-- Choices para función sierra
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_sound.mp3'), 'Increasing', 'Creciente', FALSE),
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_sound.mp3'), 'Constant', 'Constante', FALSE),
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_sound.mp3'), 'Sawtooth', 'Sierra', TRUE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_sound.mp3'), 'Triangular', 'Triangular', FALSE),
('Pulso', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_sound.mp3'), 'Pulse', 'Pulso', FALSE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_sound.mp3'), 'Decreasing', 'Decreciente', FALSE);

-- Choices para función cuadrada/pulso
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_sound.mp3'), 'Constant', 'Constante', FALSE),
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_sound.mp3'), 'Increasing', 'Creciente', FALSE),
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_sound.mp3'), 'Sawtooth', 'Sierra', FALSE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_sound.mp3'), 'Triangular', 'Triangular', FALSE),
('Pulso', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_sound.mp3'), 'Pulse', 'Pulso', TRUE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_sound.mp3'), 'Decreasing', 'Decreciente', FALSE);

-- Choices para funciones tipo 2 (curvas)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Cuadrática', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica2_sound.mp3'), 'Quadratic', 'Cuadrática', TRUE),
('Coseno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica2_sound.mp3'), 'Cosine', 'Coseno', FALSE),
('Cúbica', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica2_sound.mp3'), 'Cubic', 'Cúbica', FALSE),
('Seno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica2_sound.mp3'), 'Sine', 'Seno', FALSE);

INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Cuadrática', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cubica_sound.mp3'), 'Quadratic', 'Cuadrática', FALSE),
('Cúbica', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cubica_sound.mp3'), 'Cubic', 'Cúbica', TRUE),
('Coseno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cubica_sound.mp3'), 'Cosine', 'Coseno', FALSE),
('Seno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cubica_sound.mp3'), 'Sine', 'Seno', FALSE);

INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Cúbica', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/seno_sound.mp3'), 'Cubic', 'Cúbica', FALSE),
('Cuadrática', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/seno_sound.mp3'), 'Quadratic', 'Cuadrática', FALSE),
('Coseno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/seno_sound.mp3'), 'Cosine', 'Coseno', FALSE),
('Seno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/seno_sound.mp3'), 'Sine', 'Seno', TRUE);

INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Seno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_sound.mp3'), 'Sine', 'Seno', FALSE),
('Cuadrática', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_sound.mp3'), 'Quadratic', 'Cuadrática', TRUE),
('Cúbica', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_sound.mp3'), 'Cubic', 'Cúbica', FALSE),
('Coseno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_sound.mp3'), 'Cosine', 'Coseno', FALSE);

INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Cúbica', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/coseno_sound.mp3'), 'Cubic', 'Cúbica', FALSE),
('Coseno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/coseno_sound.mp3'), 'Cosine', 'Coseno', TRUE),
('Cuadrática', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/coseno_sound.mp3'), 'Quadratic', 'Cuadrática', FALSE),
('Seno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/coseno_sound.mp3'), 'Sine', 'Seno', FALSE);

INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Decr_sound.wav'), 'Increasing, Constant, Decreasing', 'Creciente, Constante, Decreciente', FALSE),
('Constante, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Decr_sound.wav'), 'Constant, Increasing, Decreasing', 'Constante, Creciente, Decreciente', FALSE),
('Decreciente, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Decr_sound.wav'), 'Decreasing, Constant, Decreasing', 'Decreciente, Constante, Decreciente', TRUE),
('Constante, Decreciente, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Decr_sound.wav'), 'Constant, Decreasing, Increasing', 'Constante, Decreciente, Creciente', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Decr_sound.wav'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Para Cte-Cre-Decr-Cte_sound.mp3 (respuesta correcta: "Ninguna de las anteriores")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Cre-Decr-Cte_sound.mp3'), 'Increasing, Constant, Decreasing', 'Creciente, Constante, Decreciente', FALSE),
('Constante, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Cre-Decr-Cte_sound.mp3'), 'Constant, Increasing, Decreasing', 'Constante, Creciente, Decreciente', FALSE),
('Decreciente, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Cre-Decr-Cte_sound.mp3'), 'Decreasing, Constant, Decreasing', 'Decreciente, Constante, Decreciente', FALSE),
('Constante, Decreciente, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Cre-Decr-Cte_sound.mp3'), 'Constant, Decreasing, Increasing', 'Constante, Decreciente, Creciente', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Cre-Decr-Cte_sound.mp3'), 'None of the above', 'Ninguna de las anteriores', TRUE);

-- Para Cte-Decr-Cre_sound.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Decr-Cre_sound.mp3'), 'Increasing, Constant, Decreasing', 'Creciente, Constante, Decreciente', FALSE),
('Decreciente, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Decr-Cre_sound.mp3'), 'Decreasing, Constant, Decreasing', 'Decreciente, Constante, Decreciente', FALSE),
('Constante, Decreciente, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Decr-Cre_sound.mp3'), 'Constant, Decreasing, Increasing', 'Constante, Decreciente, Creciente', TRUE),
('Constante, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Decr-Cre_sound.mp3'), 'Constant, Increasing, Decreasing', 'Constante, Creciente, Decreciente', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Decr-Cre_sound.mp3'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Para Cubica-Cte-Decr_sound.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Coseno, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cubica-Cte-Decr_sound.mp3'), 'Cosine, Increasing, Decreasing', 'Coseno, Creciente, Decreciente', FALSE),
('Decreciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cubica-Cte-Decr_sound.mp3'), 'Decreasing, Constant, Increasing', 'Decreciente, Constante, Creciente', FALSE),
('Cúbica, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cubica-Cte-Decr_sound.mp3'), 'Cubic, Constant, Decreasing', 'Cúbica, Constante, Decreciente', TRUE),
('Creciente, Curva, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cubica-Cte-Decr_sound.mp3'), 'Increasing, Curve, Constant', 'Creciente, Curva, Constante', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cubica-Cte-Decr_sound.mp3'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Para Decr-Cte-Cre_sound.mp3 (bloque "Funciones Tipo 4" - deploy diferente al de Tipo 3)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Coseno, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Cre_sound.mp3' AND question LIKE '%combinación de funciones%'), 'Cosine, Increasing, Decreasing', 'Coseno, Creciente, Decreciente', FALSE),
('Decreciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Cre_sound.mp3' AND question LIKE '%combinación de funciones%'), 'Decreasing, Constant, Increasing', 'Decreciente, Constante, Creciente', TRUE),
('Cúbica, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Cre_sound.mp3' AND question LIKE '%combinación de funciones%'), 'Cubic, Constant, Decreasing', 'Cúbica, Constante, Decreciente', FALSE),
('Creciente, Curva, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Cre_sound.mp3' AND question LIKE '%combinación de funciones%'), 'Increasing, Curve, Constant', 'Creciente, Curva, Constante', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Cre_sound.mp3' AND question LIKE '%combinación de funciones%'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Para Coseno-Cre-Decr_sound.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Coseno, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Coseno-Cre-Decr_sound.mp3'), 'Cosine, Increasing, Decreasing', 'Coseno, Creciente, Decreciente', TRUE),
('Cúbica, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Coseno-Cre-Decr_sound.mp3'), 'Cubic, Constant, Decreasing', 'Cúbica, Constante, Decreciente', FALSE),
('Decreciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Coseno-Cre-Decr_sound.mp3'), 'Decreasing, Constant, Increasing', 'Decreciente, Constante, Creciente', FALSE),
('Creciente, Curva, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Coseno-Cre-Decr_sound.mp3'), 'Increasing, Curve, Constant', 'Creciente, Curva, Constante', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Coseno-Cre-Decr_sound.mp3'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Para Cre-Seno-Cte_sound.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Cúbica, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Seno-Cte_sound.mp3'), 'Cubic, Constant, Decreasing', 'Cúbica, Constante, Decreciente', FALSE),
('Creciente, Curva, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Seno-Cte_sound.mp3'), 'Increasing, Curve, Constant', 'Creciente, Curva, Constante', TRUE),
('Decreciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Seno-Cte_sound.mp3'), 'Decreasing, Constant, Increasing', 'Decreciente, Constante, Creciente', FALSE),
('Coseno, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Seno-Cte_sound.mp3'), 'Cosine, Increasing, Decreasing', 'Coseno, Creciente, Decreciente', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Seno-Cte_sound.mp3'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Choices para funciones con ruido tipo 1
-- Para creciente_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_noise.mp3'), 'Sawtooth', 'Sierra', FALSE),
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_noise.mp3'), 'Increasing', 'Creciente', TRUE),
('Pulso/Cuadrada', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_noise.mp3'), 'Pulse/Square', 'Pulso/Cuadrada', FALSE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_noise.mp3'), 'Decreasing', 'Decreciente', FALSE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_noise.mp3'), 'Triangular', 'Triangular', FALSE),
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/creciente_noise.mp3'), 'Constant', 'Constante', FALSE);

-- Para fc-constante_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_noise.mp3'), 'Increasing', 'Creciente', FALSE),
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_noise.mp3'), 'Constant', 'Constante', TRUE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_noise.mp3'), 'Triangular', 'Triangular', FALSE),
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_noise.mp3'), 'Sawtooth', 'Sierra', FALSE),
('Pulso/Cuadrada', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_noise.mp3'), 'Pulse/Square', 'Pulso/Cuadrada', FALSE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/fc-constante_noise.mp3'), 'Decreasing', 'Decreciente', FALSE);

-- Para triangular_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_noise.mp3'), 'Decreasing', 'Decreciente', FALSE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_noise.mp3'), 'Triangular', 'Triangular', TRUE),
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_noise.mp3'), 'Sawtooth', 'Sierra', FALSE),
('Pulso/Cuadrada', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_noise.mp3'), 'Pulse/Square', 'Pulso/Cuadrada', FALSE),
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_noise.mp3'), 'Increasing', 'Creciente', FALSE),
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular_noise.mp3'), 'Constant', 'Constante', FALSE);

-- Para decreciente_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_noise.mp3'), 'Sawtooth', 'Sierra', FALSE),
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_noise.mp3'), 'Increasing', 'Creciente', FALSE),
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_noise.mp3'), 'Constant', 'Constante', FALSE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_noise.mp3'), 'Triangular', 'Triangular', FALSE),
('Pulso/Cuadrada', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_noise.mp3'), 'Pulse/Square', 'Pulso/Cuadrada', FALSE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/decreciente_noise.mp3'), 'Decreasing', 'Decreciente', TRUE);

-- Para cuadrada_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_noise.mp3'), 'Constant', 'Constante', FALSE),
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_noise.mp3'), 'Triangular', 'Triangular', FALSE),
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_noise.mp3'), 'Increasing', 'Creciente', FALSE),
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_noise.mp3'), 'Sawtooth', 'Sierra', FALSE),
('Pulso/Cuadrada', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_noise.mp3'), 'Pulse/Square', 'Pulso/Cuadrada', TRUE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadrada_noise.mp3'), 'Decreasing', 'Decreciente', FALSE);

-- Para sierra_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Triangular', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise.mp3'), 'Triangular', 'Triangular', FALSE),
('Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise.mp3'), 'Increasing', 'Creciente', FALSE),
('Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise.mp3'), 'Constant', 'Constante', FALSE),
('Sierra', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise.mp3'), 'Sawtooth', 'Sierra', TRUE),
('Pulso/Cuadrada', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise.mp3'), 'Pulse/Square', 'Pulso/Cuadrada', FALSE),
('Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise.mp3'), 'Decreasing', 'Decreciente', FALSE);

-- Choices para funciones con ruido tipo 2
-- Para coseno_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Seno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/coseno_noise.mp3'), 'Sine', 'Seno', FALSE),
('Cuadrática', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/coseno_noise.mp3'), 'Quadratic', 'Cuadrática', FALSE),
('Coseno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/coseno_noise.mp3'), 'Cosine', 'Coseno', TRUE),
('Cúbica', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/coseno_noise.mp3'), 'Cubic', 'Cúbica', FALSE);

-- Para cubica_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Cúbica', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cubica_noise.mp3'), 'Cubic', 'Cúbica', TRUE),
('Seno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cubica_noise.mp3'), 'Sine', 'Seno', FALSE),
('Coseno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cubica_noise.mp3'), 'Cosine', 'Coseno', FALSE),
('Cuadrática', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cubica_noise.mp3'), 'Quadratic', 'Cuadrática', FALSE);

-- Para cuadratica_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Coseno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_noise.mp3'), 'Cosine', 'Coseno', FALSE),
('Cuadrática', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_noise.mp3'), 'Quadratic', 'Cuadrática', TRUE),
('Seno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_noise.mp3'), 'Sine', 'Seno', FALSE),
('Cúbica', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_noise.mp3'), 'Cubic', 'Cúbica', FALSE);

-- Para seno_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Seno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/seno_noise.mp3'), 'Sine', 'Seno', TRUE),
('Coseno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/seno_noise.mp3'), 'Cosine', 'Coseno', FALSE),
('Cúbica', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/seno_noise.mp3'), 'Cubic', 'Cúbica', FALSE),
('Cuadrática', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/seno_noise.mp3'), 'Quadratic', 'Cuadrática', FALSE);

-- Para cuadratica2_noise.mp3
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Cuadrática', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica2_noise.mp3'), 'Quadratic', 'Cuadrática', TRUE),
('Coseno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica2_noise.mp3'), 'Cosine', 'Coseno', FALSE),
('Seno', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica2_noise.mp3'), 'Sine', 'Seno', FALSE),
('Cúbica', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica2_noise.mp3'), 'Cubic', 'Cúbica', FALSE);

-- Para Cre-Cte-Decr_sound.mp3 (deploy - último de Funciones Tipo 3)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente, Constante, Decreciente', (SELECT d.id FROM trainingApp_deploy d INNER JOIN trainingApp_block b ON d.block_id = b.id WHERE d.deploy_sound = 'trainingApp/sound/Cre-Cte-Decr_sound.mp3' AND b.name_block = 'Funciones Tipo 3'), 'Increasing, Constant, Decreasing', 'Creciente, Constante, Decreciente', TRUE),
('Constante, Creciente, Decreciente', (SELECT d.id FROM trainingApp_deploy d INNER JOIN trainingApp_block b ON d.block_id = b.id WHERE d.deploy_sound = 'trainingApp/sound/Cre-Cte-Decr_sound.mp3' AND b.name_block = 'Funciones Tipo 3'), 'Constant, Increasing, Decreasing', 'Constante, Creciente, Decreciente', FALSE),
('Decreciente, Constante, Decreciente', (SELECT d.id FROM trainingApp_deploy d INNER JOIN trainingApp_block b ON d.block_id = b.id WHERE d.deploy_sound = 'trainingApp/sound/Cre-Cte-Decr_sound.mp3' AND b.name_block = 'Funciones Tipo 3'), 'Decreasing, Constant, Decreasing', 'Decreciente, Constante, Decreciente', FALSE),
('Constante, Decreciente, Creciente', (SELECT d.id FROM trainingApp_deploy d INNER JOIN trainingApp_block b ON d.block_id = b.id WHERE d.deploy_sound = 'trainingApp/sound/Cre-Cte-Decr_sound.mp3' AND b.name_block = 'Funciones Tipo 3'), 'Constant, Decreasing, Increasing', 'Constante, Decreciente, Creciente', FALSE),
('Ninguna de las anteriores', (SELECT d.id FROM trainingApp_deploy d INNER JOIN trainingApp_block b ON d.block_id = b.id WHERE d.deploy_sound = 'trainingApp/sound/Cre-Cte-Decr_sound.mp3' AND b.name_block = 'Funciones Tipo 3'), 'None of the above', 'Ninguna de las anteriores', FALSE);




