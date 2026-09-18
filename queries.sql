SELECT 
    player,
    squad,
    pos,
    age,
    min_played,
    mp AS matches_played,
    ROUND((min_played::DECIMAL / 2700) * 100, 1) AS fatigue_percentage,
    CASE 
        WHEN min_played >= 2000 THEN 'إرهاق مرتفع جداً (مرشح للتدوير)'
        WHEN min_played >= 1200 THEN 'جهد متوسط'
        ELSE 'جاهزية عالية / مشاركة قليلة'
    END AS fatigue_status
FROM bundesliga_players
WHERE min_played > 0
ORDER BY min_played DESC
LIMIT 15;

----------------------------

SELECT 
    player,
    squad,
    gls AS goals,
    ast AS assists,
    g_plus_a AS total_contributions,
    min_played,
    ROUND((g_plus_a::DECIMAL / min_played) * 90, 2) AS contributions_per_90
FROM bundesliga_players
WHERE min_played >= 500
ORDER BY contributions_per_90 DESC
LIMIT 10;

----------------------------

SELECT 
    player,
    squad,
    pos,
    age,
    min_played,
    mp AS matches_played,
    ROUND((min_played::DECIMAL / 2700) * 100, 1) AS fatigue_percentage,
    CASE 
        WHEN min_played >= 2000 THEN 'إرهاق مرتفع جداً'
        WHEN min_played >= 1200 THEN 'جهد متوسط'
        ELSE 'مشاركة قليلة'
    END AS fatigue_status
FROM bundesliga_players
WHERE min_played > 0
ORDER BY min_played DESC;

----------------------------

SELECT 
    player,
    squad,
    pos,
    gls AS goals,
    ast AS assists,
    g_plus_a AS total_contributions,
    min_played,
    ROUND((g_plus_a::DECIMAL / min_played) * 90, 2) AS contributions_per_90
FROM bundesliga_players
WHERE min_played >= 300
ORDER BY contributions_per_90 DESC;

----------------------------

SELECT 
    player,
    squad,
    pos,
    age,
    min_played,
    mp AS matches_played,
    gls AS goals,
    ast AS assists,
    g_plus_a AS total_contributions,
    ROUND((min_played::DECIMAL / 2700) * 100, 1) AS fatigue_percentage,
    CASE 
        WHEN min_played >= 2000 THEN 'إرهاق مرتفع جداً'
        WHEN min_played >= 1200 THEN 'جهد متوسط'
        ELSE 'مشاركة قليلة'
    END AS fatigue_status,
    ROUND((g_plus_a::DECIMAL / NULLIF(min_played, 0)) * 90, 2) AS contributions_per_90
FROM bundesliga_players
WHERE min_played > 0
ORDER BY min_played DESC;

----------------------------


SELECT 
    player,
    squad,
    comp,
    pos,
    age,
    born,
    mp AS matches_played,
    starts,
    min_played,
    nineties,
    gls AS goals,
    ast AS assists,
    g_plus_a AS total_contributions,
    crd_y AS yellow_cards,
    crd_r AS red_cards,
    sh AS total_shots,
    sot AS shots_on_target,
    fls AS fouls_committed,
    fld AS fouls_drawn,
    tklw AS tackles_won,
    -- المؤشرات المحسوبة
    ROUND((min_played::DECIMAL / 2700) * 100, 1) AS fatigue_percentage,
    CASE 
        WHEN min_played >= 2000 THEN 'إرهاق مرتفع جداً'
        WHEN min_played >= 1200 THEN 'جهد متوسط'
        ELSE 'مشاركة قليلة'
    END AS fatigue_status,
    ROUND((g_plus_a::DECIMAL / NULLIF(min_played, 0)) * 90, 2) AS contributions_per_90
FROM bundesliga_players
WHERE min_played > 0
ORDER BY min_played DESC;

