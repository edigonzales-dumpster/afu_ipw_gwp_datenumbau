# afu_ipw_gwp_modelltests

```
docker run -p 54321:5432 -e POSTGRES_DB=edit -e POSTGRES_PASSWORD=mysecretpassword edigonzales/postgis:13-3.1
```

## Datenumbau SIA-405-Wasser -> GWP 13.1
Grundidee: Bestehende Daten in Datenbank importieren (Für Webservice oder CLI-Tool z.B. auch _h2gis_). Zweites Schema für GWP-Modell anlegen. ili2xx-Parameter so wählen, dass Datenumbau möglichst wenig Schreibarbeit notwendig macht. Beide Schemas sind Wegwerfschemas. Für anschliessende Bearbeitung im GWP-Modell kann ein neues Schema mit anderen Parametern angelegt werden, so dass die Struktur für die Datenbearbeitung in z.B. QGIS geeignet ist. Nach dem Datenumbau mit SQL werden die Daten exportiert. Sie liegen nun im Modell GWP-13.1 vor. Achtung: Aufgrund der fehlenden Werte in den zusätzlichen Mandatory-Attributen sind die Daten nicht modellkonform. Das Bearbeitungsschema muss daher zwingend auch mit `--sqlEnableNull` angelegt werden. Alternativ könnten beim Datenumbau "sensitive default values" oder komplette "Gaga"-Werte gewählt werden. 

GWP-Schema:
```
java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema gwp --smart2Inheritance --createNumChecks --createUnique --createFk --createFkIdx --sqlEnableNull --createGeomIdx --createMetaInfo  --createTidCol --importTid --strokeArcs --defaultSrsCode 2056 --modeldir models/ --models "GWP_Bern_13_1" --schemaimport
```

SIA-405-Schema und Datenimport:
```
java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema wasser --smart2Inheritance --createNumChecks --createUnique --createFk --createFkIdx --beautifyEnumDispName --createGeomIdx --createMetaInfo  --createTidCol --importTid --strokeArcs --defaultSrsCode 2056 --modeldir models/ --models SIA405_WASSER_2015_LV95 --disableValidation --doSchemaImport  --import ../../Downloads/Biberist_Wasser_SIA405.xtf
```

Datenexport:
```
java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema gwp  --modeldir models/ --models "GWP_Bern_13_1" --disableValidation --export fubar.xtf

xmllint --format fubar.xtf -o fubar.xtf 
```