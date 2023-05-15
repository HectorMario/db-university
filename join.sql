1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `surname`, `degrees`.`name`
FROM `students` 
JOIN `degrees`
ON `degrees`.`id` = `degree_id`
WHERE `degrees`.`id` = 53
2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `departments`.`name` , `degrees`.`name`
FROM `degrees` 
JOIN `departments`
ON `departments`.`id` = `department_id`
WHERE `department_id` = 7
3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`name`, `teachers`.`surname`, `courses`.`name` 
FROM `course_teacher` 
JOIN `teachers`
ON `teachers`.`id` = `teacher_id`
JOIN `courses`
ON `courses`.`id` = `course_id`
WHERE `teacher_id` = 44
4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `surname`, `students`.`name`, `degrees`.`name` , `departments`.`name`
FROM `students` 
JOIN `degrees`
ON `degrees`.`id` = `degree_id`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `surname` ASC, `students`.`name` ASC
5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name`, `courses`.`name` , `teachers`.`name`, `teachers`.`surname`
FROM `degrees` 
JOIN `courses`
ON `courses`.`degree_id` = `department_id`
JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `teachers`.`name`, `teachers`.`surname` , `departments`.`name`
FROM `departments` 
JOIN `degrees`
ON `degrees`.`department_id` = `departments`.`id`
JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `departments`.`id` = 5
7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
superare ciascuno dei suoi esami
SELECT `students`.`name`, `students`.`surname`, `exams`.`id`, COUNT(*) AS 'repeat'
FROM `exam_student`
JOIN `exams` ON `exams`.`id` = `exam_id`
JOIN `students` ON `students`.`id` = `student_id`
GROUP BY `students`.`name`, `students`.`surname`, `exams`.`id`;

-- qua sereve il altro ragionamento se e' lo stesso essame
SELECT `students`.`name`, `students`.`surname`,`courses`.`name`, COUNT(*) AS 'repeat'
FROM `exam_student`
JOIN `exams` ON `exams`.`id` = `exam_id`
JOIN `students` ON `students`.`id` = `student_id`
JOIN `courses` ON `courses`.`id` = `exams`.`course_id`
GROUP BY `students`.`name`, `students`.`surname`, `courses`.`id`