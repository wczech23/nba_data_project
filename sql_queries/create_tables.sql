CREATE TABLE wczech_2.dbo.player_salaries (
	Player VARCHAR(100),
	Salary Int,
	Year VARCHAR(100)
);

CREATE TABLE wczech_2.dbo.nba_player_advstats (
    Rk INT,
    Player VARCHAR(50),
    Age INT,
    Team VARCHAR(3),
    Pos VARCHAR(2),
    G INT,
    GS INT,
    MP INT,
    PER DECIMAL(4, 1),
    TS_Percent DECIMAL(5, 3),
    Three_PAr DECIMAL(4, 3),
    FT_Rate DECIMAL(4, 3),
    ORB_Percent DECIMAL(4, 1),
    DRB_Percent DECIMAL(4, 1),
    TRB_Percent DECIMAL(4, 1),
    AST_Percent DECIMAL(4, 1),
    STL_Percent DECIMAL(4, 1),
    BLK_Percent DECIMAL(4, 1),
    TOV_Percent DECIMAL(4, 1),
    USG_Percent DECIMAL(4, 1),
    OWS DECIMAL(4, 1),
    DWS DECIMAL(4, 1),
    WS DECIMAL(4, 1),
    WS_Per_48 DECIMAL(4, 3),
    OBPM DECIMAL(4, 1),
    DBPM DECIMAL(4, 1),
    BPM DECIMAL(4, 1),
    VORP DECIMAL(4, 1),
    Awards VARCHAR(100),
    Player_Additional VARCHAR(20),
    Year VARCHAR(100)
);

CREATE TABLE wczech_2.dbo.coach_stats (
    Coach VARCHAR(50),
    Team VARCHAR(3),
    Seasons_with_Franchise INT,
    Seasons_Overall INT,
    RS_G INT,
    RS_W INT,
    RS_L INT,
    RS_Franchise_G INT,
    RS_Franchise_W INT,
    RS_Franchise_L INT,
    RS_Career_G INT,
    RS_Career_W INT,
    RS_Career_L INT,
    RS_Career_WP DECIMAL(5, 3),
    PF_G INT,
    PF_W INT,
    PF_L INT,
    PF_Franchise_G INT,
    PF_Franchise_W INT,
    PF_Franchise_L INT,
    PF_Career_G INT,
    PF_Career_W INT,
    PF_Career_L INT
);

CREATE TABLE wczech_2.dbo.team_stats (
    Rk INT,
    Team VARCHAR(50),
    Overall_Record VARCHAR(7),
    Place_Home VARCHAR(10),
    Place_Road VARCHAR(10),
    Conference_E VARCHAR(10),
    Conference_W VARCHAR(10),
    Division_A VARCHAR(10),
    Division_C VARCHAR(10),
    Division_SE VARCHAR(10),
    Division_NW VARCHAR(10),
    Division_P VARCHAR(10),
    Division_SW VARCHAR(10),
    All_Star_Pre VARCHAR(10),
    All_Star_Post VARCHAR(10),
    Margin_Less_Than_3 VARCHAR(10),
    Margin_Greater_Than_10 VARCHAR(10),
    Month_Nov VARCHAR(10),
    Month_Dec VARCHAR(10),
    Month_Jan VARCHAR(10),
    Month_Feb VARCHAR(10),
    Month_Mar VARCHAR(10),
    Month_Apr VARCHAR(10)
);

