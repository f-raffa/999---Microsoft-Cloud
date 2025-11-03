
-- AQUARIUS LDCUSTOM USERS
TRUNCATE TABLE core_staging.s_aq_ldc_users;
INSERT INTO core_staging.s_aq_ldc_users (
    Hub_Hash_Key,
    Row_Hash,
    application,
    username,
    region,
    office,
    department,
    email,
    SYS_CHANGE_OPERATION,
    extractedAt
)
   SELECT src.Hash_Key Hub_Hash_Key,
          src.Row_Hash,
          src.application,
          src.username,
          src.region,
          src.office,
          src.department,
          src.email,
          CASE
              WHEN tgt.Hub_Hash_Key IS NULL OR Is_Deleted THEN 'I'
              WHEN src.Row_Hash <> tgt.Row_Hash THEN 'U'
              WHEN src.SYS_CHANGE_OPERATION = 'D' THEN 'D'
          END SYS_CHANGE_OPERATION,
          src.extractedAt
     FROM aquarius_ldcustom_staging.users src
LEFT JOIN ( SELECT Hub_Hash_Key,
                   Row_Hash,
                   Is_Deleted
              FROM core_vault.s_aq_ldc_users
             WHERE Is_Current ) tgt ON src.Hash_Key = tgt.Hub_Hash_Key
    WHERE Is_Current
      AND (tgt.Hub_Hash_Key IS NULL OR src.Row_Hash <> tgt.Row_Hash OR tgt.Is_Deleted OR src.SYS_CHANGE_OPERATION = 'D');


INSERT INTO core_vault.s_aq_ldc_users (
    Hub_Hash_Key,
    Row_Hash,
    application,
    username,
    region,
    office,
    department,
    email,
    Validity_Start,
    Validity_End,
    Creation_Timestamp,
    Last_Update_Timestamp,
    Is_Current,
    Is_Deleted
)
SELECT Hub_Hash_Key,
       Row_Hash,
       application,
       username,
       region,
       office,
       department,
       email,
       extractedAt Validity_Start,
       CAST('9999-12-31' AS TIMESTAMP) Validity_End,
       current_timestamp() Creation_Timestamp,
       current_timestamp() Last_Update_Timestamp,
       TRUE Is_Current,
       FALSE Is_Deleted
  FROM core_staging.s_aq_ldc_users
 WHERE SYS_CHANGE_OPERATION IN ('I', 'U');


INSERT INTO core_vault.s_aq_ldc_users (
    Hub_Hash_Key,
    Row_Hash,
    application,
    username,
    region,
    office,
    department,
    email,
    Validity_Start,
    Validity_End,
    Creation_Timestamp,
    Last_Update_Timestamp,
    Is_Current,
    Is_Deleted
)
SELECT tgt.Hub_Hash_Key,
       tgt.Row_Hash,
       tgt.application,
       tgt.username,
       tgt.region,
       tgt.office,
       tgt.department,
       tgt.email,
       src.extractedAt Validity_Start,
       CAST('9999-12-31' AS TIMESTAMP) Validity_End,
       current_timestamp() Creation_Timestamp,
       current_timestamp() Last_Update_Timestamp,
       TRUE Is_Current,
       TRUE Is_Deleted
  FROM core_staging.s_aq_ldc_users src
  JOIN ( SELECT *
           FROM core_vault.s_aq_ldc_users
          WHERE Is_Current ) tgt on src.Hub_Hash_Key = tgt.Hub_Hash_Key
 WHERE SYS_CHANGE_OPERATION IN ('D');


UPDATE tgt
   SET Validity_End = src.extractedAt,
       Last_Update_Timestamp = current_timestamp(),
       Is_Current = FALSE
  FROM core_vault.s_aq_ldc_users tgt
  JOIN core_staging.s_aq_ldc_users src on src.Hub_Hash_Key = tgt.Hub_Hash_Key
                                          and src.SYS_CHANGE_OPERATION IN ('U', 'D')
 WHERE tgt.Is_Current IS TRUE;








-- AQUARIUS REFINED USERS
TRUNCATE TABLE core_staging.s_aq_r_users;
INSERT INTO core_staging.s_aq_r_users (
    Hub_Hash_Key,
    Row_Hash,
    UserID,
    Username,
    Description,
    GPreAm,
    EOD_EOM,
    AutoPL,
    Closed,
    D_Cascade,
    AutoQPDates,
    QPAdjust,
    AllShipments,
    UpdateAllShips,
    AutoPayTerms,
    FinAssayAdjust,
    OverrideIncPrevInvControl,
    SYS_CHANGE_OPERATION,
    extractedAt
)
   SELECT src.Hash_Key Hub_Hash_Key,
          src.Row_Hash,
          src.UserID,
          src.Username,
          src.Description,
          src.GPreAm,
          src.EOD_EOM,
          src.AutoPL,
          src.Closed,
          src.D_Cascade,
          src.AutoQPDates,
          src.QPAdjust,
          src.AllShipments,
          src.UpdateAllShips,
          src.AutoPayTerms,
          src.FinAssayAdjust,
          src.OverrideIncPrevInvControl,
          CASE
              WHEN tgt.Hub_Hash_Key IS NULL OR Is_Deleted THEN 'I'
              WHEN src.Row_Hash <> tgt.Row_Hash THEN 'U'
              WHEN src.SYS_CHANGE_OPERATION = 'D' THEN 'D'
          END SYS_CHANGE_OPERATION,
          src.extractedAt
     FROM aquarius_refined_staging.users src
LEFT JOIN ( SELECT Hub_Hash_Key,
                   Row_Hash,
                   Is_Deleted
              FROM core_vault.s_aq_r_users
             WHERE Is_Current ) tgt ON src.Hash_Key = tgt.Hub_Hash_Key
    WHERE Is_Current
      AND (tgt.Hub_Hash_Key IS NULL OR src.Row_Hash <> tgt.Row_Hash OR tgt.Is_Deleted OR src.SYS_CHANGE_OPERATION = 'D');


INSERT INTO core_vault.s_aq_r_users (
    Hub_Hash_Key,
    Row_Hash,
    UserID,
    Username,
    Description,
    GPreAm,
    EOD_EOM,
    AutoPL,
    Closed,
    D_Cascade,
    AutoQPDates,
    QPAdjust,
    AllShipments,
    UpdateAllShips,
    AutoPayTerms,
    FinAssayAdjust,
    OverrideIncPrevInvControl,
    Validity_Start,
    Validity_End,
    Creation_Timestamp,
    Last_Update_Timestamp,
    Is_Current,
    Is_Deleted
)
SELECT Hub_Hash_Key,
       Row_Hash,
       UserID,
       Username,
       Description,
       GPreAm,
       EOD_EOM,
       AutoPL,
       Closed,
       D_Cascade,
       AutoQPDates,
       QPAdjust,
       AllShipments,
       UpdateAllShips,
       AutoPayTerms,
       FinAssayAdjust,
       OverrideIncPrevInvControl,
       extractedAt Validity_Start,
       CAST('9999-12-31' AS TIMESTAMP) Validity_End,
       current_timestamp() Creation_Timestamp,
       current_timestamp() Last_Update_Timestamp,
       TRUE Is_Current,
       FALSE Is_Deleted
  FROM core_staging.s_aq_r_users
 WHERE SYS_CHANGE_OPERATION IN ('I', 'U');


INSERT INTO core_vault.s_aq_r_users (
    Hub_Hash_Key,
    Row_Hash,
    UserID,
    Username,
    Description,
    GPreAm,
    EOD_EOM,
    AutoPL,
    Closed,
    D_Cascade,
    AutoQPDates,
    QPAdjust,
    AllShipments,
    UpdateAllShips,
    AutoPayTerms,
    FinAssayAdjust,
    OverrideIncPrevInvControl,
    Validity_Start,
    Validity_End,
    Creation_Timestamp,
    Last_Update_Timestamp,
    Is_Current,
    Is_Deleted
)
SELECT tgt.Hub_Hash_Key,
       tgt.Row_Hash,
       tgt.UserID,
       tgt.Username,
       tgt.Description,
       tgt.GPreAm,
       tgt.EOD_EOM,
       tgt.AutoPL,
       tgt.Closed,
       tgt.D_Cascade,
       tgt.AutoQPDates,
       tgt.QPAdjust,
       tgt.AllShipments,
       tgt.UpdateAllShips,
       tgt.AutoPayTerms,
       tgt.FinAssayAdjust,
       tgt.OverrideIncPrevInvControl,
       src.extractedAt Validity_Start,
       CAST('9999-12-31' AS TIMESTAMP) Validity_End,
       current_timestamp() Creation_Timestamp,
       current_timestamp() Last_Update_Timestamp,
       TRUE Is_Current,
       TRUE Is_Deleted
  FROM core_staging.s_aq_r_users src
  JOIN ( SELECT *
           FROM core_vault.s_aq_r_users
          WHERE Is_Current ) tgt on src.Hub_Hash_Key = tgt.Hub_Hash_Key
 WHERE SYS_CHANGE_OPERATION IN ('D');


UPDATE tgt
   SET Validity_End = src.extractedAt,
       Last_Update_Timestamp = current_timestamp(),
       Is_Current = FALSE
  FROM core_vault.s_aq_r_users tgt
  JOIN core_staging.s_aq_r_users src on src.Hub_Hash_Key = tgt.Hub_Hash_Key
                                        and src.SYS_CHANGE_OPERATION IN ('U', 'D')
 WHERE tgt.Is_Current IS TRUE;
