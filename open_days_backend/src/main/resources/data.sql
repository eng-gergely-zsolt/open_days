DELETE FROM enrolled_users
DELETE FROM roles_authorities
DELETE FROM participated_users

DELETE FROM events
DELETE FROM users
DELETE FROM roles
DELETE FROM activities
DELETE FROM authorities
DELETE FROM organizer_emails

DELETE FROM institutions
DELETE FROM settlements
DELETE FROM counties

--Organizer emails
INSERT INTO organizer_emails (id, email) VALUES (1, 'geergely.zsolt@gmail.com')

--Counties
INSERT INTO counties (id, name) VALUES (1, 'Kovászna')
INSERT INTO counties (id, name) VALUES (2, 'Hargita')
INSERT INTO counties (id, name) VALUES (3, 'Maros')

--Settlements
INSERT INTO settlements (id, name, county_id) VALUES (1, 'Balánbánya', 2)
INSERT INTO settlements (id, name, county_id) VALUES (2, 'Borszék', 2)
INSERT INTO settlements (id, name, county_id) VALUES (3, 'Csíkszentmárton', 2)
INSERT INTO settlements (id, name, county_id) VALUES (4, 'Csíkszereda', 2)
INSERT INTO settlements (id, name, county_id) VALUES (5, 'Dánfalva', 2)
INSERT INTO settlements (id, name, county_id) VALUES (6, 'Ditró', 2)
INSERT INTO settlements (id, name, county_id) VALUES (7, 'Gyergyóalfalu', 2)
INSERT INTO settlements (id, name, county_id) VALUES (8, 'Gyergyóholló', 2)
INSERT INTO settlements (id, name, county_id) VALUES (9, 'Gyergyószentmiklós', 2)
INSERT INTO settlements (id, name, county_id) VALUES (10, 'Gyergyóvárhegy', 2)
INSERT INTO settlements (id, name, county_id) VALUES (11, 'Gyímesfelsőlok', 2)
INSERT INTO settlements (id, name, county_id) VALUES (12, 'Korond', 2)
INSERT INTO settlements (id, name, county_id) VALUES (13, 'Maroshévíz', 2)
INSERT INTO settlements (id, name, county_id) VALUES (14, 'Székelykeresztúr', 2)
INSERT INTO settlements (id, name, county_id) VALUES (15, 'Székelyudvarhely', 2)
INSERT INTO settlements (id, name, county_id) VALUES (16, 'Szentegyháza', 2)
INSERT INTO settlements (id, name, county_id) VALUES (17, 'Zetelaka', 2)

INSERT INTO settlements (id, name, county_id) VALUES (18, 'Marosvásárhely', 3)

--Institutions
INSERT INTO institutions (id, name, settlement_id) VALUES (1, 'Liviu Rebreanu Szakközépiskola', 1)
INSERT INTO institutions (id, name, settlement_id) VALUES (2, 'Zimmethausen Szaklíceum', 2)
INSERT INTO institutions (id, name, settlement_id) VALUES (3, 'Tivai Nagy Imre Szakközépiskola', 3)
INSERT INTO institutions (id, name, settlement_id) VALUES (4, 'Márton Áron Főgimnázium', 4)
INSERT INTO institutions (id, name, settlement_id) VALUES (5, 'Segítő Mária Római Katolikus Gimnázium', 4)
INSERT INTO institutions (id, name, settlement_id) VALUES (6, 'Kájoni János Szakközépiskola', 4)
INSERT INTO institutions (id, name, settlement_id) VALUES (7, 'Octavian Goga Főgimnázium', 4)
INSERT INTO institutions (id, name, settlement_id) VALUES (8, 'Kós Károly Szakközépiskola', 4)
INSERT INTO institutions (id, name, settlement_id) VALUES (9, 'Venczel József Szakközépiskola', 4)
INSERT INTO institutions (id, name, settlement_id) VALUES (10, 'Székely Károly Szakközépiskola', 4)
INSERT INTO institutions (id, name, settlement_id) VALUES (11, 'Petőfi Sándor Iskolaközpont', 5)
INSERT INTO institutions (id, name, settlement_id) VALUES (12, 'Puskás Tivadar Szakközépiskola', 6)
INSERT INTO institutions (id, name, settlement_id) VALUES (13, 'Sövér Elek Szakközépiskola', 7)
INSERT INTO institutions (id, name, settlement_id) VALUES (14, 'Gyergyóhollói Szakközépiskola', 8)
INSERT INTO institutions (id, name, settlement_id) VALUES (15, 'Salamon Ernő Gimnázium', 9)
INSERT INTO institutions (id, name, settlement_id) VALUES (16, 'Batthyany Ignác Technikai Kollégium', 9)
INSERT INTO institutions (id, name, settlement_id) VALUES (17, 'Sfântu Nicolae Gimnázium', 9)
INSERT INTO institutions (id, name, settlement_id) VALUES (18, 'Fogarasy Mihály Szakközépiskola', 9)
INSERT INTO institutions (id, name, settlement_id) VALUES (19, 'Miron Cristea Líceum', 10)
INSERT INTO institutions (id, name, settlement_id) VALUES (20, 'Árpád-házi Szent Erzsébet Római Katolikus Teológiai Líceum', 11)
INSERT INTO institutions (id, name, settlement_id) VALUES (21, 'Korondi Szakközépiskola', 12)
INSERT INTO institutions (id, name, settlement_id) VALUES (22, 'O.C. Tăslăuanu Gimnázium', 13)
INSERT INTO institutions (id, name, settlement_id) VALUES (23, 'Kemény János Elméleti Líceum', 13)
INSERT INTO institutions (id, name, settlement_id) VALUES (24, 'Mihai Eminescu Főgimnázium', 13)
INSERT INTO institutions (id, name, settlement_id) VALUES (25, 'Berde Mózes Unitárius Gimnázium', 14)
INSERT INTO institutions (id, name, settlement_id) VALUES (26, 'Orbán Balázs Gimnázium', 14)
INSERT INTO institutions (id, name, settlement_id) VALUES (27, 'Tamási Áron Gimnázium', 15)
INSERT INTO institutions (id, name, settlement_id) VALUES (28, 'Benedek Elek Pedagógiai Líceum', 15)
INSERT INTO institutions (id, name, settlement_id) VALUES (29, 'Baczkamadarasi Kis Gergely Református Kollégium', 15)
INSERT INTO institutions (id, name, settlement_id) VALUES (30, 'Kós Károly Szakközépiskola', 15)
INSERT INTO institutions (id, name, settlement_id) VALUES (31, 'Eötvos József Szakközépiskola', 15)
INSERT INTO institutions (id, name, settlement_id) VALUES (32, 'Marin Preda Líceum', 15)
INSERT INTO institutions (id, name, settlement_id) VALUES (33, 'Bányai János Műszaki Szakközépiskola', 15)
INSERT INTO institutions (id, name, settlement_id) VALUES (34, 'Gábor Áron Szakközépiskola', 16)
INSERT INTO institutions (id, name, settlement_id) VALUES (35, 'Dr. P. Boros Fortunát Elméleti Kozepiskola', 17)

INSERT INTO institutions (id, name, settlement_id) VALUES (36, 'Bólyai Farkas Líceum', 18)
INSERT INTO institutions (id, name, settlement_id) VALUES (37, 'Sapientia EMTE', 18)

--Roles
INSERT INTO roles (id, name) VALUES (1, 'ROLE_USER')
INSERT INTO roles (id, name) VALUES (2, 'ROLE_ORGANIZER')
INSERT INTO roles (id, name) VALUES (3, 'ROLE_ADMIN')

--Authorities
INSERT INTO authorities (id, name) VALUES (1, 'READ_AUTHORITY')
INSERT INTO authorities (id, name) VALUES (2, 'WRITE_AUTHORITY')
INSERT INTO authorities (id, name) VALUES (3, 'DELETE_AUTHORITY')

--Users
--Admin
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (1, 'admin@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'John', 'Doe', NULL, 'qwertyuiopasdf1', 'admin', 37, NULL, 3)

--Organizers
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (2, 'organizer@gmail.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Zsolt', 'Gergely', NULL, 'qwertyuiopasdf2', 'organizer', 37, 'user/placeholder.jpg', 2)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (3, 'csenge.albert.toth@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Csenge', 'Albert-Tóth', NULL, 'qwertyuiopasdf3', 'csenge', 37, NULL, 2)

--Users
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (4, 'user@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Zsolt', 'Gergely', NULL, 'qwertyuiopasdf4', 'user', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (5, 'user1@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Beáta', 'Bőjte', NULL, 'qwertyuiopasdf5', 'user1', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (6, 'user2@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Barbara', 'Bodó', NULL, 'qwertyuiopasdf6', 'user2', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (7, 'user3@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Anita', 'Konrád', NULL, 'qwertyuiopasdf7', 'user3', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (8, 'user4@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Ildikó', 'Albert', NULL, 'qwertyuiopasdf8', 'user4', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (9, 'user5@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Balázs', 'Bartalis', NULL, 'qwertyuiopasdf9', 'user5', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (10, 'user6@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'István', 'Adorján', NULL, 'qwertyuiopasd10', 'user6', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (11, 'user7@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Andor', 'Maxem', NULL, 'qwertyuiopasd11', 'user7', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (12, 'user8@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Gergő', 'Bakcsy', NULL, 'qwertyuiopasd12', 'user8', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (13, 'user9@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'István', 'Simó', NULL, 'qwertyuiopasd13', 'user9', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (14, 'user10@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Mónika', 'Ferencz', NULL, 'qwertyuiopasd14', 'user10', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (15, 'user11@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Boróka', 'Kovács', NULL, 'qwertyuiopasd15', 'user11', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (16, 'user12@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Andrea', 'Jakab', NULL, 'qwertyuiopasd16', 'user12', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (17, 'user13@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Noémi', 'Benedek', NULL, 'qwertyuiopasd17', 'user13', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (18, 'user14@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Krisztina', 'Tankó', NULL, 'qwertyuiopasd18', 'user14', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (19, 'user15@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Ágnes', 'Szász', NULL, 'qwertyuiopasd19', 'user15', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (20, 'user16@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Botond', 'Sándor', NULL, 'qwertyuiopasd20', 'user16', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (21, 'user17@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Örs', 'Székely', NULL, 'qwertyuiopasd21', 'user17', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (22, 'user18@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Hunor', 'Szőcs', NULL, 'qwertyuiopasd22', 'user18', 4, NULL, 1)
INSERT INTO users (id, email, email_verification_status, encrypted_password, first_name, last_name, otp_code, public_id, username, institution_id, image_path, role_id) VALUES (23, 'user19@mailinator.com', true, '$2a$10$z9BeqAxh0nY.kdpuvDi.xuP0mwIPgqK2WPtkTghwX3iAJJoHQ0MMm', 'Szilvia', 'Péter', NULL, 'qwertyuiopasd23', 'user19', 4, NULL, 1)

--Activities
INSERT INTO activities (id, name) VALUES (1, 'Kampusztúra')
INSERT INTO activities (id, name) VALUES (2, 'Gépészmérnöki tanszékbemutató')
INSERT INTO activities (id, name) VALUES (3, 'Kertészmérnöki tanszékbemutató')
INSERT INTO activities (id, name) VALUES (4, 'Villamosmérnöki tanszékbemutató')
INSERT INTO activities (id, name) VALUES (5, 'Matematika-Informatika tanszékbemutató')
INSERT INTO activities (id, name) VALUES (6, 'Alkalmazott Nyelvészeti tanszékbemutató')
INSERT INTO activities (id, name) VALUES (7, 'Alkalmazott Társadalomtudomanyok tanszékbemutató')

--Events
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (1, '2024-03-01 10:15', 'event/placeholder.jpg', false, 'Sapientia', NULL, 1, 2, 'A kampusztúrán bemutatjuk az érdeklődőknek az egyetem épületét. Érintve akönyvtárat, a Hallgató Önkormányzatot (HÖK), a sportpályát, a bentlakás épületét és a közösségi terünket,a placcot.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (2, '2024-03-01 11:20', 'event/placeholder.jpg', false, '312-es terem', NULL, 2, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (3, '2024-03-10 15:30', 'event/placeholder.jpg', false, 'Sportpálya', NULL, 3, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (4, '2024-03-15 09:30', 'event/placeholder.jpg', false, '114-es terem', NULL, 4, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (5, '2024-04-02 22:30', 'event/placeholder.jpg', false, '114-es tanterem', NULL, 5, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (6, '2024-04-22 19:45', 'event/placeholder.jpg', false, 'Aula', NULL, 6, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (7, '2024-05-26 07:12', 'event/placeholder.jpg', false, '1. emelet', NULL, 7, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (8, '2024-05-08 09:10', 'event/placeholder.jpg', true, '2. emelet', 'https://meeting.com', 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (9, '2022-05-08 09:10', 'event/placeholder.jpg', true, '2. emelet', 'https://meeting.com', 1, 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (10, '2024-08-08 09:10', 'event/placeholder.jpg', true, '2. emelet', 'https://meeting.com', 1, 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (11, '2022-04-22 19:45', 'event/placeholder.jpg', false, 'Aula', NULL, 6, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (12, '2022-05-26 07:12', 'event/placeholder.jpg', false, '1. emelet', NULL, 7, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (13, '2021-05-08 09:10', 'event/placeholder.jpg', true, '2. emelet', 'https://meeting.com', 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (14, '2021-05-08 09:10', 'event/placeholder.jpg', true, '2. emelet', 'https://meeting.com', 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')
INSERT INTO events (id, date_time, image_path, is_online, location, meeting_link, activity_id, organizer_id, description) VALUES (15, '2020-08-08 09:10', 'event/placeholder.jpg', true, '2. emelet', 'https://meeting.com', 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took agalley of type and scrambled it to make a type specimen book.')


--Roles-authorities
INSERT INTO roles_authorities (roles_id, authorities_id) VALUES (1, 1)
INSERT INTO roles_authorities (roles_id, authorities_id) VALUES (1, 2)
INSERT INTO roles_authorities (roles_id, authorities_id) VALUES (2, 1)
INSERT INTO roles_authorities (roles_id, authorities_id) VALUES (2, 2)
INSERT INTO roles_authorities (roles_id, authorities_id) VALUES (3, 1)
INSERT INTO roles_authorities (roles_id, authorities_id) VALUES (3, 2)
INSERT INTO roles_authorities (roles_id, authorities_id) VALUES (3, 3)

--Enrolled users
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 4)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 5)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 6)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 7)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 8)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 9)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 10)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 11)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 12)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 13)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 14)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 15)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 16)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 17)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 18)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 19)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 20)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 21)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 22)
INSERT INTO enrolled_users (event_id, user_id) VALUES (1, 23)

--Participated users
INSERT INTO participated_users (event_id, user_id) VALUES (11, 4)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 5)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 6)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 7)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 8)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 9)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 10)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 11)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 12)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 13)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 14)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 15)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 16)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 17)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 18)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 19)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 20)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 21)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 22)
INSERT INTO participated_users (event_id, user_id) VALUES (11, 23)

INSERT INTO participated_users (event_id, user_id) VALUES (1, 4)
INSERT INTO participated_users (event_id, user_id) VALUES (1, 5)
INSERT INTO participated_users (event_id, user_id) VALUES (1, 6)

INSERT INTO participated_users (event_id, user_id) VALUES (2, 7)
INSERT INTO participated_users (event_id, user_id) VALUES (2, 8)
INSERT INTO participated_users (event_id, user_id) VALUES (2, 9)
INSERT INTO participated_users (event_id, user_id) VALUES (2, 10)

INSERT INTO participated_users (event_id, user_id) VALUES (3, 11)
INSERT INTO participated_users (event_id, user_id) VALUES (3, 12)
INSERT INTO participated_users (event_id, user_id) VALUES (3, 13)
INSERT INTO participated_users (event_id, user_id) VALUES (3, 14)
INSERT INTO participated_users (event_id, user_id) VALUES (3, 15)

INSERT INTO participated_users (event_id, user_id) VALUES (4, 16)
INSERT INTO participated_users (event_id, user_id) VALUES (4, 17)
INSERT INTO participated_users (event_id, user_id) VALUES (4, 18)
INSERT INTO participated_users (event_id, user_id) VALUES (4, 19)
INSERT INTO participated_users (event_id, user_id) VALUES (4, 20)
INSERT INTO participated_users (event_id, user_id) VALUES (4, 21)

INSERT INTO participated_users (event_id, user_id) VALUES (5, 22)
INSERT INTO participated_users (event_id, user_id) VALUES (5, 23)
INSERT INTO participated_users (event_id, user_id) VALUES (5, 4)
INSERT INTO participated_users (event_id, user_id) VALUES (5, 5)
INSERT INTO participated_users (event_id, user_id) VALUES (5, 6)
INSERT INTO participated_users (event_id, user_id) VALUES (5, 7)
INSERT INTO participated_users (event_id, user_id) VALUES (5, 8)

INSERT INTO participated_users (event_id, user_id) VALUES (6, 9)
INSERT INTO participated_users (event_id, user_id) VALUES (6, 10)
INSERT INTO participated_users (event_id, user_id) VALUES (6, 11)
INSERT INTO participated_users (event_id, user_id) VALUES (6, 12)
INSERT INTO participated_users (event_id, user_id) VALUES (6, 13)
INSERT INTO participated_users (event_id, user_id) VALUES (6, 14)
INSERT INTO participated_users (event_id, user_id) VALUES (6, 15)
INSERT INTO participated_users (event_id, user_id) VALUES (6, 16)

INSERT INTO participated_users (event_id, user_id) VALUES (7, 17)
INSERT INTO participated_users (event_id, user_id) VALUES (7, 18)
INSERT INTO participated_users (event_id, user_id) VALUES (7, 19)
INSERT INTO participated_users (event_id, user_id) VALUES (7, 20)
INSERT INTO participated_users (event_id, user_id) VALUES (7, 21)
INSERT INTO participated_users (event_id, user_id) VALUES (7, 22)
INSERT INTO participated_users (event_id, user_id) VALUES (7, 23)
INSERT INTO participated_users (event_id, user_id) VALUES (7, 4)
INSERT INTO participated_users (event_id, user_id) VALUES (7, 5)