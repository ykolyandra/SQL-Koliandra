CREATE TABLE [Course] (
  [course_id] smallint NOT NULL,
  [coursename] varchar(255) NULL,
  [professor_id] smallint NULL,
  [prof_username] varchar(255) NULL,
  CONSTRAINT [_copy_5] PRIMARY KEY CLUSTERED ([course_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Exam] (
  [exam_id] int NOT NULL,
  [student_id] int NULL,
  [course_id] smallint NULL,
  [date] date NULL,
  [grade] decimal DEFAULT '' NULL,
  [prof_username] varchar(255) NULL,
  [coursename] varchar(255) NULL,
  CONSTRAINT [_copy_1] PRIMARY KEY CLUSTERED ([exam_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Faculty] (
  [faculty_id] tinyint NOT NULL,
  [facultyname] varchar(255) NULL,
  CONSTRAINT [_copy_3] PRIMARY KEY CLUSTERED ([faculty_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Group] (
  [group_id] smallint NOT NULL,
  [group_number] smallint NULL,
  [faculty_id] tinyint NULL,
  [facultyname] varchar(255) NULL,
  CONSTRAINT [_copy_4] PRIMARY KEY CLUSTERED ([group_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Professor] (
  [professor_id] int NOT NULL,
  [prof_username] varchar(255) NULL,
  CONSTRAINT [_copy_6] PRIMARY KEY CLUSTERED ([professor_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Student] (
  [student_id] int NOT NULL,
  [username] varchar(255) NULL,
  [grades_record_number] int NULL,
  [group_id] smallint NULL,
  [facultyname] varchar(255) NULL,
  CONSTRAINT [_copy_2] PRIMARY KEY CLUSTERED ([student_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Студент Copy 1] (
  [кодСтудента] int NOT NULL,
  [ПІБ] varchar(255) NULL,
  [номерЗаліковоїКнижки] int NULL,
  PRIMARY KEY CLUSTERED ([кодСтудента])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Студент Copy 3] (
  [кодСтудента] int NOT NULL,
  [ПІБ] varchar(255) NULL,
  [номерЗаліковоїКнижки] int NULL,
  CONSTRAINT [_copy_7] PRIMARY KEY CLUSTERED ([кодСтудента])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

ALTER TABLE [Course] ADD CONSTRAINT [fk_course_proffesor] FOREIGN KEY ([professor_id]) REFERENCES [Professor] ([professor_id]) ON DELETE NO ACTION
GO
ALTER TABLE [Exam] ADD CONSTRAINT [fk_exam_course] FOREIGN KEY ([course_id]) REFERENCES [Course] ([course_id]) ON DELETE NO ACTION
GO
ALTER TABLE [Exam] ADD CONSTRAINT [fk_exam_student] FOREIGN KEY ([student_id]) REFERENCES [Student] ([student_id]) ON DELETE NO ACTION
GO
ALTER TABLE [Group] ADD CONSTRAINT [fk_group_faculty] FOREIGN KEY ([faculty_id]) REFERENCES [Faculty] ([faculty_id])
GO
ALTER TABLE [Student] ADD CONSTRAINT [fk_student_group] FOREIGN KEY ([group_id]) REFERENCES [Group] ([group_id])
GO

CREATE VIEW [track_view] AS SELECT
	Student.username, 
	Student.grades_record_number, 
	Student.group_id, 
	Exam.exam_id, 
	Exam.coursename, 
	Exam.[date], 
	Exam.grade, 
	Exam.prof_username
FROM
	[default].Student
	INNER JOIN
	[default].Exam
	ON 
		Student.student_id = Exam.student_id
GO

CREATE VIEW [Track_view] AS SELECT
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
		Course.professor_id = Professor.professor_id
GO

