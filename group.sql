1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS `student_number`, YEAR(`enrolment_date`)
FROM `students` 
GROUP BY YEAR(`enrolment_date`)
2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS 'teacher', `office_address`
FROM `teachers` 
GROUP BY `office_address`
3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) AS 'MEDIA'
FROM `exam_student` 
4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `departments`.`name`,  COUNT(*) AS 'corsi'
FROM `degrees` 
JOIN `departments`
ON `departments`.`id` = `department_id`
GROUP BY `departments`.`name`