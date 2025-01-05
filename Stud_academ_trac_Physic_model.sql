CREATE TABLE [Course] (
  [course_id] int NOT NULL,
  [coursename] varchar(255) NULL,
  [professor_id] int NULL,
  CONSTRAINT [_copy_5] PRIMARY KEY CLUSTERED ([course_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Exam] (
  [exam_id] int NOT NULL,
  [student_id] int NULL,
  [professor_id] int NULL,
  [date] date NULL,
  [grade] real NULL,
  CONSTRAINT [_copy_1] PRIMARY KEY CLUSTERED ([exam_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Faculty] (
  [faculty_id] int NOT NULL,
  [facultyname] varchar(255) NULL,
  CONSTRAINT [_copy_3] PRIMARY KEY CLUSTERED ([faculty_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Group] (
  [group_id] int NOT NULL,
  [group_number] int NULL,
  [faculty_id] int NULL,
  CONSTRAINT [_copy_4] PRIMARY KEY CLUSTERED ([group_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Proffesor] (
  [professor_id] int NOT NULL,
  [username] varchar(255) NULL,
  CONSTRAINT [_copy_6] PRIMARY KEY CLUSTERED ([professor_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Student] (
  [student_id] int NOT NULL,
  [username] varchar(255) NULL,
  [grades_record_number] int NULL,
  [group_id] int NULL,
  CONSTRAINT [_copy_2] PRIMARY KEY CLUSTERED ([student_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

ALTER TABLE [Course] ADD CONSTRAINT [fk_course_proffesor] FOREIGN KEY ([professor_id]) REFERENCES [Proffesor] ([professor_id])
GO
ALTER TABLE [Exam] ADD CONSTRAINT [fk_exam_professor] FOREIGN KEY ([professor_id]) REFERENCES [Proffesor] ([professor_id])
GO
ALTER TABLE [Exam] ADD CONSTRAINT [fk_exam_student] FOREIGN KEY ([student_id]) REFERENCES [Student] ([student_id])
GO
ALTER TABLE [Group] ADD CONSTRAINT [fk_group_faculty] FOREIGN KEY ([faculty_id]) REFERENCES [Faculty] ([faculty_id])
GO
ALTER TABLE [Student] ADD CONSTRAINT [fk_student_group] FOREIGN KEY ([group_id]) REFERENCES [Group] ([group_id])
GO

