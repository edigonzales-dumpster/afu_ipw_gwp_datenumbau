# afu_ipw_gwp_modelltests

```
docker run -p 54321:5432 -e POSTGRES_DB=edit -e POSTGRES_PASSWORD=mysecretpassword edigonzales/postgis:13-3.1
```

(smart2)
```
java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema gwp --smart2Inheritance --createEnumTabs --createNumChecks --createUnique --createFk --createFkIdx --beautifyEnumDispName --createGeomIdx --createMetaInfo --createTypeConstraint --createTidCol --importTid --strokeArcs --defaultSrsCode 2056 --modeldir models/ --models GWP_Bern_13_1 --schemaimport
```

(smart1)
```
java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema gwp --smart1Inheritance --createEnumTabs --createNumChecks --createUnique --createFk --createFkIdx --beautifyEnumDispName --createGeomIdx --createMetaInfo --createTypeConstraint --createTidCol --importTid --strokeArcs --defaultSrsCode 2056 --modeldir models/ --models GWP_Bern_13_1 --schemaimport
```

(smart2)
```
java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema wasser --smart2Inheritance --createEnumTabs --createNumChecks --createUnique --createFk --createFkIdx --beautifyEnumDispName --createGeomIdx --createMetaInfo --createTypeConstraint --createTidCol --importTid --strokeArcs --defaultSrsCode 2056 --modeldir models/ --models SIA405_WASSER_2015_LV95 --doSchemaImport --disableValidation  --import ../../Downloads/Biberist_Wasser_SIA405.xtf
```

(smart1)
```
java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema wasser --smart1Inheritance --createEnumTabs --createNumChecks --createUnique --createFk --createFkIdx --beautifyEnumDispName --createGeomIdx --createMetaInfo --createTypeConstraint --createTidCol --importTid --strokeArcs --defaultSrsCode 2056 --modeldir models/ --models SIA405_WASSER_2015_LV95 --doSchemaImport --disableValidation  --import ../../Downloads/Biberist_Wasser_SIA405.xtf
```

Bemerkungen:
- Rechtschreibefehler im Modell: "Diverse.Standartschacht". Daten im Biberst mit search/replace korrigiert. Sonst NullPointerException (TODO: Ticket machen).
- TODO: start sequence, sonst gibt es Probleme, falls man nachträglich Daten erfasst (wobei ja nur zusätzliche Attribute?). Und wenn es nur zum Umbau dient, ist es eh ein Wegschmeiss-Schema.
- sqlEnableNull wegen mandatory Attribute, die erst nachträglich erfasst sind.



Idee:
- möglichst wenig Ballast (keine enum tabs).
- möglichst wenig Tabelle (smart1Inheritance)
- Dient nur dem Datenumbau. Daten werden anschliessend exportiert und mit den gewünschten Abbildungsregeln neu importiert.
- Kann automatisiert werden (ili2h2gis?)
- TODO: Man muss die Leitungsknoten sowieso einzeln behandeln. Doch smart2Inheritance? Dann ist vielleicht das Attribut-Mapping simpler.
- TODO: Dummy-Werte statt NULL? Strings noch halbwegs sinnvoll machbar. Numerische Werte?

```
java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema gwp --smart2Inheritance --createNumChecks --createUnique --createFk --createFkIdx --sqlEnableNull --createGeomIdx --createMetaInfo  --createTidCol --importTid --strokeArcs --defaultSrsCode 2056 --modeldir models/ --models "GWP_Bern_13_1" --schemaimport


java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema wasser --smart2Inheritance --createNumChecks --createUnique --createFk --createFkIdx --beautifyEnumDispName --createGeomIdx --createMetaInfo  --createTidCol --importTid --strokeArcs --defaultSrsCode 2056 --modeldir models/ --models SIA405_WASSER_2015_LV95 --disableValidation --doSchemaImport  --import ../../Downloads/Biberist_Wasser_SIA405.xtf
```


```
java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema gwp  --modeldir models/ --models "GWP_Bern_13_1" --disableValidation --export fubar.xtf

xmllint --format fubar.xtf -o fubar.xtf 
```