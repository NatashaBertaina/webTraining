
-- ========================================
-- TRAININGS Parte 2
-- ========================================
INSERT INTO trainingApp_training (
    name_training, pub_date, modificationDate, difficulty, estimatedDuration, 
    attempts_allowed, state_training, name_training_en, name_training_es
) VALUES
('Funciones + Ruido - Ejercitación', '2024-05-31 22:13:42.913114', '2024-06-27 12:16:19.291853', 'Intermedio', 10, 4, 'Activo', 'Functions + Noise - Practice', 'Funciones + Ruido - Ejercitación'),
('Estrellas y Galaxias', '2024-06-10 22:26:46.749132', '2024-06-26 12:35:32.339507', 'Inicial', 20, 5, 'Activo', 'Stars and Galaxies', 'Estrellas y Galaxias'),
('Espectros', '2024-06-12 16:04:26.673599', '2024-06-26 12:35:27.686589', 'Intermedio', 10, 5, 'Activo', 'Spectra', 'Espectros'),
('Muongrafía', '2024-06-18 14:30:55.803945', '2024-06-26 12:35:19.954005', 'Intermedio', 10, 5, 'Activo', 'Muonography', 'Muongrafía');

INSERT INTO trainingApp_block (
    name_block, description, estimed_duration_block, state_block, training_id,
    name_block_en, name_block_es, description_en, description_es
) VALUES
('Funciones mas Ruido tipo 3', 'Funciones en combinación con ruido con una SNR 30', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Funciones + Ruido - Ejercitación'), 'Functions plus Noise type 3', 'Funciones mas Ruido tipo 3', 'Functions in combination with noise with SNR 30', 'Funciones en combinación con ruido con una SNR 30'),
('Funciones mas Ruido tipo 4', 'Funciones en combinación con ruido con una SNR 30', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Funciones + Ruido - Ejercitación'), 'Functions plus Noise type 4', 'Funciones mas Ruido tipo 4', 'Functions in combination with noise with SNR 30', 'Funciones en combinación con ruido con una SNR 30'),

('Curvas de luz', 'Presentacion de curvas de luz y su clasificación', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Estrellas y Galaxias'), 'Light curves', 'Curvas de luz', 'Presentation of light curves and their classification', 'Presentacion de curvas de luz y su clasificación'),
('Galaxias', 'Espectros de galaxias. Se deben identificar picos en estos.', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Estrellas y Galaxias'), 'Galaxies', 'Galaxias', 'Galaxy spectra. Peaks must be identified in these.', 'Espectros de galaxias. Se deben identificar picos en estos.'),

('Estrellas', 'Presentación de espectros de estrellas y su clasificación', 5, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Espectros'), 'Stars', 'Estrellas', 'Presentation of stellar spectra and their classification', 'Presentación de espectros de estrellas y su clasificación'),
('Estrellas y Galaxias', 'Lineas de absorción y emisión para su clasificación en estrellas o galaxias', 10, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Espectros'), 'Stars and Galaxies', 'Estrellas y Galaxias', 'Absorption and emission lines for classification into stars or galaxies', 'Lineas de absorción y emisión para su clasificación en estrellas o galaxias'),

('Muones', 'Ejercicios de existencia o no de muones', 10, 'Activo', (SELECT id FROM trainingApp_training WHERE name_training = 'Muongrafía'), 'Muons', 'Muones', 'Exercises on the existence or non-existence of muons', 'Ejercicios de existencia o no de muones');

INSERT INTO trainingApp_deploy (
    block_id, question, deploy_image, deploy_sound,
    question_en, question_es
) VALUES
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones mas Ruido tipo 3'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/Decr-Cte-Creplot_noise.png', 'trainingApp/sound/Decr-Cte-Cre_noise.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones mas Ruido tipo 3'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_TtDvWAx.png', 'trainingApp/sound/Cte-Decr-Cre_noise.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones mas Ruido tipo 3'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/Decr-Cte-Decrplot_noise.png', 'trainingApp/sound/Decr-Cte-Decr_noise.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones mas Ruido tipo 3'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_hT0cyGj.png', 'trainingApp/sound/Cre-Cte-Decr_noise.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),

((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones mas Ruido tipo 4'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/Cre-Cte-Creplot_noise.png', 'trainingApp/sound/Cre-Cte-Cre_noise.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones mas Ruido tipo 4'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_JUOD5Fe.png', 'trainingApp/sound/Coseno-Cre-Decr_noise.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones mas Ruido tipo 4'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/Cubica-Cte-Decrplot_noise.png', 'trainingApp/sound/Cubica-Cte-Decr_noise.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Funciones mas Ruido tipo 4'), 'Lo que usted escuchó fue una combinación de:', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_ECeqF9S.png', 'trainingApp/sound/Cre-Seno-Cte_noise.mp3', 'What you heard was a combination of:', 'Lo que usted escuchó fue una combinación de:'),

((SELECT id FROM trainingApp_block WHERE name_block = 'Curvas de luz'), 'Escuchó una curva de luz del tipo:', 'trainingApp/images/ASASSN-V_J000059.21605732.5.csv_plot.png', 'trainingApp/sound/ASASSN-V_J000059.21605732.5.csv_sound.wav', 'You heard a light curve of type:', 'Escuchó una curva de luz del tipo:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Curvas de luz'), 'Escuchó una curva de luz del tipo:', 'trainingApp/images/ASASSN-V_J003016.19-462759.5.csv_plot.png', 'trainingApp/sound/ASASSN-V_J003016.19-462759.5.csv_sound.wav', 'You heard a light curve of type:', 'Escuchó una curva de luz del tipo:'),

((SELECT id FROM trainingApp_block WHERE name_block = 'Galaxias'), '¿Cuántos Picos identifica?', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_jHXAqkJ.png', 'trainingApp/sound/SDSS_J151806.13424445.0_1_sound.mp3', 'How many peaks do you identify?', '¿Cuántos Picos identifica?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Galaxias'), '¿Cuántos Picos identifica?', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_VHFK1uD.png', 'trainingApp/sound/SDSS_J151806.13424445.0_3_sound.mp3', 'How many peaks do you identify?', '¿Cuántos Picos identifica?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Galaxias'), '¿Cuántos Picos y valles identifica?', 'trainingApp/images/SDSS_J115845.43-002715.7_2plot.png', 'trainingApp/sound/SDSS_J115845.43-002715.7_2_sound.mp3', 'How many peaks and valleys do you identify?', '¿Cuántos Picos y valles identifica?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Galaxias'), '¿Cuántos Picos y valles identifica?', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_8naOFEP.png', 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound.mp3', 'How many peaks and valleys do you identify?', '¿Cuántos Picos y valles identifica?'),

((SELECT id FROM trainingApp_block WHERE name_block = 'Estrellas' AND description LIKE '%espectros%'), 'El tipo de estrella es:', 'trainingApp/images/plot.png', 'trainingApp/sound/O5.mp3', 'The star type is:', 'El tipo de estrella es:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Estrellas' AND description LIKE '%espectros%'), 'El tipo de estrella es:', 'trainingApp/images/plot_SX6vdB3.png', 'trainingApp/sound/A5_9lmfZmp.mp3', 'The star type is:', 'El tipo de estrella es:'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Estrellas' AND description LIKE '%espectros%'), 'El tipo de estrella es:', 'trainingApp/images/plot_mebr53S.png', 'trainingApp/sound/unknown.mp3', 'The star type is:', 'El tipo de estrella es:'),

((SELECT id FROM trainingApp_block WHERE name_block = 'Estrellas y Galaxias' AND description LIKE '%absorción%'), '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/SDSS_J115845.43-002715.7_1plot.png', 'trainingApp/sound/SDSS_J115845.43-002715.7_1_sound.mp3', 'What you heard was a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Estrellas y Galaxias' AND description LIKE '%absorción%'), '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_hmZdBma.png', 'trainingApp/sound/A5_ldIy8TB.mp3', 'What you heard was a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Estrellas y Galaxias' AND description LIKE '%absorción%'), '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/SDSS_J151806.13424445.0_2plot.png', 'trainingApp/sound/SDSS_J151806.13424445.0_2_sound.mp3', 'What you heard was a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Estrellas y Galaxias' AND description LIKE '%absorción%'), '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_RAqz5qF.png', 'trainingApp/sound/SDSS_J115845.43-002715.7_3_sound.mp3', 'What you heard was a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Estrellas y Galaxias' AND description LIKE '%absorción%'), '¿Lo que escuchó fue una estrella o una galaxia?', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_R2asZoU.png', 'trainingApp/sound/G0_wLxE5bO.mp3', 'What you heard was a star or a galaxy?', '¿Lo que escuchó fue una estrella o una galaxia?'),

((SELECT id FROM trainingApp_block WHERE name_block = 'Muones'), '¿Se captó un muon?', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_5CzbRBZ.png', 'trainingApp/sound/5762520_3538527_soundline.mp3', 'Was a muon captured?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Muones'), '¿Se captó un muon?', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_x6WkjKk.png', 'trainingApp/sound/5793328_1297611_sound.mp3', 'Was a muon captured?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Muones'), '¿Se captó un muon?', 'trainingApp/images/5796449_1300732line_plot.png', 'trainingApp/sound/5796449_1300732_soundline.mp3', 'Was a muon captured?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Muones'), '¿Se captó un muon?', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_Ywan89M.png', 'trainingApp/sound/5565547_19009797_soundline.mp3', 'Was a muon captured?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Muones'), '¿Se captó un muon?', 'trainingApp/images/5578073_4470708_plot.png', 'trainingApp/sound/5578073_4470708_sound.mp3', 'Was a muon captured?', '¿Se captó un muon?'),
((SELECT id FROM trainingApp_block WHERE name_block = 'Muones'), '¿Se captó un muon?', 'trainingApp/images/Entrenamiento_sin_imagen_-_Sólo_sonido_UsTfk6g.png', 'trainingApp/sound/5587922_22852548_sound.mp3', 'Was a muon captured?', '¿Se captó un muon?');

-- ========================================
-- CHOICES 
-- Choices para deploy: Decr-Cte-Cre_noise.mp3 (Respuesta correcta: "Decreciente, Constante, Creciente")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Constante, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Cre_noise.mp3'), 'Constant, Increasing, Decreasing', 'Constante, Creciente, Decreciente', FALSE),
('Decreciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Cre_noise.mp3'), 'Decreasing, Constant, Increasing', 'Decreciente, Constante, Creciente', TRUE),
('Constante, Decreciente, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Cre_noise.mp3'), 'Constant, Decreasing, Increasing', 'Constante, Decreciente, Creciente', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Cre_noise.mp3'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Deploy Cte-Decr-Cre_noise.mp3 (Respuesta correcta: "Constante, Decreciente, Creciente")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Decr-Cre_noise.mp3'), 'Increasing, Constant, Decreasing', 'Creciente, Constante, Decreciente', FALSE),
('Constante, Decreciente, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Decr-Cre_noise.mp3'), 'Constant, Decreasing, Increasing', 'Constante, Decreciente, Creciente', TRUE),
('Decreciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Decr-Cre_noise.mp3'), 'Decreasing, Constant, Increasing', 'Decreciente, Constante, Creciente', FALSE),
('Creciente, Decreciente, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Decr-Cre_noise.mp3'), 'Increasing, Decreasing, Constant', 'Creciente, Decreciente, Constante', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cte-Decr-Cre_noise.mp3'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Deploy Decr-Cte-Decr_noise.mp3 (Respuesta correcta: "Decreciente, Constante, Decreciente")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Decr_noise.mp3'), 'Increasing, Constant, Decreasing', 'Creciente, Constante, Decreciente', FALSE),
('Constante, Decreciente, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Decr_noise.mp3'), 'Constant, Decreasing, Increasing', 'Constante, Decreciente, Creciente', FALSE),
('Decreciente, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Decr_noise.mp3'), 'Decreasing, Constant, Decreasing', 'Decreciente, Constante, Decreciente', TRUE),
('Creciente, Decreciente, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Decr_noise.mp3'), 'Increasing, Decreasing, Constant', 'Creciente, Decreciente, Constante', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Decr-Cte-Decr_noise.mp3'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Deploy Cre-Cte-Decr_noise.mp3 (Respuesta correcta: "Creciente, Constante, Decreciente")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Cte-Decr_noise.mp3'), 'Increasing, Constant, Decreasing', 'Creciente, Constante, Decreciente', TRUE),
('Constante, Decreciente, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Cte-Decr_noise.mp3'), 'Constant, Decreasing, Increasing', 'Constante, Decreciente, Creciente', FALSE),
('Decreciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Cte-Decr_noise.mp3'), 'Decreasing, Constant, Increasing', 'Decreciente, Constante, Creciente', FALSE),
('Creciente, Decreciente, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Cte-Decr_noise.mp3'), 'Increasing, Decreasing, Constant', 'Creciente, Decreciente, Constante', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Cte-Decr_noise.mp3'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Choices para el bloque tipo 4 con ruido
-- Deploy Cre-Cte-Cre_noise.mp3 (Respuesta correcta: "Creciente, Constante, Creciente")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Cte-Cre_noise.mp3'), 'Increasing, Constant, Increasing', 'Creciente, Constante, Creciente', TRUE),
('Constante, Creciente, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Cte-Cre_noise.mp3'), 'Constant, Increasing, Increasing', 'Constante, Creciente, Creciente', FALSE),
('Creciente, Creciente, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Cte-Cre_noise.mp3'), 'Increasing, Increasing, Constant', 'Creciente, Creciente, Constante', FALSE),
('Constante, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Cte-Cre_noise.mp3'), 'Constant, Constant, Increasing', 'Constante, Constante, Creciente', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Cte-Cre_noise.mp3'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Deploy Coseno-Cre-Decr_noise.mp3 (Respuesta correcta: "Curva, Creciente, Decreciente")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Decreciente, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Coseno-Cre-Decr_noise.mp3'), 'Decreasing, Increasing, Decreasing', 'Decreciente, Creciente, Decreciente', FALSE),
('Creciente, Curva, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Coseno-Cre-Decr_noise.mp3'), 'Increasing, Curve, Constant', 'Creciente, Curva, Constante', FALSE),
('Curva, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Coseno-Cre-Decr_noise.mp3'), 'Curve, Constant, Decreasing', 'Curva, Constante, Decreciente', FALSE),
('Curva, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Coseno-Cre-Decr_noise.mp3'), 'Curve, Increasing, Decreasing', 'Curva, Creciente, Decreciente', TRUE),
('Creciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Coseno-Cre-Decr_noise.mp3'), 'Increasing, Constant, Increasing', 'Creciente, Constante, Creciente', FALSE);

-- Deploy Cubica-Cte-Decr_noise.mp3 (Respuesta correcta: "Curva, Constante, Decreciente")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente, Curva, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cubica-Cte-Decr_noise.mp3'), 'Increasing, Curve, Constant', 'Creciente, Curva, Constante', FALSE),
('Decreciente, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cubica-Cte-Decr_noise.mp3'), 'Decreasing, Increasing, Decreasing', 'Decreciente, Creciente, Decreciente', FALSE),
('Curva, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cubica-Cte-Decr_noise.mp3'), 'Curve, Increasing, Decreasing', 'Curva, Creciente, Decreciente', FALSE),
('Curva, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cubica-Cte-Decr_noise.mp3'), 'Curve, Constant, Decreasing', 'Curva, Constante, Decreciente', TRUE),
('Creciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cubica-Cte-Decr_noise.mp3'), 'Increasing, Constant, Increasing', 'Creciente, Constante, Creciente', FALSE);

-- Deploy Cre-Seno-Cte_noise.mp3 (Respuesta correcta: "Creciente, Curva, Constante")
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Creciente, Constante, Creciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Seno-Cte_noise.mp3'), 'Increasing, Constant, Increasing', 'Creciente, Constante, Creciente', FALSE),
('Curva, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Seno-Cte_noise.mp3'), 'Curve, Increasing, Decreasing', 'Curva, Creciente, Decreciente', FALSE),
('Curva, Constante, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Seno-Cte_noise.mp3'), 'Curve, Constant, Decreasing', 'Curva, Constante, Decreciente', FALSE),
('Decreciente, Creciente, Decreciente', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Seno-Cte_noise.mp3'), 'Decreasing, Increasing, Decreasing', 'Decreciente, Creciente, Decreciente', FALSE),
('Creciente, Curva, Constante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/Cre-Seno-Cte_noise.mp3'), 'Increasing, Curve, Constant', 'Creciente, Curva, Constante', TRUE);

-- Choices para deploy_id 60: SDSS_J151806.13424445.0_2_sound.mp3 (Galaxia)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Galaxia', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_2_sound.mp3'), 'Galaxy', 'Galaxia', TRUE),
('Estrella', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_2_sound.mp3'), 'Star', 'Estrella', FALSE),
('Ninguna', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_2_sound.mp3'), 'None', 'Ninguna', FALSE);

-- Choices para deploy_id 61: SDSS_J115845.43-002715.7_3_sound.mp3 (Galaxia)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Estrella', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_3_sound.mp3'), 'Star', 'Estrella', FALSE),
('Galaxia', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_3_sound.mp3'), 'Galaxy', 'Galaxia', TRUE),
('Ninguna', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_3_sound.mp3'), 'None', 'Ninguna', FALSE);

-- Choices para deploy_id 62: G0_wLxE5bO.mp3 (Estrella)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Estrella', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/G0_wLxE5bO.mp3'), 'Star', 'Estrella', TRUE),
('Galaxia', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/G0_wLxE5bO.mp3'), 'Galaxy', 'Galaxia', FALSE),
('Ninguna', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/G0_wLxE5bO.mp3'), 'None', 'Ninguna', FALSE);

-- Choices para deploy_id 58: SDSS_J115845.43-002715.7_1_sound.mp3 (Galaxia)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Estrella', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_1_sound.mp3'), 'Star', 'Estrella', FALSE),
('Galaxia', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_1_sound.mp3'), 'Galaxy', 'Galaxia', TRUE),
('Ninguna', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_1_sound.mp3'), 'None', 'Ninguna', FALSE);

-- Choices para deploy_id 59: A5_ldIy8TB.mp3 (Estrella)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Ninguna', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/A5_ldIy8TB.mp3'), 'None', 'Ninguna', FALSE),
('Galaxia', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/A5_ldIy8TB.mp3'), 'Galaxy', 'Galaxia', FALSE),
('Estrella', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/A5_ldIy8TB.mp3'), 'Star', 'Estrella', TRUE);

-- Choices para conteo de picos y valles 
-- Deploy 63: SDSS_J151806.13424445.0_1_sound.mp3 (Respuesta correcta: 1 pico)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('3', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_1_sound.mp3'), '3', '3', FALSE),
('1', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_1_sound.mp3'), '1', '1', TRUE),
('2', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_1_sound.mp3'), '2', '2', FALSE),
('No identifico picos', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_1_sound.mp3'), 'No peaks identified', 'No identifico picos', FALSE);

-- Deploy 64: SDSS_J151806.13424445.0_3_sound.mp3 (Respuesta correcta: 6 picos)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('5', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_3_sound.mp3'), '5', '5', FALSE),
('7', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_3_sound.mp3'), '7', '7', FALSE),
('6', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_3_sound.mp3'), '6', '6', TRUE),
('3', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_3_sound.mp3'), '3', '3', FALSE),
('4', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J151806.13424445.0_3_sound.mp3'), '4', '4', FALSE);

-- Deploy 65: SDSS_J115845.43-002715.7_2_sound.mp3 (Respuesta correcta: 3 picos y valles)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('3', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_2_sound.mp3'), '3', '3', TRUE),
('4', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_2_sound.mp3'), '4', '4', FALSE),
('6', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_2_sound.mp3'), '6', '6', FALSE),
('5', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_2_sound.mp3'), '5', '5', FALSE);

-- Deploy 66: SDSS_J115845.43-002715.7_4_sound.mp3 (Respuesta correcta: 4 picos y valles)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('3', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound.mp3'), '3', '3', FALSE),
('4', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound.mp3'), '4', '4', TRUE),
('5', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/SDSS_J115845.43-002715.7_4_sound.mp3'), '5', '5', FALSE);

-- Choices para muones 
-- Deploy 67: 5762520_3538527_soundline.mp3 (Respuesta correcta: Si)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('No', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5762520_3538527_soundline.mp3'), 'No', 'No', FALSE),
('Si', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5762520_3538527_soundline.mp3'), 'Yes', 'Si', TRUE),
('No estoy seguro/a', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5762520_3538527_soundline.mp3'), 'I am not sure', 'No estoy seguro/a', FALSE);

-- Deploy 68: 5793328_1297611_sound.mp3 (Respuesta correcta: No)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('No', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5793328_1297611_sound.mp3'), 'No', 'No', TRUE),
('Si', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5793328_1297611_sound.mp3'), 'Yes', 'Si', FALSE),
('No estoy seguro/a', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5793328_1297611_sound.mp3'), 'I am not sure', 'No estoy seguro/a', FALSE);

-- Deploy 69: 5796449_1300732_soundline.mp3 (Respuesta correcta: Si)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('No', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5796449_1300732_soundline.mp3'), 'No', 'No', FALSE),
('Si', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5796449_1300732_soundline.mp3'), 'Yes', 'Si', TRUE),
('No estoy seguro/a', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5796449_1300732_soundline.mp3'), 'I am not sure', 'No estoy seguro/a', FALSE);

-- Deploy 70: 5565547_19009797_soundline.mp3 (Respuesta correcta: Si)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('No', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5565547_19009797_soundline.mp3'), 'No', 'No', FALSE),
('Si', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5565547_19009797_soundline.mp3'), 'Yes', 'Si', TRUE),
('No estoy seguro/a', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5565547_19009797_soundline.mp3'), 'I am not sure', 'No estoy seguro/a', FALSE);

-- Deploy 71: 5578073_4470708_sound.mp3 (Respuesta correcta: No)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('No', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5578073_4470708_sound.mp3'), 'No', 'No', TRUE),
('Si', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5578073_4470708_sound.mp3'), 'Yes', 'Si', FALSE),
('No estoy seguro/a', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5578073_4470708_sound.mp3'), 'I am not sure', 'No estoy seguro/a', FALSE);

-- Deploy 72: 5587922_22852548_sound.mp3 (Respuesta correcta: No)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('No', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5587922_22852548_sound.mp3'), 'No', 'No', TRUE),
('Si', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5587922_22852548_sound.mp3'), 'Yes', 'Si', FALSE),
('No estoy seguro/a', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/5587922_22852548_sound.mp3'), 'I am not sure', 'No estoy seguro/a', FALSE);

-- Choices para curvas de luz 
-- Deploy 53: ASASSN-V_J000059.21605732.5.csv_sound.wav (Respuesta correcta: Cefeida)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Binaria eclipsante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J000059.21605732.5.csv_sound.wav'), 'Eclipsing binary', 'Binaria eclipsante', FALSE),
('Cefeida', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J000059.21605732.5.csv_sound.wav'), 'Cepheid', 'Cefeida', TRUE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J000059.21605732.5.csv_sound.wav'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Deploy 54: ASASSN-V_J003016.19-462759.5.csv_sound.wav (Respuesta correcta: Binaria eclipsante)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Binaria eclipsante', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J003016.19-462759.5.csv_sound.wav'), 'Eclipsing binary', 'Binaria eclipsante', TRUE),
('Cefeida', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J003016.19-462759.5.csv_sound.wav'), 'Cepheid', 'Cefeida', FALSE),
('Ninguna de las anteriores', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/ASASSN-V_J003016.19-462759.5.csv_sound.wav'), 'None of the above', 'Ninguna de las anteriores', FALSE);

-- Choices para clasificación de estrellas 
-- Deploy 55: O5.mp3 (Respuesta correcta: O5)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('A5', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/O5.mp3'), 'A5', 'A5', FALSE),
('O5', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/O5.mp3'), 'O5', 'O5', TRUE),
('Desconocido', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/O5.mp3'), 'Unknown', 'Desconocido', FALSE),
('G0', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/O5.mp3'), 'G0', 'G0', FALSE);

-- Deploy 56: A5_9lmfZmp.mp3 (Respuesta correcta: A5)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('Desconocido', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/A5_9lmfZmp.mp3'), 'Unknown', 'Desconocido', FALSE),
('A5', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/A5_9lmfZmp.mp3'), 'A5', 'A5', TRUE),
('G0', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/A5_9lmfZmp.mp3'), 'G0', 'G0', FALSE),
('O5', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/A5_9lmfZmp.mp3'), 'O5', 'O5', FALSE);

-- Deploy 57: unknown.mp3 (Respuesta correcta: Desconocido)
INSERT INTO trainingApp_choice (choice, deploy_id, choice_en, choice_es, correctChoice) VALUES
('O5', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/unknown.mp3'), 'O5', 'O5', FALSE),
('A5', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/unknown.mp3'), 'A5', 'A5', FALSE),
('G0', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/unknown.mp3'), 'G0', 'G0', FALSE),
('Desconocido', (SELECT id FROM trainingApp_deploy WHERE deploy_sound = 'trainingApp/sound/unknown.mp3'), 'Unknown', 'Desconocido', TRUE);
