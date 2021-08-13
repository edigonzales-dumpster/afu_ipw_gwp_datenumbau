# afu_ipw_gwp_modelltests

```
docker run -p 54321:5432 -e POSTGRES_DB=edit -e POSTGRES_PASSWORD=mysecretpassword edigonzales/postgis:13-3.1
```

```
java -jar /Users/stefan/apps/ili2pg-4.5.0/ili2pg-4.5.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr gretl --dbpwd gretl --dbschema gwp --smart2Inheritance --createEnumTabs --createNumChecks --createUnique --createFk --createFkIdx --beautifyEnumDispName --createGeomIdx --createMetaInfo --createTypeConstraint --createEnumTabsWithId --createTidCol --importTid --strokeArcs --defaultSrsCode 2056 --modeldir models/ --models GWP_Bern_13_1 --schemaimport
```
