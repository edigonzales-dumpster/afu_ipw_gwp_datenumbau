DELETE FROM 
    gwp.hydraulischer_knoten
;

INSERT INTO 
    gwp.hydraulischer_knoten 
    (
        t_id,
        t_type,
        t_ili_tid,
        name_nummer,
        geometrie,
        knotentyp,
        verbrauch,
        druck,
        bemerkung,
        obj_id
    )
SELECT 
    t_id,
    'gwp_bern_13_1sia405_wasser_gwp_hydraulischer_knoten',
    t_ili_tid,
    name_nummer,
    geometrie,
    knotentyp,
    verbrauch,
    druck,
    bemerkung,
    obj_id 
FROM 
    wasser.hydraulischer_knoten  
;


DELETE FROM 
    gwp.hydraulischer_strang 
;

INSERT INTO 
    gwp.hydraulischer_strang 
    (
        t_id,
        t_type,
        t_ili_tid,
        name_nummer,
        referenz_laenge,
        referenz_rauheit,
        referenz_durchmesser,
        verbrauch,
        durchfluss,
        fliessgeschwindigkeit,
        zustand,
        bemerkung,
        bisknotenref,
        vonknotenref,
        obj_id
    )
SELECT 
    t_id,
    'gwp_bern_13_1sia405_wasser_gwp_hydraulischer_strang',
    t_ili_tid,
    name_nummer,
    referenz_laenge,
    referenz_rauheit,
    referenz_durchmesser,
    verbrauch,
    durchfluss,
    fliessgeschwindigkeit,
    zustand,
    bemerkung,
    bisknotenref,
    vonknotenref,
    obj_id
FROM 
    wasser.hydraulischer_strang 
;

