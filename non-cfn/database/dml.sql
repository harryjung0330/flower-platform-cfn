INSERT INTO flower(profile_pict_url, flower_story, flower_name, floriography) 
VALUES('https://flower-platfrom-pictures-test.s3.ap-northeast-2.amazonaws.com/%EB%8F%99%EB%B0%B1%EA%BD%83/img_140844_1.jpg'
, '이 꽃은 동백꽃입니다.', '동백꽃', '기다림, 애타는 사랑');

SET @last_id = (SELECT LAST_INSERT_ID());

INSERT INTO flower_pictures(flower_id, pict_url) VALUES
(@last_id, 'https://flower-platfrom-pictures-test.s3.ap-northeast-2.amazonaws.com/%EB%8F%99%EB%B0%B1%EA%BD%83/img.jpg'),
(@last_id, 'https://flower-platfrom-pictures-test.s3.ap-northeast-2.amazonaws.com/%EB%8F%99%EB%B0%B1%EA%BD%83/YKYV6LF326ZDUDGOBLPN54UTN4.jpg');

INSERT INTO flower(profile_pict_url, flower_story, flower_name, floriography) 
VALUES('https://flower-platfrom-pictures-test.s3.ap-northeast-2.amazonaws.com/%EB%B0%B1%ED%95%A9/1200px-Mount_Hakodate_Shiga_Pref06n.jpg'
, '이 꽃은 백합입니다.', '백합', '순결, 변함없는 사랑');

SET @last_id = (SELECT LAST_INSERT_ID());

INSERT INTO flower_pictures(flower_id, pict_url) VALUES
(@last_id, 'https://flower-platfrom-pictures-test.s3.ap-northeast-2.amazonaws.com/%EB%B0%B1%ED%95%A9/50203_34109_4858.jpg'),
(@last_id, 'https://flower-platfrom-pictures-test.s3.ap-northeast-2.amazonaws.com/%EB%B0%B1%ED%95%A9/Easter_Lily_Cluster_in_Garden.jpg' );


INSERT INTO flower(profile_pict_url, flower_story, flower_name, floriography) 
VALUES(
'https://flower-platfrom-pictures-test.s3.ap-northeast-2.amazonaws.com/%EC%9E%A5%EB%AF%B8/img_20200514142532_1041f302.webp'
, '이 꽃은 장미입니다.', '장미', '사랑, 아름다움, 용기');

SET @last_id = (SELECT LAST_INSERT_ID());

INSERT INTO flower_pictures(flower_id, pict_url) VALUES
(@last_id, 'https://flower-platfrom-pictures-test.s3.ap-northeast-2.amazonaws.com/%EC%9E%A5%EB%AF%B8/Red_Rose_135952.jpg'),
(@last_id, 'https://flower-platfrom-pictures-test.s3.ap-northeast-2.amazonaws.com/%EC%9E%A5%EB%AF%B8/rose-4218753__480.jpg' );

INSERT INTO authentication_providers(provider) values('GOOGLE'), ('APPLE'), ('INTERNAL');
