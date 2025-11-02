-- ========================================
-- TRAINING: Parte 3
-- ========================================

INSERT INTO trainingApp_training (
    name_training, pub_date, modificationDate, difficulty, estimatedDuration, 
    attempts_allowed, state_training, name_training_en, name_training_es
) VALUES
('Entrenamiento de repaso', '2024-06-26 12:36:06.723839', '2024-06-27 12:15:46.768365', 'Intermedio', 25, 10, 'Activo', 'Review Training', 'Entrenamiento de repaso');

-- ========================================
-- BLOCKS para Entrenamiento de repaso
-- ========================================

INSERT INTO trainingApp_block (
    name_block, description, estimed_duration_block, state_block, training_id,
    name_block_en, name_block_es, description_en, description_es
) VALUES
('Bloque 1 - repaso', 'Funciones matemáticas con y sin ruido', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento de repaso'), 'Block 1 - review', 'Bloque 1 - repaso', 'Mathematical functions with and without noise', 'Funciones matemáticas con y sin ruido'),
('Bloque 2 - repaso tonos', 'Contar cantidad de tonos distintos que se detectan', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento de repaso'), 'Block 2 - tone review', 'Bloque 2 - repaso tonos', 'Count number of different tones detected', 'Contar cantidad de tonos distintos que se detectan'),
('Bloque 3 - repaso: Galaxias y estrellas', 'Clasificacion de estrellas y galaxias', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento de repaso'), 'Block 3 - review: Galaxies and stars', 'Bloque 3 - repaso: Galaxias y estrellas', 'Classification of stars and galaxies', 'Clasificacion de estrellas y galaxias'),
('Bloque 4 - repaso: curvas de luz', 'Clasificación en BE o Cefeida', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento de repaso'), 'Block 4 - review: light curves', 'Bloque 4 - repaso: curvas de luz', 'Classification as EB or Cepheid', 'Clasificación en BE o Cefeida'),
('Bloque 5 - repaso: muones', 'Determinacion de existencia o no de muones', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Entrenamiento de repaso'), 'Block 5 - review: muons', 'Bloque 5 - repaso: muones', 'Determination of muon existence or not', 'Determinacion de existencia o no de muones');

-- ========================================
-- DEPLOYS para Entrenamiento de repaso
-- ========================================

-- Bloque 1 - repaso (funciones)
INSERT INTO trainingApp_deploy (
    block_id, question, deploy_image, deploy_sound,
    question_en, question_es
) VALUES
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 1 - repaso'), 'Seleccione la función que acaba de escuchar', 'trainingApp/images/Entrenamiento_sin_imagen.png', 'trainingApp/sound/Pulso-2_sound.mp3', 'Select the function you just heard', 'Seleccione la función que acaba de escuchar'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 1 - repaso'), 'Seleccione la función que acaba de escuchar', 'trainingApp/images/Entrenamiento_sin_imagen_d3lHlAW.png', 'trainingApp/sound/sierra_noise_oTjwRIX.mp3', 'Select the function you just heard', 'Seleccione la función que acaba de escuchar'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 1 - repaso'), 'Seleccione la función que acaba de escuchar', 'trainingApp/images/Entrenamiento_sin_imagen_6YARTyz.png', 'trainingApp/sound/cuadratica_noise_EoJkHQr.mp3', 'Select the function you just heard', 'Seleccione la función que acaba de escuchar'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 1 - repaso'), 'Seleccione la función que acaba de escuchar', 'trainingApp/images/Entrenamiento_sin_imagen_nWPAKUz.png', 'trainingApp/sound/triangular-2_sound.mp3', 'Select the function you just heard', 'Seleccione la función que acaba de escuchar');

-- Bloque 2 - repaso tonos
INSERT INTO trainingApp_deploy (
    block_id, question, deploy_image, deploy_sound,
    question_en, question_es
) VALUES
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 2 - repaso tonos'), '¿Cuántos tonos distintos escuchó?', 'trainingApp/images/Entrenamiento_sin_imagen_B6BdXvV.png', 'trainingApp/sound/Escala1_sound.mp3', 'How many different tones did you hear?', '¿Cuántos tonos distintos escuchó?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 2 - repaso tonos'), '¿Cuántos tonos distintos escuchó?', 'trainingApp/images/Entrenamiento_sin_imagen_V1TeKZe.png', 'trainingApp/sound/escala5_sound.mp3', 'How many different tones did you hear?', '¿Cuántos tonos distintos escuchó?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 2 - repaso tonos'), '¿Cuántos tonos distintos escuchó?', 'trainingApp/images/Entrenamiento_sin_imagen_EYaZR0Z.png', 'trainingApp/sound/escala6_sound.mp3', 'How many different tones did you hear?', '¿Cuántos tonos distintos escuchó?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 2 - repaso tonos'), '¿Cuántos tonos distintos escuchó?', 'trainingApp/images/Entrenamiento_sin_imagen_PH5KS9J.png', 'trainingApp/sound/Escala4_sound.mp3', 'How many different tones did you hear?', '¿Cuántos tonos distintos escuchó?');

-- Bloque 3 - repaso: Galaxias y estrellas
INSERT INTO trainingApp_deploy (
    block_id, question, deploy_image, deploy_sound,
    question_en, question_es
) VALUES
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 3 - repaso: Galaxias y estrellas'), '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_OGA2Zdf.png', 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound_HKKyuBH.mp3', 'Was what you heard a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 3 - repaso: Galaxias y estrellas'), '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_ztWafVC.png', 'trainingApp/sound/O5_kwFZVfJ.mp3', 'Was what you heard a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 3 - repaso: Galaxias y estrellas'), '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_s7gHtBp.png', 'trainingApp/sound/SDSS_J151806.13424445.0_1_sound_qHSfu7E.mp3', 'Was what you heard a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 3 - repaso: Galaxias y estrellas'), '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_X68KvRt.png', 'trainingApp/sound/A5_Ixl6sc7.mp3', 'Was what you heard a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?');

-- Bloque 4 - repaso: curvas de luz
INSERT INTO trainingApp_deploy (
    block_id, question, deploy_image, deploy_sound,
    question_en, question_es
) VALUES
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 4 - repaso: curvas de luz'), 'Escuchó una curva de luz del tipo:', 'trainingApp/images/Cefeida3ASASSN-VJ035729.68545617.0.csv_plot.png', 'trainingApp/sound/Cefeida3ASASSN-VJ035729.68545617.0.csv_sound.mp3', 'You heard a light curve of type:', 'Escuchó una curva de luz del tipo:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 4 - repaso: curvas de luz'), 'Escuchó una curva de luz del tipo:', 'trainingApp/images/Entrenamiento_sin_imagen_SZa1lSw.png', 'trainingApp/sound/ASASSN-V_J003016.19-462759.5.csv_sound.mp3', 'You heard a light curve of type:', 'Escuchó una curva de luz del tipo:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 4 - repaso: curvas de luz'), 'Escuchó una curva de luz del tipo:', 'trainingApp/images/Entrenamiento_sin_imagen_u5QTCBt.png', 'trainingApp/sound/ASASSN-V_J000059.21605732.5.csv_sound.mp3', 'You heard a light curve of type:', 'Escuchó una curva de luz del tipo:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 4 - repaso: curvas de luz'), 'Escuchó una curva de luz del tipo:', 'trainingApp/images/Entrenamiento_sin_imagen_JQFAW08.png', 'trainingApp/sound/Cefeida2ASASSN-VJ075742.06-273607.3.csv_sound.mp3', 'You heard a light curve of type:', 'Escuchó una curva de luz del tipo:');

-- Bloque 5 - repaso: muones
INSERT INTO trainingApp_deploy (
    block_id, question, deploy_image, deploy_sound,
    question_en, question_es
) VALUES
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 5 - repaso: muones'), '¿Se captó un muon?', 'trainingApp/images/5796449_1300732_plotline.png', 'trainingApp/sound/5796449_1300732_soundline_jvlpQL7.mp3', 'Was a muon captured?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 5 - repaso: muones'), '¿Se captó un muon?', 'trainingApp/images/Entrenamiento_sin_imagen_vBcsqWi.png', 'trainingApp/sound/5565547_19009797_soundline_VAf9chb.mp3', 'Was a muon captured?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 5 - repaso: muones'), '¿Se captó un muon?', 'trainingApp/images/Entrenamiento_sin_imagen_vGZUlMh.png', 'trainingApp/sound/5578073_4470708_sound_YtaTQiQ.mp3', 'Was a muon captured?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Bloque 5 - repaso: muones'), '¿Se captó un muon?', 'trainingApp/images/5580844_4473479_plot.png', 'trainingApp/sound/5580844_4473479_sound.mp3', 'Was a muon captured?', '¿Se captó un muon?');

-- ========================================
-- CHOICES para Entrenamiento de repaso
-- ========================================

-- Choices para Bloque 1 - repaso (funciones)
-- Deploy 1: Pulso/Cuadrada (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Sierra', id, 'Saw', 'Sierra', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Pulso-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cuadrática/Parábola', id, 'Quadratic/Parabola', 'Cuadrática/Parábola', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Pulso-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Pulso/Cuadrada', id, 'Pulse/Square', 'Pulso/Cuadrada', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Pulso-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Triangular', id, 'Triangular', 'Triangular', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Pulso-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Seno', id, 'Sine', 'Seno', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Pulso-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Pulso-2_sound.mp3';

-- Deploy 2: Sierra (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Pulso/Cuadrada', id, 'Pulse/Square', 'Pulso/Cuadrada', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise_oTjwRIX.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cuadrática/Parábola', id, 'Quadratic/Parabola', 'Cuadrática/Parábola', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise_oTjwRIX.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Sierra', id, 'Saw', 'Sierra', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise_oTjwRIX.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Seno', id, 'Sine', 'Seno', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise_oTjwRIX.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Triangular', id, 'Triangular', 'Triangular', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise_oTjwRIX.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/sierra_noise_oTjwRIX.mp3';

-- Deploy 3: Cuadrática/Parábola (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Seno', id, 'Sine', 'Seno', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_noise_EoJkHQr.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Pulso/Cuadrada', id, 'Pulse/Square', 'Pulso/Cuadrada', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_noise_EoJkHQr.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Sierra', id, 'Saw', 'Sierra', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_noise_EoJkHQr.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Triangular', id, 'Triangular', 'Triangular', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_noise_EoJkHQr.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cuadrática/Parábola', id, 'Quadratic/Parabola', 'Cuadrática/Parábola', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_noise_EoJkHQr.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/cuadratica_noise_EoJkHQr.mp3';

-- Deploy 4: Triangular (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Sierra', id, 'Saw', 'Sierra', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Seno', id, 'Sine', 'Seno', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cuadrática/Parábola', id, 'Quadratic/Parabola', 'Cuadrática/Parábola', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Pulso/Cuadrada', id, 'Pulse/Square', 'Pulso/Cuadrada', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Triangular', id, 'Triangular', 'Triangular', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular-2_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/triangular-2_sound.mp3';

-- Choices para Bloque 2 - repaso tonos
-- Deploy 1: 4 tonos (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '5', id, '5', '5', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala1_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '8', id, '8', '8', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala1_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '6', id, '6', '6', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala1_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '4', id, '4', '4', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala1_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '7', id, '7', '7', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala1_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala1_sound.mp3';

-- Deploy 2: 7 tonos (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '6', id, '6', '6', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala5_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '7', id, '7', '7', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala5_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '5', id, '5', '5', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala5_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '8', id, '8', '8', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala5_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '4', id, '4', '4', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala5_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala5_sound.mp3';

-- Deploy 3: 7 tonos (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '6', id, '6', '6', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala6_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '4', id, '4', '4', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala6_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '5', id, '5', '5', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala6_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '8', id, '8', '8', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala6_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '7', id, '7', '7', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala6_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/escala6_sound.mp3';

-- Deploy 4: 8 tonos (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '8', id, '8', '8', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala4_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '7', id, '7', '7', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala4_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '6', id, '6', '6', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala4_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '5', id, '5', '5', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala4_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT '4', id, '4', '4', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala4_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Ninguna de las anteriores', id, 'None of the above', 'Ninguna de las anteriores', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Escala4_sound.mp3';

-- Choices para Bloque 3 - repaso: Galaxias y estrellas
-- Deploy 1: Galaxia (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Estrella', id, 'Star', 'Estrella', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound_HKKyuBH.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Galaxia', id, 'Galaxy', 'Galaxia', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound_HKKyuBH.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound_HKKyuBH.mp3';

-- Deploy 2: Estrella (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Estrella', id, 'Star', 'Estrella', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/O5_kwFZVfJ.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Galaxia', id, 'Galaxy', 'Galaxia', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/O5_kwFZVfJ.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/O5_kwFZVfJ.mp3';

-- Deploy 3: Galaxia (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Estrella', id, 'Star', 'Estrella', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_1_sound_qHSfu7E.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Galaxia', id, 'Galaxy', 'Galaxia', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_1_sound_qHSfu7E.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_1_sound_qHSfu7E.mp3';

-- Deploy 4: Estrella (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Estrella', id, 'Star', 'Estrella', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/A5_Ixl6sc7.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Galaxia', id, 'Galaxy', 'Galaxia', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/A5_Ixl6sc7.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/A5_Ixl6sc7.mp3';

-- Choices para Bloque 4 - repaso: curvas de luz
-- Deploy 1: Cefeida (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cefeida', id, 'Cepheid', 'Cefeida', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cefeida3ASASSN-VJ035729.68545617.0.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Binaria eclipsante', id, 'Eclipsing binary', 'Binaria eclipsante', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cefeida3ASASSN-VJ035729.68545617.0.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cefeida3ASASSN-VJ035729.68545617.0.csv_sound.mp3';

-- Deploy 2: Binaria eclipsante (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Binaria eclipsante', id, 'Eclipsing binary', 'Binaria eclipsante', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J003016.19-462759.5.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cefeida', id, 'Cepheid', 'Cefeida', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J003016.19-462759.5.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J003016.19-462759.5.csv_sound.mp3';

-- Deploy 3: Cefeida (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cefeida', id, 'Cepheid', 'Cefeida', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J000059.21605732.5.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Binaria eclipsante', id, 'Eclipsing binary', 'Binaria eclipsante', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J000059.21605732.5.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J000059.21605732.5.csv_sound.mp3';

-- Deploy 4: Cefeida (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Cefeida', id, 'Cepheid', 'Cefeida', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cefeida2ASASSN-VJ075742.06-273607.3.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Binaria eclipsante', id, 'Eclipsing binary', 'Binaria eclipsante', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cefeida2ASASSN-VJ075742.06-273607.3.csv_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cefeida2ASASSN-VJ075742.06-273607.3.csv_sound.mp3';

-- Choices para Bloque 5 - repaso: muones
-- Deploy 1: Si (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Si', id, 'Yes', 'Si', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5796449_1300732_soundline_jvlpQL7.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No', id, 'No', 'No', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5796449_1300732_soundline_jvlpQL7.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5796449_1300732_soundline_jvlpQL7.mp3';

-- Deploy 2: Si (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Si', id, 'Yes', 'Si', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5565547_19009797_soundline_VAf9chb.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No', id, 'No', 'No', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5565547_19009797_soundline_VAf9chb.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5565547_19009797_soundline_VAf9chb.mp3';

-- Deploy 3: No (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Si', id, 'Yes', 'Si', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5578073_4470708_sound_YtaTQiQ.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No', id, 'No', 'No', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5578073_4470708_sound_YtaTQiQ.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5578073_4470708_sound_YtaTQiQ.mp3';

-- Deploy 4: No (correcto)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'Si', id, 'Yes', 'Si', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5580844_4473479_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No', id, 'No', 'No', TRUE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5580844_4473479_sound.mp3';
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) 
SELECT 'No estoy seguro/a', id, 'I am not sure', 'No estoy seguro/a', FALSE FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5580844_4473479_sound.mp3';
