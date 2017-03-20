/* 
 * Copyright (c) 2017, SolidX
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
/**
 * Author:  SolidX
 * Created: Mar 19, 2017
 */

DROP DATABASE IF EXISTS solidus_slate;
CREATE DATABASE solidus_slate;
USE solidus_slate;

CREATE TABLE polls (
	poll_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	poll_name VARCHAR(64) NOT NULL,
	poll_start DATETIME NOT NULL,
	poll_close DATETIME NOT NULL
);

CREATE TABLE questions (
	question_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	question_text VARCHAR(1024) NOT NULL,
	question_order INT NOT NULL,
	poll_id INT NOT NULL,
	FOREIGN KEY (poll_id) REFERENCES polls(poll_id)
);

CREATE TABLE options (
	option_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	option_text VARCHAR(256) NOT NULL,
	option_order INT NULL,
	question_id INT NOT NULL,
	FOREIGN KEY (question_id) REFERENCES questions(question_id)
);