create database cms_db;

use cms_db;

create table users (
                       user_id int auto_increment primary key,
                       username varchar(50) not null unique,
                       password varchar(255) not null,
                       role enum('Employee', 'Admin') not null,
                       created_at timestamp default current_timestamp
);

create table complaints (
                            complaint_id int auto_increment primary key,
                            title varchar(255) not null,
                            description text not null,
                            status enum('Submitted', 'In Progress', 'Resolved') default 'Submitted',
                            remarks text,
                            submitted_by_user_id int not null,
                            created_at timestamp default current_timestamp,
                            updated_at timestamp default current_timestamp on update current_timestamp,
                            constraint fk_complaints_users foreign key (submitted_by_user_id)
                                references users(user_id) on delete cascade
);

