#homework
#1
#step one

CREATE SCHEMA `hospital` DEFAULT CHARACTER SET utf8 ;

#step two

CREATE TABLE `hospital`.`doctor` (
  `id_doctor` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `doctor_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_doctor`));

#step three

CREATE TABLE `hospital`.`patient` (
  `idpatient` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idpatient`));

#step four

CREATE TABLE `hospital`.`doctor_and_patient` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_doctor` INT UNSIGNED NOT NULL,
  `id_patient` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`));

#step five

INSERT INTO `hospital`.`doctor` (`id_doctor`, `doctor_name`) VALUES ('1', 'Aybolit');
INSERT INTO `hospital`.`doctor` (`id_doctor`, `doctor_name`) VALUES ('2', 'Bekbolot');
INSERT INTO `hospital`.`doctor` (`id_doctor`, `doctor_name`) VALUES ('3', 'Dinmuhamad');
INSERT INTO `hospital`.`doctor` (`id_doctor`, `doctor_name`) VALUES ('4', 'Nursultan');

#step six

INSERT INTO `hospital`.`patient` (`idpatient`, `patient_name`) VALUES ('1', 'QWERT');
INSERT INTO `hospital`.`patient` (`idpatient`, `patient_name`) VALUES ('2', 'Bokocho');
INSERT INTO `hospital`.`patient` (`idpatient`, `patient_name`) VALUES ('3', 'Sharapat');
INSERT INTO `hospital`.`patient` (`idpatient`, `patient_name`) VALUES ('4', 'Gulxhapchap');

#step seven

ALTER TABLE `hospital`.`doctor_and_patient` 
ADD INDEX `fk_doctor_and_patient_1_idx` (`id_doctor` ASC),
ADD INDEX `fk_doctor_and_patient_2_idx` (`id_patient` ASC);
ALTER TABLE `hospital`.`doctor_and_patient` 
ADD CONSTRAINT `fk_doctor_and_patient_1`
  FOREIGN KEY (`id_doctor`)
  REFERENCES `hospital`.`doctor` (`id_doctor`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_doctor_and_patient_2`
  FOREIGN KEY (`id_patient`)
  REFERENCES `hospital`.`patient` (`idpatient`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

#step eight

USE hospital;
SELECT * FROM doctor_and_patient
JOIN doctor ON doctor.id_doctor=doctor_and_patient.id_doctor
JOIN patient ON patient.idpatient=doctor_and_patient.id_patient;

#2
employees - “ многиe ко многим”: dept_emp, dept_manager
“один ко многим”: salaries, titles

#3
#step one

CREATE SCHEMA `student_and_cours` DEFAULT CHARACTER SET utf8 ;

#step two

CREATE TABLE `student_and_cours`.`student` (
  `id_student` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_student`));

#step three

CREATE TABLE `student_and_cours`.`course` (
  `id_course` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_course`));

#step four

CREATE TABLE `student_and_cours`.`s_and_c` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_student` INT UNSIGNED NOT NULL,
  `id_course` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`));


#step five

INSERT INTO `student_and_cours`.`course` (`id_course`, `course_name`) VALUES ('1', 'python');
INSERT INTO `student_and_cours`.`course` (`id_course`, `course_name`) VALUES ('2', 'php');
INSERT INTO `student_and_cours`.`course` (`id_course`, `course_name`) VALUES ('3', 'front-end');

#step six

INSERT INTO `student_and_cours`.`student` (`id_student`, `student_name`) VALUES ('1', 'Stev');
INSERT INTO `student_and_cours`.`student` (`id_student`, `student_name`) VALUES ('2', 'Bekbolot');
INSERT INTO `student_and_cours`.`student` (`id_student`, `student_name`) VALUES ('3', 'Bob');

#step seven

ALTER TABLE `student_and_cours`.`s_and_c` 
ADD INDEX `fk_s_and_c_1_idx` (`id_course` ASC),
ADD INDEX `fk_s_and_c_2_idx` (`id_student` ASC);
ALTER TABLE `student_and_cours`.`s_and_c` 
ADD CONSTRAINT `fk_s_and_c_1`
  FOREIGN KEY (`id_course`)
  REFERENCES `student_and_cours`.`course` (`id_course`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_s_and_c_2`
  FOREIGN KEY (`id_student`)
  REFERENCES `student_and_cours`.`student` (`id_student`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

#step eight

USE student_and_cours;
SELECT * FROM s_and_c
JOIN student ON student.id_student=s_and_c.id_student
JOIN course ON course.id_course=s_and_c.id_course;






