-- Create user
create user {{ sonarqube_db_user }} with password '{{ sonarqube_db_user_password }}';
      
-- Create database
create database {{ sonarqube_db_name }}  with owner {{ sonarqube_db_user }} encoding 'UTF8';
