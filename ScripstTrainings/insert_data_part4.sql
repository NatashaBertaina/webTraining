-- ========================================
-- TRAINING: Parte 4 - Entrenamiento FINAL
-- ========================================

INSERT INTO trainingApp_training (
    name_training, pub_date, modificationDate, difficulty, estimatedDuration, 
    attempts_allowed, state_training, name_training_en, name_training_es
) VALUES
('Entrenamiento FINAL', '2024-07-02 16:33:06.720289', '2024-07-05 22:37:14.038656', 'Avanzado', 30, 5, 'Activo', 'FINAL Training', 'Entrenamiento FINAL');

-- ========================================
-- BLOCKS para Entrenamiento FINAL
-- ========================================

INSERT INTO trainingApp_block (
    name_block, description, estimed_duration_block, state_block, training_id,
    name_block_en, name_block_es, description_en, description_es
) VALUES
-- Bloques del Entrenamiento FINAL
('Primer bloque: Tonos', 'Contar cantidad de tonos escuchados', 5, 'Activo', 
    (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento FINAL'), 
    'First block: Tones', 'Primer bloque: Tonos', 
    'Count number of tones heard', 'Contar cantidad de tonos escuchados'),

('Segundo bloque: Funciones', 'Clasificacion de funciones lineales, curvas y funciones con ruido', 10, 'Activo', 
    (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento FINAL'), 
    'Second block: Functions', 'Segundo bloque: Funciones', 
    'Classification of linear functions, curves and functions with noise', 'Clasificacion de funciones lineales, curvas y funciones con ruido'),

('Tercer bloque: Curvas de luz', 'clasificacion de curvas de luz', 10, 'Activo', 
    (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento FINAL'), 
    'Third block: Light curves', 'Tercer bloque: Curvas de luz', 
    'Light curve classification', 'clasificacion de curvas de luz'),

('Cuarto bloque: Galaxias y Estrellas', 'Deteccion de galaxias o estrellas', 10, 'Activo', 
    (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento FINAL'), 
    'Fourth block: Galaxies and Stars', 'Cuarto bloque: Galaxias y Estrellas', 
    'Detection of galaxies or stars', 'Deteccion de galaxias o estrellas'),

('Quinto bloque: Muongrafía', 'Deteccion de existencia o no de muones', 5, 'Activo', 
    (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento FINAL'), 
    'Fifth block: Muongraphy', 'Quinto bloque: Muongrafía', 
    'Detection of muon existence or not', 'Deteccion de existencia o no de muones');

-- ========================================
-- DEPLOYS para Entrenamiento FINAL
-- ========================================

INSERT INTO trainingApp_deploy (
    block_id, question, deploy_image, deploy_sound,
    question_en, question_es
) VALUES
-- Deploys para "Primer bloque: Tonos" (deploy 93-96)
((SELECT id FROM trainingApp_block WHERE name_block = 'Primer bloque: Tonos'), 
    '¿Cuántos tonos escuchó?', 'trainingApp/images/Entrenamiento_sin_imagen_ASD7AoE.png', 'trainingApp/sound/Escala4_sound_dLqkt8w.mp3',
    'How many tones did you hear?', '¿Cuántos tonos escuchó?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Primer bloque: Tonos'), 
    '¿Cuántos tonos escuchó?', 'trainingApp/images/Entrenamiento_sin_imagen_i4TpBEY.png', 'trainingApp/sound/escala7_sound.mp3',
    'How many tones did you hear?', '¿Cuántos tonos escuchó?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Primer bloque: Tonos'), 
    '¿Cuántos tonos escuchó?', 'trainingApp/images/Entrenamiento_sin_imagen_sJbDz4U.png', 'trainingApp/sound/escala8_sound.mp3',
    'How many tones did you hear?', '¿Cuántos tonos escuchó?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Primer bloque: Tonos'), 
    '¿Cuántos tonos escuchó?', 'trainingApp/images/Entrenamiento_sin_imagen_ZNP774J.png', 'trainingApp/sound/Escala1_sound_suRbCRx.mp3',
    'How many tones did you hear?', '¿Cuántos tonos escuchó?'),

-- Deploys para "Segundo bloque: Funciones" (deploy 97-100)
((SELECT id FROM trainingApp_block WHERE name_block = 'Segundo bloque: Funciones'), 
    'Identifica la función escuchada como:', 'trainingApp/images/Entrenamiento_sin_imagen_2Wgr53u.png', 'trainingApp/sound/cuadratica2_noise_jOADlB4.mp3',
    'Identify the function heard as:', 'Identifica la función escuchada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Segundo bloque: Funciones'), 
    'Identifica la función escuchada como:', 'trainingApp/images/Entrenamiento_sin_imagen_yxezSa1.png', 'trainingApp/sound/sierra-2_sound.mp3',
    'Identify the function heard as:', 'Identifica la función escuchada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Segundo bloque: Funciones'), 
    'Identifica la función escuchada como:', 'trainingApp/images/Entrenamiento_sin_imagen_1Si1AsX.png', 'trainingApp/sound/triangular-2_sound_NHZTiXA.mp3',
    'Identify the function heard as:', 'Identifica la función escuchada como:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Segundo bloque: Funciones'), 
    'Identifica la función escuchada como:', 'trainingApp/images/Entrenamiento_sin_imagen_aZajXbZ.png', 'trainingApp/sound/seno_noise_hihJ7mr.mp3',
    'Identify the function heard as:', 'Identifica la función escuchada como:'),

-- Deploys para "Tercer bloque: Curvas de luz" (deploy 101-104)
((SELECT id FROM trainingApp_block WHERE name_block = 'Tercer bloque: Curvas de luz'), 
    'Escuchó una curva de luz del tipo:', 'trainingApp/images/Entrenamiento_sin_imagen_7u3P754.png', 'trainingApp/sound/BEclipsante3ASASSN-VJ051010.03-145216.9.csv_sound.mp3',
    'You heard a light curve of type:', 'Escuchó una curva de luz del tipo:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Tercer bloque: Curvas de luz'), 
    'Escuchó una curva de luz del tipo:', 'trainingApp/images/Entrenamiento_sin_imagen_OpOjhr4.png', 'trainingApp/sound/Cefeida3ASASSN-VJ035729.68545617.0.csv_sound_54uXBBu.mp3',
    'You heard a light curve of type:', 'Escuchó una curva de luz del tipo:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Tercer bloque: Curvas de luz'), 
    'Escuchó una curva de luz del tipo:', 'trainingApp/images/Entrenamiento_sin_imagen_x2Gdo2v.png', 'trainingApp/sound/ASASSN-V_J000630.89791142.0.csv_sound.mp3',
    'You heard a light curve of type:', 'Escuchó una curva de luz del tipo:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Tercer bloque: Curvas de luz'), 
    'Escuchó una curva de luz del tipo:', 'trainingApp/images/Entrenamiento_sin_imagen_chgEzk4.png', 'trainingApp/sound/Cefeida2ASASSN-VJ075742.06-273607.3.csv_sound_QeasTgy.mp3',
    'You heard a light curve of type:', 'Escuchó una curva de luz del tipo:'),

-- Deploys para "Cuarto bloque: Galaxias y Estrellas" (deploy 105-108)
((SELECT id FROM trainingApp_block WHERE name_block = 'Cuarto bloque: Galaxias y Estrellas'), 
    '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_Z8VOv55.png', 'trainingApp/sound/G0_hUkX15R.mp3',
    'What you heard was a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Cuarto bloque: Galaxias y Estrellas'), 
    '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_wziOIiV.png', 'trainingApp/sound/SDSS_J151806.13424445.0_2_sound_F0nXfea.mp3',
    'What you heard was a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Cuarto bloque: Galaxias y Estrellas'), 
    '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_AWaffup.png', 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound_vgX3u1L.mp3',
    'What you heard was a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Cuarto bloque: Galaxias y Estrellas'), 
    '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_uEkAvVH.png', 'trainingApp/sound/unknown_315qBQC.mp3',
    'What you heard was a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),

-- Deploys para "Quinto bloque: Muongrafía" (deploy 109-112)
((SELECT id FROM trainingApp_block WHERE name_block = 'Quinto bloque: Muongrafía'), 
    '¿Se captó un muon?', 'trainingApp/images/Entrenamiento_sin_imagen_HNsl5pX.png', 'trainingApp/sound/5796449_1300732_soundline_SLjTOd3.mp3',
    'Was a muon detected?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Quinto bloque: Muongrafía'), 
    '¿Se captó un muon?', 'trainingApp/images/Entrenamiento_sin_imagen_1UJEjnh.png', 'trainingApp/sound/5578073_4470708_sound_qxYXprf.mp3',
    'Was a muon detected?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Quinto bloque: Muongrafía'), 
    '¿Se captó un muon?', 'trainingApp/images/Entrenamiento_sin_imagen_nWbuUUb.png', 'trainingApp/sound/5565655_19009905_soundline.mp3',
    'Was a muon detected?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Quinto bloque: Muongrafía'), 
    '¿Se captó un muon?', 'trainingApp/images/Entrenamiento_sin_imagen_idjiyI0.png', 'trainingApp/sound/5762520_3538527_soundline_mOdld1b.mp3',
    'Was a muon detected?', '¿Se captó un muon?');

-- ========================================
-- CHOICES para Entrenamiento FINAL
-- ========================================

-- Choices para Primer bloque: Tonos (deploy 93 - respuesta correcta: 8)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '5', id, '5', '5', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala4_sound_dLqkt8w.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '6', id, '6', '6', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala4_sound_dLqkt8w.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '4', id, '4', '4', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala4_sound_dLqkt8w.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '8', id, '8', '8', TRUE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala4_sound_dLqkt8w.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '9', id, '9', '9', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala4_sound_dLqkt8w.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '10', id, '10', '10', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala4_sound_dLqkt8w.mp3';

-- Choices para deploy 94 (respuesta correcta: 10)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '10', id, '10', '10', TRUE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala7_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '8', id, '8', '8', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala7_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '4', id, '4', '4', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala7_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '9', id, '9', '9', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala7_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '5', id, '5', '5', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala7_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '6', id, '6', '6', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala7_sound.mp3';

-- Choices para deploy 95 (respuesta correcta: 9)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '9', id, '9', '9', TRUE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala8_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '8', id, '8', '8', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala8_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '4', id, '4', '4', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala8_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '5', id, '5', '5', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala8_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '10', id, '10', '10', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala8_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '6', id, '6', '6', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/escala8_sound.mp3';

-- Choices para deploy 96 (respuesta correcta: 4)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '6', id, '6', '6', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala1_sound_suRbCRx.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '4', id, '4', '4', TRUE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala1_sound_suRbCRx.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '5', id, '5', '5', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala1_sound_suRbCRx.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '10', id, '10', '10', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala1_sound_suRbCRx.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '8', id, '8', '8', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala1_sound_suRbCRx.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '9', id, '9', '9', FALSE FROM trainingApp_deploy 
WHERE question = '¿Cuántos tonos escuchó?' AND deploy_sound = 'trainingApp/sound/Escala1_sound_suRbCRx.mp3';

-- Choices para Segundo bloque: Funciones (deploy 97 - respuesta correcta: Cuadrática/Parábola)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Seno', id, 'Sine', 'Seno', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/cuadratica2_noise_jOADlB4.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Sierra', id, 'Sawtooth', 'Sierra', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/cuadratica2_noise_jOADlB4.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cuadrática/Parábola', id, 'Quadratic/Parabola', 'Cuadrática/Parábola', TRUE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/cuadratica2_noise_jOADlB4.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Triangular', id, 'Triangular', 'Triangular', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/cuadratica2_noise_jOADlB4.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/cuadratica2_noise_jOADlB4.mp3';

-- Choices para deploy 98 (respuesta correcta: Sierra)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Sierra', id, 'Sawtooth', 'Sierra', TRUE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/sierra-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cuadrática/Parábola', id, 'Quadratic/Parabola', 'Cuadrática/Parábola', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/sierra-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Seno', id, 'Sine', 'Seno', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/sierra-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Triangular', id, 'Triangular', 'Triangular', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/sierra-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/sierra-2_sound.mp3';

-- Choices para deploy 99 (respuesta correcta: Triangular)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Seno', id, 'Sine', 'Seno', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/triangular-2_sound_NHZTiXA.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cuadrática/Parábola', id, 'Quadratic/Parabola', 'Cuadrática/Parábola', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/triangular-2_sound_NHZTiXA.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Sierra', id, 'Sawtooth', 'Sierra', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/triangular-2_sound_NHZTiXA.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Triangular', id, 'Triangular', 'Triangular', TRUE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/triangular-2_sound_NHZTiXA.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/triangular-2_sound_NHZTiXA.mp3';

-- Choices para deploy 100 (respuesta correcta: Seno)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Triangular', id, 'Triangular', 'Triangular', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/seno_noise_hihJ7mr.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cuadrática/Parábola', id, 'Quadratic/Parabola', 'Cuadrática/Parábola', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/seno_noise_hihJ7mr.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Sierra', id, 'Sawtooth', 'Sierra', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/seno_noise_hihJ7mr.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Seno', id, 'Sine', 'Seno', TRUE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/seno_noise_hihJ7mr.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy 
WHERE question = 'Identifica la función escuchada como:' AND deploy_sound = 'trainingApp/sound/seno_noise_hihJ7mr.mp3';

-- Choices para Tercer bloque: Curvas de luz (deploy 101 - respuesta correcta: Binaria eclipsante)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Binaria eclipsante', id, 'Eclipsing Binary', 'Binaria eclipsante', TRUE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/BEclipsante3ASASSN-VJ051010.03-145216.9.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cefeida', id, 'Cepheid', 'Cefeida', FALSE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/BEclipsante3ASASSN-VJ051010.03-145216.9.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/BEclipsante3ASASSN-VJ051010.03-145216.9.csv_sound.mp3';

-- Choices para deploy 102 (respuesta correcta: Cefeida)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cefeida', id, 'Cepheid', 'Cefeida', TRUE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/Cefeida3ASASSN-VJ035729.68545617.0.csv_sound_54uXBBu.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Binaria eclipsante', id, 'Eclipsing Binary', 'Binaria eclipsante', FALSE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/Cefeida3ASASSN-VJ035729.68545617.0.csv_sound_54uXBBu.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/Cefeida3ASASSN-VJ035729.68545617.0.csv_sound_54uXBBu.mp3';

-- Choices para deploy 103 (respuesta correcta: Binaria eclipsante)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Binaria eclipsante', id, 'Eclipsing Binary', 'Binaria eclipsante', TRUE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/ASASSN-V_J000630.89791142.0.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cefeida', id, 'Cepheid', 'Cefeida', FALSE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/ASASSN-V_J000630.89791142.0.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/ASASSN-V_J000630.89791142.0.csv_sound.mp3';

-- Choices para deploy 104 (respuesta correcta: Cefeida)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cefeida', id, 'Cepheid', 'Cefeida', TRUE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/Cefeida2ASASSN-VJ075742.06-273607.3.csv_sound_QeasTgy.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Binaria eclipsante', id, 'Eclipsing Binary', 'Binaria eclipsante', FALSE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/Cefeida2ASASSN-VJ075742.06-273607.3.csv_sound_QeasTgy.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = 'Escuchó una curva de luz del tipo:' AND deploy_sound = 'trainingApp/sound/Cefeida2ASASSN-VJ075742.06-273607.3.csv_sound_QeasTgy.mp3';

-- Choices para Cuarto bloque: Galaxias y Estrellas (deploy 105 - respuesta correcta: Estrella)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Estrella', id, 'Star', 'Estrella', TRUE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/G0_hUkX15R.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Galaxia', id, 'Galaxy', 'Galaxia', FALSE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/G0_hUkX15R.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/G0_hUkX15R.mp3';

-- Choices para deploy 106 (respuesta correcta: Galaxia)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Estrella', id, 'Star', 'Estrella', FALSE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_2_sound_F0nXfea.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Galaxia', id, 'Galaxy', 'Galaxia', TRUE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_2_sound_F0nXfea.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_2_sound_F0nXfea.mp3';

-- Choices para deploy 107 (respuesta correcta: Galaxia)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Estrella', id, 'Star', 'Estrella', FALSE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound_vgX3u1L.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Galaxia', id, 'Galaxy', 'Galaxia', TRUE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound_vgX3u1L.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound_vgX3u1L.mp3';

-- Choices para deploy 108 (respuesta correcta: Estrella)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Estrella', id, 'Star', 'Estrella', TRUE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/unknown_315qBQC.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Galaxia', id, 'Galaxy', 'Galaxia', FALSE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/unknown_315qBQC.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = '¿Lo que escuchó fue una estrella o una galaxia?' AND deploy_sound = 'trainingApp/sound/unknown_315qBQC.mp3';

-- Choices para Quinto bloque: Muongrafía (deploy 109 - respuesta correcta: Si)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Si', id, 'Yes', 'Si', TRUE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5796449_1300732_soundline_SLjTOd3.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No', id, 'No', 'No', FALSE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5796449_1300732_soundline_SLjTOd3.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5796449_1300732_soundline_SLjTOd3.mp3';

-- Choices para deploy 110 (respuesta correcta: No)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Si', id, 'Yes', 'Si', FALSE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5578073_4470708_sound_qxYXprf.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No', id, 'No', 'No', TRUE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5578073_4470708_sound_qxYXprf.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5578073_4470708_sound_qxYXprf.mp3';

-- Choices para deploy 111 (respuesta correcta: Si)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Si', id, 'Yes', 'Si', TRUE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5565655_19009905_soundline.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No', id, 'No', 'No', FALSE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5565655_19009905_soundline.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5565655_19009905_soundline.mp3';

-- Choices para deploy 112 (respuesta correcta: Si)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Si', id, 'Yes', 'Si', TRUE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5762520_3538527_soundline_mOdld1b.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No', id, 'No', 'No', FALSE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5762520_3538527_soundline_mOdld1b.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy 
WHERE question = '¿Se captó un muon?' AND deploy_sound = 'trainingApp/sound/5762520_3538527_soundline_mOdld1b.mp3';

-- ========================================
-- FIN del Entrenamiento FINAL
-- ========================================
