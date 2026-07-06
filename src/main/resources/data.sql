-- insert into user_roles (user_id, roles) values ('1', 'MANAGEMENT');
-- insert into user_roles (user_id, roles) values ('2', 'STORAGEADMIN');
-- insert into user_roles (user_id, roles) values ('3', 'FIELDSERVICETECHNICIAN');
-- insert into user_roles (user_id, roles) values ('4', 'ORDERFULLFILLMENT');
-- insert into user_roles (user_id, roles) values ('5', 'PROJECTMANAGER');
-- insert into user_roles (user_id, roles) values ('6', 'SUPPORT')

-- insert into user_storage(id, role, created_At, last_login, activated, email, hashed_password, user_name, first_name, last_name, phone)
-- values(1, 'Storageadmin', '2019-05-26', '2023-05-26', true, 'agnes.toccafondi@viipo.ae','$2a$10$xdbKoM48VySZqVSU/cSlVeJn0Z04XCZ7KZBjUBC00eKo5uLswyOpe',
--         'management', 'Eula', 'Lane', '(762) 526-5961')

-- insert into user_storage(id, hashed_password, user_name, role) values (1, '$2a$10$xdbKoM48VySZqVSU/cSlVeJn0Z04XCZ7KZBjUBC00eKo5uLswyOpe','management', 'Management' );


-- USERS --

insert into users(id, created_At, last_login, first_name, last_name, user_name, email,
                  hashed_password, phone, role, ACTIVATED)
values (1, date '2019-05-26', date '2023-05-26', 'Management', 'User', 'management',
        'management.storage@gmail.to',
        '$2a$10$jpLNVNeA7Ar/ZQ2DKbKCm.MuT2ESe.Qop96jipKMq7RaUgCoQedV.',
        '(762) 444526-5961', 'MANAGMENT', 1);

insert into users(id, created_At, last_login, first_name, last_name, user_name, email,
                  hashed_password, phone, role, ACTIVATED)
values (2, date '2019-05-26', date '2023-05-26', 'Peter', 'Hardworker', 'PetHar',
        'peter.hardworker@gmail.to',
        '$2a$10$jpLNVNeA7Ar/ZQ2DKbKCm.MuT2ESe.Qop96jipKMq7RaUgCoQedV.',
        '(762) 444526-5961', 'STORAGEADMIN', 1);

insert into users(id, created_At, last_login, first_name, last_name, user_name, email,
                  hashed_password, phone, role, ACTIVATED)
values (3, date '2019-05-26', date '2023-05-26', 'Susan', 'Installer', 'SusIns',
        'susan.installer@gmail.to',
        '$2a$10$jpLNVNeA7Ar/ZQ2DKbKCm.MuT2ESe.Qop96jipKMq7RaUgCoQedV.',
        '(762) 444526-5961', 'FIELDSERVICETECHNICIAN', 1);

insert into users(id, created_At, last_login, first_name, last_name, user_name, email,
                  hashed_password, phone, role, ACTIVATED)
values (4, date '2019-05-26', date '2023-05-26', 'Max', 'Technician', 'MaxTec',
        'max.technician@gmail.to',
        '$2a$10$jpLNVNeA7Ar/ZQ2DKbKCm.MuT2ESe.Qop96jipKMq7RaUgCoQedV.',
        '(762) 444526-5961', 'STORAGEADMIN', 1);


-- Storages --

insert into storages(id, storage_name, street, house_no, door_no, zip_code, city)
values (1, 'Hauptlager', 'Spengergasse', 10, 20, 1050, 'Wien');
insert into storages(id, storage_name, street, house_no, door_no, zip_code, city)
values (2, 'Kunde', 'Beim Kunden installiert', 0, 0, 0, 'Österreich');
insert into storages(id, storage_name, street, house_no, door_no, zip_code, city)
values (3, 'Lager STMK', 'Herrengasse', 100, 1, 8020, 'Graz');
insert into storages(id, storage_name, street, house_no, door_no, zip_code, city)
values (4, 'Lager KTN', 'Lindwurmweg', 13, 1, 9020, 'Klagenfurt');
insert into storages(id, storage_name, street, house_no, door_no, zip_code, city)
values (5, 'Lager VBG', 'St. Anna Straße', 11, 1, 6900, 'Bregenz');
insert into storages(id, storage_name, street, house_no, door_no, zip_code, city)
values (6, 'Lager SBG', 'Ignaz Rieder Kai', 7, 1, 5020, 'Salzburg');
insert into storages(id, storage_name, street, house_no, door_no, zip_code, city)
values (7, 'Lager NOE', 'Heidenheimer Straße', 24, 1, 3100, 'St. Poelten');


-- Producers --

insert into producers (id, producer_name, short_name)
values (1, 'Cisco', 'Cisco');
insert into producers (id, producer_name, short_name)
values (2, 'HP', 'HP');
insert into producers (id, producer_name, short_name)
values (3, 'Snom', 'Snom');
insert into producers (id, producer_name, short_name)
values (4, 'Aruba', 'Aruba');

-- Object Types - Cisco
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_Value)
values (1, 'C927', 100);
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (2, 'C1111-4p', 50);
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (3, 'ASR920-12SZ-IM', 100);
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (4, 'C897VAB', 30);
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (5, 'C1117-4p', 200);
-- insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME,min_value)
-- values (13, 'S3400-24T4FP', 40);

-- Object Types - HP
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (6, 'HP J9050A', 20);
-- Object Types - Aruba
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (7, 'Aruba 2530 8-PoE+', 200);
-- Object Types - Snom
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (8, 'M300', 300);
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (9, 'D865', 100);
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (10, 'D862', 20);
-- cisco SFP
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (11, 'GLC-LH-SM', 30);
insert into OBJECT_TYPES (ID, OBJECT_TYPE_NAME, min_value)
values (12, 'LC-SX-MM', 200);


-- CPE´s SFP´s Supplies --

--Cisco 256 Stk
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (1, 1, '04-F4-2C-E8-6B-CB', 'WAE9805FA1TO', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (2, 1, 'C3-64-5F-32-D4-26', 'NDZ2081U82ZB', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (3, 1, '1B-14-14-A7-4C-DA', 'NDZ2083U82ZB', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (4, 1, '3B-7B-98-3D-B0-38', 'NDZ2087U82AB', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (5, 1, 'D7-79-85-5D-27-50', 'NDZ2087US2ZB', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (7, 1, '37-51-2C-F6-2C-E1', 'YSI6842HA56', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (8, 1, 'EB-5F-55-DB-36-3B', 'YCI6864JJ93', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (9, 1, '76-D7-53-BA-61-FC', 'DHR4176IG46', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (10, 1, '41-4C-39-51-39-A2', 'YYK1052WR51', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (11, 1, '5C-36-22-48-F7-78', 'IDR0389WL54', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (12, 1, 'A4-96-CB-C5-F3-74', 'XEK8187YG12', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (13, 1, 'EE-8E-79-2C-CE-29', 'GNR9038AM48', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (14, 1, 'DE-81-25-54-B2-68', 'EGF4479OZ96', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (15, 1, '42-38-ED-C4-E1-6F', 'GNA4923EY45', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (16, 1, '6E-72-20-AA-1F-31', 'ZOI0271ZH02', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (17, 1, '9D-2E-91-AB-88-3B', 'YQR9711CJ51', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (18, 1, '7A-82-0C-57-7C-70', 'KEI1917PW74', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (19, 1, '66-9E-48-DE-B5-AA', 'PMW5295JO79', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (20, 1, '4A-05-4A-6C-47-D0', 'DXA1162VD61', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (21, 1, '9E-A7-59-6B-6F-8D', 'RHB8861HW03', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (22, 1, '5E-12-64-62-2C-2C', 'TUF5654BO04', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (23, 1, 'E2-CB-84-E9-1E-BA', 'BSH6066MN75', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (24, 1, 'CA-F9-47-46-DE-7C', 'HNG6850PL27', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (25, 1, 'CD-65-0B-57-AA-8C', 'JGE1320HJ40', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (26, 1, '67-28-49-7F-FB-EF', 'NTK7618DT66', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (27, 1, '59-F6-92-43-6C-52', 'SUB1738WA47', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (28, 1, '5C-F5-DA-D9-4D-BA', 'LLN0005VM39', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (29, 1, '80-FA-7A-7A-6E-B5', 'NRY0903UI88', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (30, 1, 'C5-7D-AD-AB-A0-55', 'MGC2410GV08', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (31, 1, '18-F0-AA-0C-F8-20', 'AVU6365KH27', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (32, 1, '48-F5-09-B7-64-BA', 'KBL2121RN19', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (33, 1, 'D5-E4-2D-00-99-45', 'ASM3549DH10', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (34, 1, '70-C8-F8-D9-0D-E1', 'IZI9186WT81', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (35, 1, '41-9D-78-22-D6-23', 'THJ7350ZH55', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (36, 1, '23-40-BD-48-74-13', 'DFF7775XM23', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (37, 1, '56-CC-DE-09-A4-4C', 'WDD0824PP83', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (38, 1, '4E-54-AB-22-74-DE', 'ZUI0008PQ22', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (39, 1, 'A9-5D-37-C5-64-23', 'MGK7905BQ51', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (40, 1, '59-59-E8-2D-57-A0', 'XRT4378GK28', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (41, 1, '7E-A1-1B-A2-B6-87', 'PCN7006BH45', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (42, 1, 'C7-1C-A3-08-61-A5', 'LEP8575GN56', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (43, 1, '64-83-C2-E6-B6-96', 'VID4415ZY91', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (44, 1, '53-42-D8-C1-CD-61', 'GLB3567FE42', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (45, 1, '75-DA-0C-31-A2-A7', 'YXU6000KF33', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (46, 1, 'B1-35-6C-E7-86-4A', 'FRD8572AU00', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (47, 1, '31-C4-C8-51-C1-5F', 'SES5062HA05', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (48, 1, '86-5B-77-89-EB-D2', 'FQY6018DV97', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (49, 1, '13-89-31-D2-18-94', 'FYC4137SP45', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (50, 1, 'DE-CA-91-E4-91-9E', 'OTK6750VQ37', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (51, 1, '3B-81-F2-D8-30-E3', 'LSB7344KP56', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (52, 1, '32-14-AA-7F-21-EE', 'AAO3557YU37', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (53, 1, '4F-F8-59-4E-72-EF', 'WSX7578DD26', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (54, 1, '2E-9C-8C-4F-42-D8', 'IDX5275JW16', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (55, 1, 'EB-BD-D0-C8-93-36', 'SBL1862IP98', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (56, 1, '51-E5-19-B0-17-97', 'RHW0235DN48', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (57, 1, 'D2-BF-0B-10-86-05', 'UOS0276DW01', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (58, 1, '4E-50-AB-19-FE-6B', 'YJF0893ID44', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (59, 1, 'DF-5E-CC-BD-DC-3D', 'WDB5818CY63', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (60, 1, '06-ED-D2-2B-26-B2', 'CZC2693NZ86', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (61, 1, '8F-8B-0E-65-4E-4E', 'ZDG8234IC26', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (62, 1, '3A-01-59-BC-13-92', 'NPD9684GM43', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (63, 1, '39-A2-25-96-F0-7F', 'FBB8556BP61', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (64, 1, '4C-48-2C-D0-70-CB', 'THG3180VL61', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (65, 1, '73-31-B0-10-EC-5A', 'TAL2061OW99', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (66, 1, '0B-5F-F7-8A-62-B0', 'LRC4821PB15', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (67, 1, 'E5-F1-DA-B5-34-1D', 'PNP2210RB31', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (68, 1, '54-D8-DA-4D-FE-52', 'LVT3001AV50', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (69, 1, '6A-25-FF-F1-2C-63', 'WIK9602AS44', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (70, 1, 'FD-82-03-11-57-E7', 'DUY8317WY13', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (71, 1, '3F-32-F0-87-BC-EA', 'HUH0849PK12', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (72, 1, '24-6C-91-F8-37-B3', 'UXW8957PB63', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (73, 1, 'C5-2B-A1-2A-49-9D', 'TPL2699GI17', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (74, 1, '15-04-AF-33-74-0C', 'CVZ1318GC61', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (75, 1, 'F9-C1-87-34-34-C9', 'WFK5293NC03', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (76, 1, 'F7-68-EE-65-28-4F', 'RCY5168TW88', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (77, 1, '9A-3B-69-49-66-0A', 'RBL9966TK59', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (78, 1, 'E0-75-0E-B9-01-50', 'CRZ7806WH13', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (79, 1, 'FB-CB-BE-EA-C2-ED', 'MOJ2099PC38', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (80, 1, 'F7-05-AC-61-1E-C9', 'HSM3825BI41', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (81, 1, 'E5-C6-DA-CC-C1-9D', 'ITW5329AF98', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (82, 1, '40-DC-EB-A3-BB-2E', 'MMW3127UH98', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (83, 1, 'EA-69-F5-C1-2C-9F', 'ZFI8661JQ53', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (84, 1, '55-E6-C4-82-1C-B3', 'FDZ2536HN12', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (85, 1, '50-8B-D7-76-E7-85', 'AVK8601MY50', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (86, 1, 'FF-FE-52-9F-29-80', 'NEE1765VE19', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (87, 1, 'F8-5B-17-73-89-09', 'OQN5102ZV09', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (88, 1, '34-8A-A3-3A-B2-F3', 'GJF5791AM68', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (89, 1, '96-B0-57-AF-55-7D', 'SQR0478HQ89', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (90, 1, '57-31-80-11-97-E9', 'LCB4633GD28', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (91, 1, '68-22-B1-10-2F-BE', 'FHP1977RR00', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (92, 1, '01-DB-D9-28-54-99', 'ZGT1229HX80', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (93, 1, '62-2F-0D-AD-5C-0B', 'YQY8158AB82', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (94, 1, '71-A0-84-F9-FF-4E', 'KWR6186YB82', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (95, 1, 'E3-78-20-F7-CF-63', 'CRU1517WR33', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (96, 1, '34-26-86-3D-72-1B', 'VDC0845BT06', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (97, 1, '5F-E0-7C-F6-91-2F', 'VQB9984JZ95', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (98, 1, '90-52-19-23-79-2F', 'RLN5431TV30', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (99, 1, '49-6C-D4-65-EC-C4', 'HRS3793CD40', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (100, 1, '52-84-76-5A-26-E8', 'FPW3418DO27', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (101, 1, '9E-DC-69-55-B1-03', 'BGL3879ZK86', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (102, 1, '12-DE-F5-4A-76-3D', 'ECK2560OP11', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (103, 1, 'B1-16-EB-EE-47-35', 'IHZ1186QP65', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (104, 1, '0B-1D-EE-A3-51-3D', 'MJI0371FA96', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (105, 1, '91-E8-1D-34-82-AF', 'YGJ7830UB60', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (106, 1, '76-4F-DF-B1-48-CD', 'DNT4322UX35', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (107, 1, '16-E0-35-64-83-55', 'JBR6421MP13', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (108, 1, 'D9-DB-19-F3-A3-31', 'HXA7074NT13', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (109, 1, '43-E7-DE-DF-B2-27', 'RAG7702AG22', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (110, 1, '78-42-9F-5A-B7-A5', 'NYL2502AF21', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (111, 1, '81-BB-94-71-C8-64', 'POD1289EP99', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (112, 1, 'B4-43-64-85-D6-D0', 'JSA3782QC96', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (113, 1, '22-C2-20-D8-A9-BE', 'MYV1378HP96', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (114, 1, '76-08-0D-EE-80-39', 'BFU6904RU87', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (115, 1, 'BD-DD-5B-FB-E6-A0', 'ZDO9259BU33', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (116, 1, '5E-C0-9E-5E-F6-CF', 'OTQ6865OQ87', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (117, 1, '6A-28-9C-EA-CB-41', 'UZR5626CO74', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (118, 1, 'EC-71-D4-55-9C-06', 'UQV8632MB36', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (119, 1, 'D8-10-AD-17-24-03', 'ISE5935XP98', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (120, 1, 'D5-3C-29-5C-88-25', 'LDY6265BN84', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (121, 1, '0E-D6-D1-62-5B-BF', 'DNG6439TB27', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (122, 1, '9A-64-A1-8B-9E-51', 'YZE7543KE07', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (123, 1, '2E-9A-7C-47-B7-DA', 'CZH3268GF52', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (124, 1, 'F3-6E-49-82-A8-84', 'FQN3643YX82', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (125, 1, 'C1-1D-1B-8F-1C-05', 'JKH1254SX18', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (126, 1, '4F-C2-28-9D-65-CF', 'VJG6661YY01', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (127, 1, '80-01-EC-12-69-6F', 'QTC6996ZL25', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (128, 1, '44-A8-7E-51-6C-C2', 'JYQ9675VG96', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (129, 1, '2F-C9-36-E7-42-B1', 'HWF7670RH71', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (130, 1, '3C-0B-C4-4D-79-54', 'TGY6548DL34', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (131, 1, '43-1C-C6-D0-4F-D4', 'TKB6292GM32', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (132, 1, 'A7-83-05-66-63-67', 'LRI9205SV22', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (133, 1, '2C-61-92-FF-BB-D6', 'XMB8599NR26', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (134, 1, '6D-3D-E0-AE-CF-44', 'CXV1893NJ76', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (135, 1, '7B-AD-E9-4F-90-41', 'FYY4771AO80', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (136, 1, 'D1-91-08-A4-EA-2E', 'CFX3267HE87', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (137, 1, '02-5F-9E-02-3D-07', 'HWT7260LZ13', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (138, 1, '4F-72-ED-AC-E0-5D', 'USI6511XO86', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (139, 1, '83-BC-10-30-EE-17', 'JKI7337KO67', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (140, 1, 'EE-9A-C8-54-ED-AB', 'CST0458CE72', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (141, 1, '6A-B5-EA-6A-5E-CB', 'CTK9931JY02', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (142, 1, '16-B9-41-DA-79-15', 'JZQ4194JF58', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (143, 1, 'BC-2B-18-CB-C8-43', 'ARG6870QB87', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (144, 1, '83-2A-27-6F-63-3D', 'PBP0223LO52', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (145, 1, '08-85-DC-C9-79-44', 'OIK3876KH69', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (146, 1, '5A-D7-CE-45-5F-44', 'MON3045RD80', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (147, 1, 'D5-26-F0-25-39-D3', 'ECN4360QS83', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (148, 1, 'E3-FA-9E-10-25-65', 'HJG1491GM59', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (149, 1, '19-F8-8A-FF-7A-DD', 'SNY7377KH02', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (150, 1, '67-34-6F-91-8A-20', 'KOV2889EQ24', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (151, 1, '35-5D-DC-14-D2-7E', 'RRF0151MZ51', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (152, 1, 'FE-B5-7E-27-9A-D1', 'STY4896ZW00', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (153, 1, '37-79-EC-79-2F-96', 'RVA1090TM50', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (154, 1, 'FC-B8-B5-09-69-93', 'RJT3976KH10', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (155, 1, '09-6C-58-F3-F5-EC', 'ITD8268JS58', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (156, 1, '01-27-39-C5-F2-F5', 'MWL3605FX30', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (157, 1, '21-E6-AD-82-60-61', 'ZDG5562RU90', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (158, 1, '3B-EA-7D-5F-A6-ED', 'IRW4131TO69', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (159, 1, '62-58-90-CC-D5-ED', 'LRC8290XW95', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (160, 1, '42-84-6C-57-18-28', 'YFL2858HK95', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (161, 1, '47-1F-64-A1-F6-9A', 'EET5273BN74', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (162, 1, '65-73-67-E7-9A-40', 'AWM0550SB19', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (163, 1, '3B-5F-70-BE-8A-A0', 'ZXB6744TW37', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (164, 1, '03-AE-9B-8B-CC-1F', 'JYH4057MK20', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (165, 1, '4A-48-2F-A2-2B-EF', 'OXB3386CY59', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (166, 1, '6B-0C-C7-66-66-7A', 'PFH0591QX01', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (167, 1, '30-A8-98-CB-7C-7E', 'ULU2658AU54', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (168, 1, '5E-97-0A-2E-5A-F1', 'XDN4149EL76', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (169, 1, 'FE-BA-53-3A-0A-99', 'LPG6422HG00', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (170, 1, '98-0E-D4-FB-4B-02', 'CQY4158VV87', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (171, 1, 'E7-9E-B1-D2-8F-89', 'UXU0903XT48', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (172, 1, '50-65-CA-B6-11-BD', 'MVR9519OP04', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (173, 1, 'BA-D2-67-4F-50-E4', 'IJI2776GI18', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (174, 1, 'A7-16-1B-EB-D9-BE', 'KLP1350ZD31', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (175, 1, '95-EF-8E-29-50-B8', 'ZIX1316TK65', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (176, 1, '55-CD-78-EE-FD-28', 'LDH5420SZ69', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (177, 1, '30-8C-6D-34-45-D2', 'COR7031NQ01', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (178, 1, 'FF-9A-B9-69-83-F1', 'HTN0377BJ34', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (179, 1, 'D4-9B-69-44-A1-1D', 'SYK1990LT49', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (180, 1, '88-3B-01-16-D9-48', 'LOQ1793UP48', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (181, 1, '6E-01-FC-3C-33-16', 'RMJ6836WK13', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (182, 1, 'DD-FA-5D-41-73-B1', 'MPB2734ZA68', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (183, 1, 'B8-C5-DB-B4-D1-8E', 'VLI3747AO22', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (184, 1, '42-F5-E5-1C-05-F7', 'KUS2401BB54', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (185, 1, '57-14-FF-DE-29-68', 'ZFL3942ZU26', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (186, 1, '24-AB-6C-68-ED-47', 'HRU5862DS70', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (187, 1, '74-A9-4E-52-67-74', 'HZG7873VR24', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (188, 1, 'B3-B6-76-C0-E5-A0', 'SDH9736RW42', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (189, 1, 'D0-1D-F5-13-A7-24', 'FTE2083DT85', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (190, 1, '8C-44-5D-31-89-DE', 'ZCY6042OT84', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (191, 1, '83-DF-19-7B-AF-B3', 'ZEC6001BP40', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (192, 1, '55-6E-2D-DE-0D-D8', 'IAS5756AZ54', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (193, 1, 'AA-47-C3-2C-BC-85', 'LJB4122FH86', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (194, 1, 'BF-C4-7E-1F-5C-95', 'ZBK6507EK73', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (195, 1, 'E1-69-35-DE-6F-F7', 'BWT6932BY18', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (196, 1, '5D-A2-2D-E4-DA-24', 'ZAJ7213OL59', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (197, 1, 'E4-85-48-FA-7F-AA', 'EFF0820IH67', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (198, 1, '32-2C-9D-E4-9E-AE', 'LQJ5639GP63', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (199, 1, 'A9-C5-71-15-D1-51', 'ALJ5017UX35', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (200, 1, '83-90-CC-CE-53-7A', 'BXO5586SG03', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (201, 1, 'E5-5E-DE-C1-47-DA', 'CKJ9460CT96', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (202, 1, '74-CD-89-B6-56-E5', 'GFT4789CJ91', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (203, 1, '85-A3-E9-0F-44-01', 'GRN6456UL79', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (204, 1, '9F-4C-67-C9-CC-D3', 'DQA7616GT82', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (205, 1, 'E3-2A-6C-9C-60-73', 'FXS0736JE11', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (206, 1, 'B2-85-68-56-56-A9', 'HQA7535TV32', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (207, 1, '88-E3-CC-45-11-79', 'AFQ7422TI41', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (208, 1, 'FB-D9-DC-42-7F-10', 'OAF1801SY93', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (209, 1, 'AC-6E-E6-B4-41-C9', 'GVS0566TN17', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (210, 1, '35-7A-51-C1-A4-1B', 'CTW4294OD52', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (211, 1, '0D-47-E6-AD-3D-32', 'FNC2832ZE99', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (212, 1, '5B-C2-88-65-5D-C2', 'HXP2359RB82', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (213, 1, 'D9-FC-81-83-79-97', 'VUW5601SI85', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (214, 1, '4F-7B-EA-FA-19-A4', 'EXL5817YY44', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (215, 1, '40-5B-B1-7B-9E-F1', 'VNK4844VR17', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (216, 1, '6B-84-FE-D8-7A-43', 'LJV5815QI27', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (217, 1, 'C7-A2-B1-07-46-65', 'XAW0912IR20', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (218, 1, 'E1-CB-98-A5-DC-3B', 'OCD8124GO57', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (219, 1, '11-4D-00-67-14-A0', 'OMP0874KR31', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (220, 1, '84-EA-98-88-92-AE', 'YJY7150GO02', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (221, 1, 'DE-81-C7-38-4F-C0', 'JUB0857AS10', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (222, 1, 'EA-5F-FB-C2-DC-08', 'FVK3974HT21', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (223, 1, '98-38-C9-57-0E-FA', 'CPJ8097LN19', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (224, 1, 'AC-5A-EC-E2-D3-B2', 'IDB0708GY00', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (225, 1, '85-51-4D-7A-30-54', 'OXH5561XP18', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (226, 1, 'C0-C8-9E-AB-CB-5E', 'YTL0924HZ51', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (227, 1, 'F0-F8-53-E6-D4-76', 'PAH4710NV42', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (228, 1, '8F-A8-F1-21-E2-55', 'YTM3923TD03', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (229, 1, '15-83-2B-22-AA-12', 'VHR2789VB85', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (230, 1, '8A-BF-B5-C7-B2-AE', 'KOF4520SD96', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (231, 1, '57-79-D3-30-1D-22', 'OQN6315KX03', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (232, 1, 'CD-CF-61-DA-51-7E', 'XRA4690CH12', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (233, 1, '8A-69-14-0C-F1-F2', 'HEA1368AE37', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (234, 1, '93-9B-34-70-B2-84', 'LKE9295JR16', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (235, 1, '14-04-70-7C-35-E5', 'CZD5681CF76', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (236, 1, '9F-8E-81-4D-90-93', 'IPH2195IP69', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (237, 1, '59-43-5C-A0-86-CF', 'SHU9598VK21', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (238, 1, 'D7-1F-FA-E5-D6-EF', 'LJD9255NJ96', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (239, 1, 'AC-AE-CF-25-3F-97', 'HLW0982HU22', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (240, 1, 'FD-D9-1D-3D-87-70', 'UMS8953UO12', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (241, 1, 'E6-53-91-7F-87-CE', 'YQB5232QQ87', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (242, 1, '32-CD-E6-9D-B0-91', 'CQH1684LY30', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (243, 1, '40-D7-8C-28-17-C4', 'RUG1596DO19', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (244, 1, 'A7-34-87-7F-C4-E1', 'XTA4320JI33', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (245, 1, '5D-F1-3D-E3-C9-36', 'YHK2826VU57', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (246, 1, '9D-6B-51-EE-10-30', 'OAA0274HK29', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (247, 1, '53-BD-63-02-EE-8E', 'KPA3428YK22', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (248, 1, '38-55-F6-EC-F8-BD', 'UUS1185XD60', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (249, 1, '68-02-21-A5-AE-8C', 'WZA1483BX07', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (250, 1, 'B4-38-4D-C7-8D-1F', 'KTG1489NG66', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (251, 1, '35-E4-D1-47-E0-72', 'AFA8297AR48', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (252, 1, '74-B8-FE-17-4E-2E', 'IWF5971IA43', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (253, 1, '6C-04-EF-D0-CF-C8', 'PJY4397FJ03', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (254, 1, 'E9-7B-8D-07-03-11', 'HYU8765EU15', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (255, 1, 'D1-B2-98-3E-BB-99', 'JZZ6312RO35', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (256, 1, 'D9-FC-BC-5C-DD-A2', 'VOW3053DI47', 'ROUTER');


-- Aruba
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (257, 4, '3C-E4-69-D6-92-2F', 'AJZ2087U82ZB', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (258, 4, '19-AF-01-91-C2-98', 'XSG2979FH65', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (259, 4, '82-EC-44-13-82-94', 'ECG4637KW05', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (260, 4, '58-F7-AB-EC-7F-38', 'FLO3795JK48', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (261, 4, 'A3-D8-4A-C9-C1-AE', 'BKC2288PG40', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (262, 4, '4E-25-A2-90-92-E9', 'JPX7225KO75', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (263, 4, '83-1A-39-27-41-3E', 'NXU8538GC80', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (264, 4, '83-E0-B0-6A-48-90', 'NDU9784OB68', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (265, 4, 'D9-88-6D-9B-25-DB', 'RXO4025MY55', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (266, 4, '94-AA-BE-2B-E0-D9', 'XRC4566XG90', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (267, 4, 'B9-D8-1F-F0-16-AB', 'PGE4274RG13', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (268, 4, '7B-13-46-7C-0F-AB', 'SMP8183AP11', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (269, 4, 'FC-9F-1B-B1-A8-54', 'BEY9341OH98', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (270, 4, '8C-0E-8E-37-F3-37', 'IKP3871XJ30', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (271, 4, 'D1-6E-45-67-F3-7B', 'XYY3243WR39', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (272, 4, 'FB-A3-37-1F-7E-09', 'LVQ9869EK13', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (273, 4, '12-96-DD-41-F7-0E', 'GMQ2533OJ35', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (274, 4, '24-B7-7B-88-6D-CE', 'DZP1299PO15', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (275, 4, '1D-C3-CF-92-01-3A', 'NGI0687OT33', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (276, 4, 'B3-DB-D0-4E-95-9D', 'KJX1738DB43', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (277, 4, '90-B5-2A-FB-51-28', 'VDG7531HB91', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (278, 4, 'D6-26-B3-63-2C-F0', 'MYO8993LS14', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (279, 4, '23-EE-3D-14-2C-5F', 'GPZ2493SH90', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (280, 4, 'FF-13-FB-A1-52-0A', 'OHK1295YN58', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (281, 4, 'D1-73-45-55-CE-C2', 'WQU6134LD10', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (282, 4, 'E4-6E-70-4A-82-5F', 'WQB1243AT24', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (283, 4, 'FB-A1-07-3D-BE-7D', 'JRE8717QA70', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (284, 4, '0E-9D-B9-D9-1E-E2', 'XJL7998LV34', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (285, 4, 'FB-2D-AF-56-81-ED', 'TYB6831HT20', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (286, 4, '93-4D-E0-06-EC-C0', 'EFA8194XL82', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (287, 4, '8D-DC-E2-3A-13-99', 'AEA2789LT10', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (288, 4, '63-82-DC-08-C1-98', 'NDN9004EA23', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (289, 4, '99-2C-EB-C3-55-24', 'CXU1306EE64', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (290, 4, 'FE-2E-0D-36-B5-7F', 'OWY5440ZR28', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (291, 4, '99-FB-69-73-A7-49', 'NJA4575NY09', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (292, 4, '47-8F-03-83-32-BF', 'NLR6831BT66', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (293, 4, 'D8-14-E3-90-D4-4D', 'OCX6438UR47', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (294, 4, 'E9-FE-DE-D3-50-44', 'CJN4809PX14', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (295, 4, 'BE-B2-07-BE-41-1E', 'PVI2483QM33', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (296, 4, '37-AB-9B-92-8B-2E', 'KSF5308OH11', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (297, 4, '14-70-7A-A0-D1-59', 'WZE5661CT29', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (298, 4, '57-D9-94-AB-46-BA', 'PXD5860QV83', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (299, 4, 'EE-D0-BA-00-88-22', 'VLY2445ZH04', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (300, 4, '23-25-2C-C6-A1-27', 'OJF2102UK42', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (301, 4, 'D7-3A-46-55-20-6D', 'ZAZ1090YA23', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (302, 4, '18-2A-A5-5B-7D-CB', 'SKJ7298HK08', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (303, 4, '1F-40-26-7D-BD-58', 'UZB8329LI41', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (304, 4, 'C4-F5-5C-6F-61-1F', 'AIE3583RR21', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (305, 4, '5D-2E-A4-ED-5D-73', 'OGE3417FW40', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (306, 4, 'E9-F4-FB-0C-70-06', 'ZMQ4836JJ06', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (307, 4, '5C-1C-1C-2C-E3-88', 'WFK2993WD16', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (308, 4, 'E4-26-78-C2-95-51', 'WUT2522EE93', 'SWITCH');

-- Snom
insert into CPES (id, fk_producer, macaddress, serialnumber, type)
values (309, 3, '38-E2-64-85-84-3E', 'ASZ2137U82ZB', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (310, 3, '4B-0F-97-EE-A9-98', 'AJZ2023U82ZB', 'IP_PHONE');
insert into CPES (id, fk_producer, macaddress, serialnumber, type)
values (311, 3, 'FC-44-F7-6A-86-90', 'ASZ2087U000B', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (312, 3, '70-DA-23-E6-58-7F', 'RTM2407CG57', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (313, 3, '5B-B7-FC-1F-CC-BB', 'FCQ4099GK19', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (314, 3, 'F8-6C-6E-6A-49-A2', 'WPN2144RI14', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (315, 3, '39-51-7D-21-58-C6', 'JTE7886IP09', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (316, 3, 'F3-95-66-86-5F-1E', 'ENL8727ZU27', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (317, 3, 'B6-82-C0-64-62-C5', 'LHX8872XK22', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (318, 3, '31-C5-18-F0-ED-93', 'VUP2209GA21', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (319, 3, '95-1F-B9-20-DB-55', 'OQU2937GG53', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (320, 3, '81-85-9B-93-8C-0A', 'GVC0000AR93', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (321, 3, 'CE-3D-A2-7F-C6-A4', 'PKZ2214ZC55', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (322, 3, 'DC-27-5F-EA-BD-14', 'KNU4452UD81', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (323, 3, '55-8E-23-89-AD-27', 'GYH8709PM24', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (324, 3, '4B-5C-F6-C1-11-3B', 'UED1009HK23', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (325, 3, '05-16-69-72-43-73', 'ECQ3890KG93', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (326, 3, '33-B4-10-87-EE-AC', 'ODF1932PL63', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (327, 3, '98-D3-04-FD-1F-D0', 'GQQ3469FP29', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (328, 3, '8C-51-C8-48-73-9C', 'MGH4224KV18', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (329, 3, 'F9-D9-54-A8-96-38', 'TVZ4249FE93', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (330, 3, '53-6C-E7-B7-F3-2D', 'DTK8633VO17', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (331, 3, '9A-13-F7-78-66-BD', 'YID4163BN31', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (332, 3, 'F4-6A-3E-29-B0-F9', 'LWJ8009HP51', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (333, 3, '0B-99-34-DD-25-17', 'JGJ4983TJ73', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (334, 3, '6E-5D-42-FF-0F-0C', 'IIM5542YT16', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (335, 3, '2D-46-2E-F2-4E-AA', 'UYN1509DG46', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (336, 3, 'B5-80-92-A3-6D-2C', 'TGD0479CF85', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (337, 3, '05-C5-ED-45-F7-70', 'IMP2261ZD25', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (338, 3, '07-C1-9E-45-9B-30', 'SDE2786CR95', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (339, 3, '8A-DC-24-89-14-B6', 'RIL7833PN37', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (340, 3, '26-29-5C-DF-BF-BB', 'YYR7259NW21', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (341, 3, '76-45-8C-8F-4B-1B', 'LKL8215UA02', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (342, 3, '88-B7-22-97-84-53', 'EHG6623GY70', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (343, 3, 'BF-36-F0-23-EC-65', 'MMI3224XP49', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (344, 3, 'F9-5A-D2-92-A3-7F', 'GDD3182AG29', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (345, 3, '94-29-FB-85-C3-CF', 'UVS9566KB94', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (346, 3, '47-22-11-22-ED-B1', 'ZAC2764XW24', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (347, 3, '9C-B2-E3-F8-C2-DC', 'BTM4378KA89', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (348, 3, 'CB-03-2D-1E-75-6D', 'KEH9399NV28', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (349, 3, '24-58-59-5C-A3-31', 'EGE0412FJ10', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (350, 3, 'C8-0F-53-7B-65-92', 'SOR0221HM04', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (351, 3, '92-9E-43-C9-C4-00', 'UJY2506LY41', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (352, 3, '6C-6B-8A-2F-CB-56', 'DJF9309QY71', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (353, 3, 'D5-DE-27-3D-87-E2', 'OWH8701KW26', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (354, 3, '0A-98-81-F7-E8-AA', 'JIH1304YA44', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (355, 3, '47-55-2D-62-83-61', 'PFM0464IJ61', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (356, 3, '2B-8E-64-02-9E-D5', 'ECE2647VU30', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (357, 3, '4B-F2-81-B8-D2-C0', 'DTT6040ZV93', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (358, 3, '4F-A2-28-AD-8F-57', 'XOD6875NC31', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (359, 3, '41-E6-C6-8F-87-72', 'NON0106VQ01', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (360, 3, '6A-B1-62-94-81-F5', 'XFJ1131NC68', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (361, 3, 'C2-81-D8-45-82-29', 'AZS7703XO10', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (362, 3, '01-10-23-E1-BE-97', 'VEN5401AQ16', 'IP_PHONE');

-- HP
insert into CPES (id, fk_producer, macaddress, serialnumber, type)
values (363, 2, '00-09-48-0A-58-2A', 'ASZ2087U82ZB', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (364, 2, 'B4-A9-20-CF-DE-0F', 'CQS9633XK55', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (365, 2, '7F-39-D9-5D-CC-71', 'YRS1417AI13', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (366, 2, '2C-9B-79-E3-BF-A5', 'GME7526YY92', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (367, 2, '94-43-43-36-1B-B0', 'QPA3527VW21', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (368, 2, '8E-67-0F-81-DA-AC', 'ZFB9249QA53', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (369, 2, '88-4B-42-E1-7E-83', 'BWW0506XU50', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (370, 2, '9D-D5-54-66-E0-DF', 'MMT6187YM72', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (371, 2, 'FC-67-7E-AC-C6-CD', 'AJI0481EM40', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (372, 2, 'EA-BA-2A-7C-64-71', 'VAV9537VU93', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (373, 2, '3D-46-C4-48-32-FB', 'BXS2832NQ91', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (374, 2, 'B3-60-51-0A-2E-64', 'QDA5992PC73', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (375, 2, 'C1-0E-6A-50-4A-6B', 'XCV6559FN21', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (376, 2, '30-59-34-91-5D-0F', 'GOB2970FT84', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (377, 2, 'A4-BB-12-04-63-F9', 'HFO8143VJ47', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (378, 2, '52-EE-2B-2C-D4-BB', 'LDV6166FL41', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (379, 2, 'C5-58-01-C5-E9-04', 'FHG9211LY39', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (380, 2, '62-20-65-7C-BD-A8', 'RTV5389EA45', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (381, 2, '16-FA-65-B0-C2-DF', 'NVM8104PD98', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (382, 2, '66-5F-05-2E-E1-1D', 'ZOC5788MJ38', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (383, 2, '8F-01-BF-3D-E6-8D', 'XSB1965BM36', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (384, 2, 'C3-19-71-C6-B3-1D', 'DTJ5908MW65', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (385, 2, 'CC-B7-AF-EC-FE-64', 'DRV8374AF59', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (386, 2, '9E-74-DF-3B-F7-DD', 'ZOI4658TB54', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (387, 2, 'A2-7D-16-E6-DF-37', 'YKP7051NF81', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (388, 2, '46-71-54-A0-22-05', 'QEN0785CV47', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (389, 2, '80-31-97-C1-90-1F', 'MMS5536SN44', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (390, 2, 'F9-BF-36-B6-B2-5F', 'KJZ5972RF27', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (391, 2, '29-95-C7-C0-C7-7F', 'OTT0816MG55', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (392, 2, '12-83-D7-38-19-D4', 'TUY7805CA46', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (393, 2, 'B1-A7-55-42-4E-57', 'YRD7547MV92', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (394, 2, '62-FB-0B-77-02-72', 'CSP2253LW00', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (395, 2, 'B3-87-9A-AF-8D-F4', 'XTR8089SZ95', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (396, 2, '51-99-75-6D-53-EB', 'WCX4399VZ71', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (397, 2, '0C-A6-9B-AF-85-7F', 'MZV2746AF68', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (398, 2, 'AB-45-3C-56-DE-E7', 'HXI5350ZH60', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (399, 2, '4A-0F-42-9F-FF-11', 'SAG4386FX34', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (400, 2, 'E6-0C-02-E1-1B-7C', 'SYV4940ZU99', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (401, 2, 'C2-2F-BD-86-C2-46', 'JXF7815LC13', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (402, 2, 'AD-0B-8C-D3-00-3C', 'TGX9930UJ39', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (403, 2, '86-2A-5C-A1-5B-F9', 'LBF1509OR97', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (404, 2, '99-1B-E9-36-E8-78', 'QJJ2582XG24', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (405, 2, 'BD-A8-DD-45-F6-83', 'RHC0715IH54', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (406, 2, 'D0-ED-B5-A9-A3-47', 'IPS6983GN25', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (407, 2, 'A7-E8-D4-69-29-2B', 'UGS5432KV04', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (408, 2, '1F-07-0B-13-64-C9', 'ULT1569CQ29', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (409, 2, 'EF-F4-B3-88-E6-7A', 'UKO1949UI53', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (410, 2, 'E0-70-D0-46-66-58', 'QUI1821JU62', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (411, 2, 'E1-71-20-F6-07-83', 'PDV0267FG89', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (412, 2, '77-DC-E7-4C-A4-97', 'GJD3764UM64', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (413, 2, '5E-3F-A6-FA-2D-18', 'RPV2476BG79', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (414, 2, 'B0-41-4E-2A-99-9E', 'KHW4715TG39', 'SWITCH');

-- sfp´s
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (1, 1, 'ACW260719G3', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (2, 1, 'ACW260719G3', 1, 2, '550 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (3, 1, 'PWB2585JT89', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (4, 1, 'YET9739TS81', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (5, 1, 'ZGY5145BW41', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (6, 1, 'JBX9844XB13', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (7, 1, 'LIL3208CH61', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (8, 1, 'TUW9086TG70', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (9, 1, 'TND3699DM85', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (10, 1, 'WGD3995TH05', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (11, 1, 'IXB7947SN80', 1, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (12, 1, 'JZZ4721WJ96', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (13, 1, 'FEZ2714YI81', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (14, 1, 'FFW3229QL87', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (15, 1, 'KVB0440EL71', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (16, 1, 'YJD1526UT63', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (17, 1, 'QQU4977AB99', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (18, 1, 'BRN3162ZC57', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (19, 1, 'YWY3770ZL37', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (20, 1, 'EOL0991BA90', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (21, 1, 'YJW1123FR52', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (22, 1, 'SGN0160II35', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (23, 1, 'RIU7481IK26', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (24, 1, 'QWG8125IZ22', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (25, 1, 'OZY2447OU75', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (26, 1, 'IVY6560MF38', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (27, 1, 'KPP4691DR88', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (28, 1, 'URU6535UN55', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (29, 1, 'WQX8388LB41', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (30, 1, 'ATA9741EC96', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (31, 1, 'RAO8216KQ31', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (32, 1, 'DAQ5026GQ72', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (33, 1, 'YVD8691DS47', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (34, 1, 'MKO7038BV95', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (35, 1, 'LUA3162IC92', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (36, 1, 'ALM9987GE00', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (37, 1, 'KOM5899WE98', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (38, 1, 'KLI1517PZ09', 1, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (39, 1, 'RFB6187SL05', 1, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (40, 1, 'QQR7752TI11', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (41, 1, 'ZMN8599EA18', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (42, 1, 'KQI9450BV11', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (43, 1, 'OMN6047QV82', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (44, 1, 'DPK2419UY78', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (45, 1, 'MGD6666YB19', 1, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (46, 1, 'UKU4875LR71', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (47, 1, 'DMG5620GG66', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (48, 1, 'YKT9407SD33', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (49, 1, 'OCD5867YH82', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (50, 1, 'XEU5222CQ32', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (51, 1, 'ZJF1236LZ48', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (52, 1, 'XMD8368SD27', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (53, 1, 'UWO4123IE95', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (54, 1, 'SQU2206BK39', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (55, 1, 'XUL2237BB42', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (56, 1, 'DFT7260TO54', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (57, 1, 'TIE9482UM67', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (58, 1, 'XVZ5864ML77', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (59, 1, 'EIG3494NR73', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (60, 1, 'PYT2255AV75', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (61, 1, 'KER4464DM22', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (62, 1, 'OEP0689OB61', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (63, 1, 'ZJF0542DX28', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (64, 1, 'FXH2832XH01', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (65, 1, 'YNT8380YY71', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (66, 1, 'ZJV6674VO26', 1, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (67, 1, 'UVM0611GW94', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (68, 1, 'KKZ2933HL16', 1, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (69, 1, 'ANZ9466EV28', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (70, 1, 'EUP1829RG50', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (71, 1, 'OCQ5272CD19', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (72, 1, 'EGO4638WK23', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (73, 1, 'XAG4770OV25', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (74, 1, 'VKB0674DT95', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (75, 1, 'YTU3845NQ46', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (76, 1, 'FLI2836PL76', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (77, 1, 'VKL5881GS45', 1, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (78, 1, 'OFR0411HJ50', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (79, 1, 'PBL6201JG51', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (80, 1, 'GII9487TS19', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (81, 1, 'RCU8262FH93', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (82, 1, 'HZZ8829QD38', 1, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (83, 1, 'RQO0827MI75', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (84, 1, 'CIQ7978AW33', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (85, 1, 'LZW1263VX35', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (86, 1, 'SYP5867UN02', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (87, 1, 'UMD2572TN93', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (88, 1, 'TJK4581HF82', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (89, 1, 'CKE3044GR18', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (90, 1, 'AAC6651UO50', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (91, 1, 'PPX9030WY71', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (92, 1, 'NYJ4865PR13', 1, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (93, 1, 'GQO9139SK44', 100, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (94, 1, 'WHF0599ZP39', 1, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (95, 1, 'KEZ7103KY67', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (96, 1, 'UIK2221GI18', 100, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (97, 1, 'UZT8498QY17', 10, 2, '850 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (98, 1, 'UHJ8965AG14', 1, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (99, 1, 'ZXF3266GP34', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (100, 1, 'XTQ4450BE05', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (101, 1, 'QAM3272HP21', 10, 2, '1310 nm', 'SFP');
insert into sfps (id, fk_producer, serialnumber, nic_speed, type_sfp, wavelength, type)
values (102, 1, 'DEQ1597PR52', 1, 2, '1310 nm', 'SFP');

insert into supplies (id, description, amount)
values (1, 'Patch Kabel elektr. Cat5e 5 Meter', 10);
insert into supplies (id, description, amount)
values (2, 'Patch Kabel opt. SM 3 Meter LC/LC', 5);
insert into supplies (id, description, amount)
values (3, 'TST Bonding 1,5 Meter ', 10);
insert into supplies (id, description, amount)
values (4, 'Patch Kabel opt. SM 2 Meter LC/E2000', 5);
insert into supplies (id, description, amount)
values (5, 'Patch Kabel elektr. Cat5e 2 Meter', 10);
insert into supplies (id, description, amount)
values (6, 'Patch Kabel opt. MM 1,5 Meter LC/LC', 5);



-- Insert freier Lagerobjekte Version 2 ca 600 Stück - Hauptlager

-- C927 50 Stk IDs: 50-100  FK_CPE 7-57
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (50, 56, 1, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (51, 57, 1, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (52, 7, 1, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (53, 8, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (54, 9, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (55, 10, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (56, 11, 1, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (57, 12, 1, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (58, 13, 1, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (59, 14, 1, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (60, 15, 1, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (61, 16, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (62, 17, 1, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (63, 18, 1, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (64, 19, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (65, 20, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (66, 21, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (67, 22, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (68, 23, 1, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (69, 24, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (70, 25, 1, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (71, 26, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (72, 27, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (73, 28, 1, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (74, 29, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (75, 30, 1, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (76, 31, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (77, 32, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (78, 33, 1, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (79, 34, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (80, 35, 1, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (81, 36, 1, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (82, 37, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (83, 38, 1, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (84, 39, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (85, 40, 1, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (86, 41, 1, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (87, 42, 1, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (88, 43, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (89, 44, 1, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (90, 45, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (91, 46, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (92, 47, 1, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (93, 48, 1, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (94, 49, 1, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (95, 50, 1, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (96, 51, 1, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (97, 52, 1, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (98, 53, 1, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (99, 54, 1, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (100, 55, 1, 'IOS alt', 1);

-- C1111-4p ID 101-150 FK-CPE 58-107
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (101, '107', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (102, '', 2, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (103, '58', 2, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (104, '59', 2, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (105, '60', 2, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (106, '61', 2, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (107, '62', 2, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (108, '63', 2, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (109, '64', 2, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (110, '65', 2, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (111, '66', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (112, '67', 2, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (113, '68', 2, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (114, '69', 2, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (115, '70', 2, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (116, '71', 2, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (117, '72', 2, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (118, '73', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (119, '74', 2, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (120, '75', 2, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (121, '76', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (122, '77', 2, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (123, '78', 2, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (124, '79', 2, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (125, '80', 2, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (126, '81', 2, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (127, '82', 2, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (128, '83', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (129, '84', 2, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (130, '85', 2, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (131, '86', 2, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (132, '87', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (133, '88', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (134, '89', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (135, '90', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (136, '91', 2, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (137, '92', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (138, '93', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (139, '94', 2, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (140, '95', 2, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (141, '96', 2, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (142, '97', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (143, '98', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (144, '99', 2, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (145, '100', 2, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (146, '101', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (147, '102', 2, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (148, '103', 2, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (149, '104', 2, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (150, '105', 2, 'IOS up to date', 1);

-- ASR920-12SZ-IM	 ID 151-200 FK-CPE 107-156

insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (151, '156', 3, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (152, '', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (153, '', 3, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (154, '108', 3, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (155, '109', 3, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (156, '110', 3, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (157, '111', 3, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (158, '112', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (159, '113', 3, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (160, '114', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (161, '115', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (162, '116', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (163, '117', 3, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (164, '118', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (165, '119', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (166, '120', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (167, '121', 3, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (168, '122', 3, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (169, '123', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (170, '124', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (171, '125', 3, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (172, '126', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (173, '127', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (174, '128', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (175, '129', 3, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (176, '130', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (177, '131', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (178, '132', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (179, '133', 3, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (180, '134', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (181, '135', 3, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (182, '136', 3, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (183, '137', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (184, '138', 3, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (185, '139', 3, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (186, '140', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (187, '141', 3, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (188, '142', 3, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (189, '143', 3, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (190, '144', 3, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (191, '145', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (192, '146', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (193, '147', 3, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (194, '148', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (195, '149', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (196, '150', 3, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (197, '151', 3, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (198, '152', 3, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (199, '153', 3, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (200, '154', 3, 'IOS up to date', 1);

-- C897VAB	 ID 201-250 FK-CPE 157-206
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (201, '204', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (202, '205', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (203, '206', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (204, '', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (205, '157', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (206, '158', 4, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (207, '159', 4, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (208, '160', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (209, '161', 4, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (210, '162', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (211, '163', 4, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (212, '164', 4, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (213, '165', 4, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (214, '166', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (215, '167', 4, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (216, '168', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (217, '169', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (218, '170', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (219, '171', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (220, '172', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (221, '173', 4, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (222, '174', 4, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (223, '175', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (224, '176', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (225, '177', 4, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (226, '178', 4, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (227, '179', 4, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (228, '180', 4, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (229, '181', 4, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (230, '182', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (231, '183', 4, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (232, '184', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (233, '185', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (234, '186', 4, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (235, '187', 4, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (236, '188', 4, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (237, '189', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (238, '190', 4, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (239, '191', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (240, '192', 4, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (241, '193', 4, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (242, '194', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (243, '195', 4, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (244, '196', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (245, '197', 4, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (246, '198', 4, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (247, '199', 4, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (248, '200', 4, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (249, '201', 4, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (250, '202', 4, null, 1);

-- C1117-4p	 ID 251-300 FK-CPE 207-256
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (251, '249', 5, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (252, '250', 5, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (253, '251', 5, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (254, '252', 5, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (255, '253', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (256, '254', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (257, '255', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (258, '256', 5, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (259, '', 5, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (260, '', 5, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (261, '207', 5, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (262, '208', 5, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (263, '209', 5, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (264, '210', 5, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (265, '211', 5, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (266, '212', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (267, '213', 5, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (268, '214', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (269, '215', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (270, '216', 5, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (271, '217', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (272, '218', 5, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (273, '219', 5, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (274, '220', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (275, '221', 5, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (276, '222', 5, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (277, '223', 5, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (278, '224', 5, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (279, '225', 5, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (280, '226', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (281, '227', 5, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (282, '228', 5, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (283, '229', 5, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (284, '230', 5, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (285, '231', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (286, '232', 5, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (287, '233', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (288, '234', 5, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (289, '235', 5, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (290, '236', 5, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (291, '237', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (292, '238', 5, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (293, '239', 5, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (294, '240', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (295, '241', 5, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (296, '242', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (297, '243', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (298, '244', 5, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (299, '245', 5, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (300, '246', 5, null, 1);

-- Aruba 2530 8-PoE+ ID 301-350 FK-CPE 258-308
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (301, 303, 7, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (302, 304, 7, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (303, 305, 7, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (304, 306, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (305, 307, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (306, 308, 7, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (307, 258, 7, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (308, 259, 7, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (309, 260, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (310, 261, 7, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (311, 262, 7, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (312, 263, 7, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (313, 264, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (314, 265, 7, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (315, 266, 7, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (316, 267, 7, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (317, 268, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (318, 269, 7, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (319, 270, 7, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (320, 271, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (321, 272, 7, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (322, 273, 7, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (323, 274, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (324, 275, 7, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (325, 276, 7, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (326, 277, 7, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (327, 278, 7, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (328, 279, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (329, 280, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (330, 281, 7, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (331, 282, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (332, 283, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (333, 284, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (334, 285, 7, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (335, 286, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (336, 287, 7, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (337, 288, 7, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (338, 289, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (339, 290, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (340, 291, 7, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (341, 292, 7, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (342, 293, 7, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (343, 294, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (344, 295, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (345, 296, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (346, 297, 7, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (347, 298, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (348, 299, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (349, 300, 7, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (350, 301, 7, null, 1);

-- M300 ID 351-369 FK-CPE 312-330

insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (351, 320, 8, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (352, 321, 8, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (353, 322, 8, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (354, 323, 8, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (355, 324, 8, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (356, 325, 8, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (357, 326, 8, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (358, 327, 8, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (359, 328, 8, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (360, 329, 8, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (361, 330, 8, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (362, 312, 8, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (363, 313, 8, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (364, 314, 8, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (365, 315, 8, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (366, 316, 8, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (367, 317, 8, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (368, 318, 8, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (369, 319, 8, 'IOS alt', 1);

-- D865 ID 370-380 FK-CPE 331-341
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (370, 337, 9, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (371, 338, 9, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (372, 339, 9, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (373, 340, 9, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (374, 341, 9, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (375, 331, 9, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (376, 332, 9, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (377, 333, 9, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (378, 334, 9, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (379, 335, 9, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (380, 336, 9, 'Verpackung beschädigt', 1);

-- D862 ID 381-401 FK-CPE 342-362
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (381, 344, 10, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (382, 345, 10, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (383, 346, 10, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (384, 347, 10, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (385, 348, 10, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (386, 349, 10, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (387, 350, 10, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (388, 351, 10, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (389, 352, 10, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (390, 353, 10, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (391, 354, 10, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (392, 355, 10, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (393, 356, 10, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (394, 357, 10, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (395, 358, 10, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (396, 359, 10, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (397, 360, 10, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (398, 361, 10, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (399, 362, 10, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (400, 342, 10, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (401, 343, 10, 'keine Verpackung', 1);

-- HP J9050A ID 454-204 FK-CPE 466-516
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (402, 408, 6, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (403, 409, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (404, 410, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (405, 411, 6, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (406, 412, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (407, 413, 6, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (408, 414, 6, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (409, 364, 6, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (410, 365, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (411, 366, 6, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (412, 367, 6, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (413, 368, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (414, 369, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (415, 370, 6, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (416, 371, 6, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (417, 372, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (418, 373, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (419, 374, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (420, 375, 6, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (421, 376, 6, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (422, 377, 6, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (423, 378, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (424, 379, 6, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (425, 380, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (426, 381, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (427, 382, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (428, 383, 6, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (429, 384, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (430, 385, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (431, 386, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (432, 387, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (433, 388, 6, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (434, 389, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (435, 390, 6, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (436, 391, 6, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (437, 392, 6, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (438, 393, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (439, 394, 6, 'Verpackung beschädigt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (440, 395, 6, 'keine Verpackung', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (441, 396, 6, 'IOS alt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (442, 397, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (443, 398, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (444, 399, 6, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (445, 400, 6, 'Netzteil fehlt', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (446, 401, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (447, 402, 6, 'IOS up to date', 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (448, 403, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (449, 404, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (450, 405, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (451, 406, 6, null, 1);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (452, 407, 6, 'IOS alt', 1);


--GLC-LH-SM		ID 610 - 650  FK SFP 10-50

insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (610, 45, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (611, 46, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (612, 47, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (613, 48, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (614, 49, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (615, 50, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (616, 10, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (617, 11, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (618, 12, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (619, 13, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (620, 14, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (621, 15, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (622, 16, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (623, 17, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (624, 18, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (625, 19, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (626, 20, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (627, 21, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (628, 22, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (629, 23, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (630, 24, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (631, 25, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (632, 26, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (633, 27, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (634, 28, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (635, 29, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (636, 30, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (637, 31, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (638, 32, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (639, 33, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (640, 34, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (641, 35, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (642, 36, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (643, 37, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (644, 38, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (645, 39, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (646, 40, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (647, 41, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (648, 42, 11, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (649, 43, 11, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (650, 44, 11, null, 1);

-- LC-SX-MM	-- ID 715 - 765  FK SFP 51-101
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (715, 51, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (716, 52, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (717, 53, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (718, 54, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (719, 55, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (720, 56, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (721, 57, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (722, 58, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (723, 59, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (724, 60, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (725, 61, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (726, 62, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (727, 63, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (728, 64, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (729, 65, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (730, 66, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (731, 67, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (732, 68, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (733, 69, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (734, 70, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (735, 71, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (736, 72, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (737, 73, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (738, 74, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (739, 75, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (740, 76, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (741, 77, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (742, 78, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (743, 79, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (744, 80, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (745, 81, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (746, 82, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (747, 83, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (748, 84, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (749, 85, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (750, 86, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (751, 87, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (752, 88, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (753, 89, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (754, 90, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (755, 91, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (756, 92, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (757, 93, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (758, 94, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (759, 95, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (760, 96, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (761, 97, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (762, 98, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (763, 99, 12, 'refurbed', 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (764, 100, 12, null, 1);
insert into STORAGE_OBJECTS (id, FK_SFP, FK_OBJECT_TYPE, remark, fk_storage)
values (765, 101, 12, 'refurbed', 1);

------------------------------------------------Supplies-------------------------------------------------------------

insert into STORAGE_OBJECTS (id, FK_SUPPLY, remark, fk_storage)
values (790, 1, 'LAN', 1);
insert into STORAGE_OBJECTS (id, FK_SUPPLY, remark, fk_storage)
values (791, 2, 'LAN', 3);
insert into STORAGE_OBJECTS (id, FK_SUPPLY, remark, fk_storage)
values (792, 3, 'LAN Kabel', 3);
insert into STORAGE_OBJECTS (id, FK_SUPPLY, remark, fk_storage)
values (793, 4, 'LAN Kabel', 4);
insert into STORAGE_OBJECTS (id, FK_SUPPLY, remark, fk_storage)
values (794, 3, 'LAN', 5);
insert into STORAGE_OBJECTS (id, FK_SUPPLY, remark, fk_storage)
values (795, 4, 'LAN Kabel Werkzeug', 1);
insert into STORAGE_OBJECTS (id, FK_SUPPLY, remark, fk_storage)
values (796, 6, 'LAN', 1);
insert into STORAGE_OBJECTS (id, FK_SUPPLY, remark, fk_storage)
values (797, 2, 'WLAN Kabel :D', 1);

---------------------------------------------------------------------------------------------------------------------

-- Storage Objects für das Lager STMK - HP und ARUBA Switches

insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (500, 4, '7F-B0-1C-B8-66-25', 'IRG9694OX91', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (501, 4, '1B-CD-16-4C-86-88', 'NBR8192RX43', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (502, 4, 'A8-0E-20-41-B6-D7', 'MWO6941SB04', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (503, 4, 'E9-8B-5B-02-62-93', 'BAP0746LW26', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (504, 4, 'F7-BF-E7-1E-F3-EB', 'CTJ7418IP63', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (505, 4, 'CF-E7-3B-19-B6-99', 'LND0507NX54', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (506, 4, '93-ED-6A-8E-C6-E5', 'JSD2780QS71', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (507, 2, '78-C5-E2-48-67-36', 'KUP8721OI67', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (508, 2, '4D-FD-BD-E5-15-7B', 'MWR6245EH77', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (509, 2, '4F-3F-2F-02-31-8D', 'AXB1623UY85', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (510, 2, 'D0-F7-BC-3B-F4-6D', 'XOJ3285XE83', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (511, 2, '95-0A-A4-4A-90-23', 'FPP3084MD65', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (512, 2, 'CA-42-BB-94-12-27', 'HEI3365JN64', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (513, 2, '0C-D2-66-33-9D-59', 'UIF8111QT65', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (514, 2, '25-03-86-97-66-A5', 'VPX2858SZ07', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (515, 2, 'A4-A7-1A-8B-AA-55', 'TRD3332WD17', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (516, 2, '3A-3E-35-D8-27-89', 'OIM5725YN54', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (517, 2, '56-F0-4D-DC-9B-26', 'LEM0508CL68', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (518, 2, '08-C1-CF-1A-86-11', 'PEB9656TR15', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (519, 2, '71-85-3C-95-D2-97', 'KQG2035LD75', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (520, 2, 'E0-CC-37-F1-8E-1E', 'GVJ0724TQ31', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (521, 2, 'D7-1F-2E-70-15-F5', 'RXG9262DK58', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (522, 2, '77-58-E0-A1-EC-1A', 'USV7557RV55', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (523, 2, 'B4-98-7B-1D-63-2D', 'PSU3241BY98', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (524, 2, 'E1-27-20-EE-81-F4', 'YJD2600JQ59', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (525, 2, '2B-48-E8-5B-B1-24', 'GLD2147YH82', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (526, 2, 'F1-30-76-24-EA-22', 'RVB8034UV65', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (527, 2, '71-17-19-85-E1-C6', 'EUJ7854IU60', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (528, 2, 'F0-3B-98-D7-E6-AA', 'WLO5722RH95', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (529, 2, '3D-87-BE-12-B6-15', 'KQJ2087FC90', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (530, 2, 'A0-FC-79-8F-89-4E', 'CEN3889KR25', 'SWITCH');

insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (540, 512, 7, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (541, 513, 7, 'refurbed', 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (542, 514, 7, 'IOS up to date', 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (543, 515, 7, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (544, 516, 7, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (545, 517, 7, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (546, 518, 7, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (547, 519, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (548, 520, 6, 'IOS up to date', 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (549, 521, 6, 'refurbed', 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (550, 522, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (551, 523, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (552, 524, 6, 'refurbed', 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (553, 525, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (554, 526, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (555, 527, 6, 'Netzteil fehlt', 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (556, 528, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (557, 529, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (558, 530, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (559, 500, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (560, 501, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (561, 502, 6, 'Netzteil fehlt', 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (562, 503, 6, 'refurbed', 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (563, 504, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (564, 505, 6, 'IOS up to date', 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (565, 506, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (566, 507, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (567, 508, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (568, 509, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (569, 510, 6, null, 3);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (570, 511, 6, null, 3);

----------------------------------------------------------------------------------------------------------------------
-- Storage Objects für das Lager STMK - IP_PHONES

insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (540, 3, 'C0-F1-05-0E-0E-15', 'TOM7433XO51', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (541, 3, '65-85-0C-C6-A0-09', 'ZMO0727NY04', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (542, 3, '18-5A-70-FB-B0-70', 'VZH5780ET21', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (543, 3, '3A-6C-63-28-A8-E5', 'WTY8466EM11', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (544, 3, 'E6-AB-7D-E8-ED-EC', 'RWE5910DB99', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (545, 3, 'FA-EF-7D-C1-E4-3D', 'FLY5716KS64', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (546, 3, '13-9A-EA-CC-E9-50', 'WJX5314NU66', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (547, 3, '09-EA-9B-BF-69-BE', 'RHO3589ZC96', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (548, 3, 'CB-E6-B4-94-62-5A', 'GVG8325ND76', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (549, 3, '6B-74-13-EC-A1-08', 'UOQ3014VU06', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (550, 3, '51-B9-AA-1F-7B-32', 'QGA7037DV67', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (551, 3, '7D-8E-66-BC-FC-BE', 'USF9368FW89', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (552, 3, 'C0-2E-7D-D5-AB-4D', 'CPX7982YJ85', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (553, 3, '97-5A-18-AA-38-B2', 'PVV7703PX19', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (554, 3, '40-F5-C6-5E-F7-86', 'INJ4365EH05', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (555, 3, '37-24-35-19-C9-41', 'JBI7727KR09', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (556, 3, '77-48-FF-DE-F7-51', 'XDI3170FT44', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (557, 3, '2B-0A-46-62-4D-BB', 'AAP4086VF43', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (558, 3, '6F-89-49-2E-BA-CC', 'AHR0418EV86', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (559, 3, 'C7-80-3D-7A-4B-5F', 'IEZ0902GG05', 'IP_PHONE');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (560, 3, 'B5-85-44-85-78-6B', 'QNX7254AA68', 'IP_PHONE');

insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (766, 549, 8, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (767, 550, 8, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (768, 551, 9, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (769, 552, 8, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (770, 553, 9, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (771, 554, 9, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (772, 555, 8, 'refurbed', 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (773, 556, 8, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (774, 557, 10, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (775, 558, 8, 'refurbed', 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (776, 559, 9, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (777, 560, 10, 'refurbed', 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (778, 540, 10, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (779, 541, 10, 'kein Netzteil', 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (780, 542, 9, 'keine Verpackung', 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (781, 543, 9, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (782, 544, 10, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (783, 545, 9, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (784, 546, 8, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (785, 547, 9, null, 4);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (786, 548, 8, null, 4);


-- Storage Objects für das  Lager Kunde
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (490, 2, 'B0-41-4E-2A-99-9E', 'KHW4715TG39', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (491, 2, 'DE-41-8E-7A-FF-9E', 'GHD4425TG87', 'SWITCH');

insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (590, 490, 6, 'Test Kundenlager', 2);
insert into STORAGE_OBJECTS (id, FK_CPE, FK_OBJECT_TYPE, remark, fk_storage)
values (591, 491, 6, 'Test Kundenlager', 2);

---------------------------------------------------------------------------------------------------------------------
-- Storageobjects beim User SusIns

insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (1, 1, 1, 3);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (2, 2, 2, 3);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (3, 3, 3, 3);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (4, 4, 4, 3);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (5, 5, 5, 3);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (711, 257, 7, 3);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (666, 309, 8, 3);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (691, 310, 10, 3);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (695, 311, 9, 3);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (698, 363, 6, 3);
insert into STORAGE_OBJECTS (ID, FK_SFP, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (701, 1, 11, 3);
insert into STORAGE_OBJECTS (ID, FK_SFP, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (709, 2, 12, 3);
---------------------------------------------------------------------------------------------------------------------
-- Stroageobjecst bei User MaxTec 4
-- CPEs Router
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (450, 1, '6C-D9-0D-53-40-08', 'FAT9818MW55', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (451, 1, '16-70-4D-07-64-D0', 'LRS5858DG00', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (452, 1, 'FE-35-F9-49-9C-75', 'RNN3617MP35', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (453, 1, '5F-E2-8C-1C-27-31', 'HLE1605UQ95', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (454, 1, '85-64-60-5C-33-D5', 'FPD4107LP83', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (455, 1, '12-D1-4D-05-52-8A', 'NLG2963OG85', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (456, 1, 'DE-F2-E3-5E-06-B2', 'ZZO0407IL46', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (457, 1, '15-F7-0F-A3-C5-ED', 'KOM2576JC82', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (458, 1, '95-95-B9-8C-B4-6B', 'ERY2600BW02', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (459, 1, 'DC-F5-08-04-12-A1', 'UQT8124YE43', 'ROUTER');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (460, 1, '92-80-0F-A0-DE-B1', 'IDA0131DS79', 'ROUTER');

-- Storageobjects

insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (500, 450, 3, 4);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (501, 451, 2, 4);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (502, 452, 1, 4);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (503, 453, 4, 4);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (504, 454, 1, 4);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (505, 455, 4, 4);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (506, 456, 2, 4);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (507, 457, 3, 4);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (508, 458, 3, 4);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (509, 459, 1, 4);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (510, 460, 2, 4);

---------------------------------------------------------------------------------------------------------------------
-- Stroageobjecst bei User PetHar 2
-- CPES Switches
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (470, 4, 'D2-61-AE-1C-0F-1D', 'YDZ0492WH60', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (471, 4, '02-3F-FC-AE-C9-CD', 'NEK9257UZ20', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (472, 4, '2E-14-BF-EB-A5-E5', 'WEQ0478JM15', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (473, 4, '1D-0D-9D-27-B7-46', 'OWC6851EE47', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (474, 4, '83-4F-14-29-08-F6', 'RRE4293KK97', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (475, 4, '8C-D1-55-1D-F1-CD', 'JJK8513VW58', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (476, 2, '79-E0-CC-C9-F0-43', 'TPN6557ZT59', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (477, 2, '18-E8-84-3D-1C-2B', 'KSX8177JS60', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (478, 2, '0A-9F-0C-3C-65-94', 'BAX9645FH83', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (479, 2, '3D-4F-67-D6-3A-A7', 'SAI9155DR00', 'SWITCH');
insert into cpes (id, fk_producer, macaddress, serialnumber, type)
values (480, 2, '3D-B0-C2-04-0E-AF', 'OXV8705BM06', 'SWITCH');

insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (520, 470, 7, 2);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (521, 471, 7, 2);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (522, 472, 7, 2);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (523, 473, 7, 2);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (524, 474, 7, 2);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (525, 475, 7, 2);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (526, 476, 6, 2);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (527, 477, 6, 2);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (528, 478, 6, 2);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (529, 479, 6, 2);
insert into STORAGE_OBJECTS (ID, FK_CPE, FK_OBJECT_TYPE, FK_STORAED_AT_USER)
values (530, 480, 6, 2);
---------------------------------------------------------------------------------------------------------------------

-- select * from STORAGE_OBJECTS where FK_STORAED_AT_USER = 4;


--delete from RESERVATIONS where ID = 1;
insert into reservations (id, reserved_at, fk_user, last_modified, completed, connection_no,
                          reserved_description)
values (1, TIMESTAMP '2023-12-25 11:16:47.672127', 1, TIMESTAMP '2023-12-25 11:16:47.677192', 0,
        '12335134',
        'Kunde Bike Service Speedy');
insert into reservations (id, reserved_at, fk_user, last_modified, completed, connection_no,
                          reserved_description)
values (2, TIMESTAMP '2023-12-25 11:16:47.678165', 1, TIMESTAMP '2023-12-25 11:16:47.678504', 0,
        '123413521',
        'Kunde benötigt PoE fähiges Device');

-- select *
-- from CPES
-- where id = 260;
-- select *
-- from CPES
-- where id = 51;