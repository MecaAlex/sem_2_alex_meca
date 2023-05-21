COPY
(
SELECT json_build_object(
    'type', 'FeatureCollection',
    'features', json_agg(ST_AsGeoJSON(geom)::json)
    )
FROM judete
) TO 'C:\Users\meka_\Downloads\ro_2.geojson'