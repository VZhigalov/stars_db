--������� �������

SELECT * FROM consellations ORDER BY square;

--��������� ������ � ������� consellations �� ����������� ������� (��������� � ������� square)

SELECT name FROM founders WHERE country = �Denmark�; 

--������� � ������� founders ����� ����������������� �� �����

SELECT semisphere FROM area GROUP BY semisphere;

--���������� � ������� area �������� �� ������� semisphere

SELECT name, (max_right_ascension � min_right_ascension) AS right_ascension_diam, (max_declination � min_declination) AS declination_diam FROM families;

--������� ����� ��������� �� ������������ � ������� 


--������� �������

SELECT latin_name, square, name FROM consellations INNER JOIN area  ON (id_area = area.id);

--������� ������� � ���������� ��������� � �� ��������� �� ������� consellations � ������� � ���������� �������� �� ������� area

SELECT area.name, id_family FROM areas__families LEFT OUTER JOIN area ON (area.id = id_area) ORDER BY id_family;

--������� ������ �� ������� id_family ������� areas__families � ��������������� �� �������� �������� �� ������� area, ��������������� �� id_family

SELECT families.name, id_area FROM families RIGHT OUTER JOIN areas__families ON (families.id = id_family);

--������� ������ �� ������� id_area ������� areas__families � ��������������� �� �������� �������� �� ������� families