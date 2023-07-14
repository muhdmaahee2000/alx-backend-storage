-- Step 1: Create a temporary table with the calculated lifespan for each band
CREATE TEMPORARY TABLE temp_band_lifespan AS
SELECT
    band_name,
    (CASE
        WHEN split IS NOT NULL THEN YEAR(split) - YEAR(formed)
        ELSE 2022 - YEAR(formed)
    END) AS lifespan
FROM metal_bands;

-- Step 2: List all bands with Glam rock as their main style, ranked by their longevity
SELECT
    band_name,
    lifespan
FROM temp_band_lifespan
WHERE band_name IN (SELECT band_name FROM metal_bands WHERE main_style = 'Glam rock')
ORDER BY lifespan DESC;

