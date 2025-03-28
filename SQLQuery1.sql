CREATE TABLE Board_Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(200) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL, -- 암호화된 문자열 저장
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL
);

CREATE TABLE Board_Posts (
    PostId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    Title NVARCHAR(200) NOT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    ViewCount INT NOT NULL DEFAULT 0,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,
    FOREIGN KEY (UserId) REFERENCES Board_Users(UserId)
);

CREATE TABLE Board_Comments (
    CommentId INT IDENTITY(1,1) PRIMARY KEY,
    PostId INT NOT NULL,
    UserId INT NOT NULL,
    ParentCommentId INT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,
    FOREIGN KEY (PostId) REFERENCES Board_Posts(PostId),
    FOREIGN KEY (UserId) REFERENCES Board_Users(UserId),
    FOREIGN KEY (ParentCommentId) REFERENCES Board_Comments(CommentId)
);

CREATE TABLE Board_PostLikes (
    PostLikeId INT IDENTITY(1,1) PRIMARY KEY,
    PostId INT NOT NULL,
    UserId INT NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT UQ_PostLike UNIQUE(PostId, UserId), -- 중복 방지
    FOREIGN KEY (PostId) REFERENCES Board_Posts(PostId),
    FOREIGN KEY (UserId) REFERENCES Board_Users(UserId)
);

CREATE TABLE Board_CommentLikes (
    CommentLikeId INT IDENTITY(1,1) PRIMARY KEY,
    CommentId INT NOT NULL,
    UserId INT NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT UQ_CommentLike UNIQUE(CommentId, UserId), -- 중복 방지
    FOREIGN KEY (CommentId) REFERENCES Board_Comments(CommentId),
    FOREIGN KEY (UserId) REFERENCES Board_Users(UserId)
);

