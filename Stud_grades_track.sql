CREATE TABLE `Course`  (
  `course_id` smallint NOT NULL,
  `coursename` varchar(255) NULL,
  `professor_id` int NULL,
  `prof_username` varchar(255) NULL,
  PRIMARY KEY (`course_id`)
);

CREATE TABLE `Exam`  (
  `exam_id` int NOT NULL,
  `student_id` int NULL,
  `course_id` smallint NULL,
  `date` date NULL,
  `grade` decimal(0, 0) NULL,
  `prof_username` varchar(255) NULL,
  `coursename` varchar(255) NULL,
  PRIMARY KEY (`exam_id`)
);

CREATE TABLE `Faculty`  (
  `faculty_id` tinyint NOT NULL,
  `facultyname` varchar(255) NULL,
  PRIMARY KEY (`faculty_id`)
);

CREATE TABLE `Group`  (
  `group_id` smallint NOT NULL,
  `group_number` smallint NULL,
  `faculty_id` tinyint NULL,
  `facultyname` varchar(255) NULL,
  PRIMARY KEY (`group_id`)
);

CREATE TABLE `Professor`  (
  `professor_id` int NOT NULL,
  `prof_username` varchar(255) NULL,
  PRIMARY KEY (`professor_id`)
);

CREATE TABLE `Student`  (
  `student_id` int NOT NULL,
  `username` varchar(255) NULL,
  `grades_record_number` int NULL,
  `group_id` smallint NULL,
  `facultyname` varchar(255) NULL,
  PRIMARY KEY (`student_id`)
);

CREATE TABLE `Студент Copy 1`  (
  `кодСтудента` int NOT NULL,
  `ПІБ` varchar(255) NULL,
  `номерЗаліковоїКнижки` int NULL,
  PRIMARY KEY (`кодСтудента`)
);

CREATE TABLE `Студент Copy 3`  (
  `кодСтудента` int NOT NULL,
  `ПІБ` varchar(255) NULL,
  `номерЗаліковоїКнижки` int NULL,
  PRIMARY KEY (`кодСтудента`)
);

ALTER TABLE `Course` ADD CONSTRAINT `fk_course_proffesor` FOREIGN KEY (`professor_id`) REFERENCES `Professor` (`professor_id`);
ALTER TABLE `Exam` ADD CONSTRAINT `fk_exam_course` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);
ALTER TABLE `Exam` ADD CONSTRAINT `fk_exam_student` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`);
ALTER TABLE `Group` ADD CONSTRAINT `fk_group_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `Faculty` (`faculty_id`);
ALTER TABLE `Student` ADD CONSTRAINT `fk_student_group` FOREIGN KEY (`group_id`) REFERENCES `Group` (`group_id`);

CREATE VIEW `Track_view` AS SELECT
	Student.username, 
	Student.grades_record_number, 
	[Group].group_number, 
	Exam.[date], 
	Exam.grade, 
	Course.coursename, 
	Professor.prof_username
FROM
	[default].Student
	INNER JOIN
	[default].[Group]
	ON 
		Student.group_id = [Group].group_id
	INNER JOIN
	[default].Exam
	ON 
		Student.student_id = Exam.student_id
	INNER JOIN
	[default].Course
	ON 
		Exam.course_id = Course.course_id
	INNER JOIN
	[default].Professor
	ON 
		Course.professor_id = Professor.professor_id;

