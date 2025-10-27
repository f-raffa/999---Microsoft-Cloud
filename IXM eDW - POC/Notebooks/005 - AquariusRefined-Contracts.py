#!/usr/bin/env python
# coding: utf-8

# ## 000 - Init Data Source
#
#
#

#

# In[151]:


# warehouse_location = 'abfss://files@datalakexfqecgy.dfs.core.windows.net/synapse/workspaces/synapse-all-labs-ws/warehouse/aquarius_refined_landing.db'
#
# spark.conf.set(
#   "fs.azure.account.key.datalakexfqecgy.dfs.core.windows.net",
#   "mSkKrXHPMvwvwdLxvKVZUijkJTdSAyuZzat3qM/fL8nSEdUu+yqJ4AQ3uWECmVnJ3QFTSJw03z1a+AStk9sCJw=="
# )


# In[10]:


from pyspark.sql.types import StringType, \
                              TimestampType, \
                              DecimalType, \
                              FloatType, \
                              IntegerType, \
                              BooleanType, \
                              StructType, \
                              StructField

raw_contracts_schema = StructType([
    StructField("strGUID", StringType()),
    StructField("contract_no", StringType()),
    StructField("precalc_type", StringType()),
    StructField("frame_id", StringType()),
    StructField("frame_ship", StringType()),
    StructField("purchase_sale", StringType()),
    StructField("contract_type", StringType()),
    StructField("party_code", StringType()),
    StructField("brand_code", StringType()),
    StructField("date_closed", TimestampType()),
    StructField("Evergreen", FloatType()),
    StructField("MP_Qty", FloatType()),
    StructField("Multi_Qps", FloatType()),
    StructField("dry_weight", FloatType()),
    StructField("wet_weight", FloatType()),
    StructField("moisture_pct", FloatType()),
    StructField("weight_unit", StringType()),
    StructField("tare_weight", FloatType()),
    StructField("loaded_wet", FloatType()),
    StructField("loaded_dry", FloatType()),
    StructField("loaded_moisture", FloatType()),
    StructField("base_curr", StringType()),
    StructField("invoice_curr", StringType()),
    StructField("fx_code", StringType()),
    StructField("fx_rate", FloatType()),
    StructField("phys_status", StringType()),
    StructField("hedge_status", StringType()),
    StructField("creation_date", TimestampType()),
    StructField("created_by", StringType()),
    StructField("contract_date", TimestampType()),
    StructField("weight_dev_pct", FloatType()),
    StructField("internal_company", StringType()),
    StructField("Vessel", StringType()),
    StructField("market_code", StringType()),
    StructField("ConRef", StringType()),
    StructField("agency_principle_joint", StringType()),
    StructField("agent_name", StringType()),
    StructField("long_spot", StringType()),
    StructField("fiscal_year", StringType()),
    StructField("accounting_period", StringType()),
    StructField("weight_franchise_pct", FloatType()),
    StructField("Bill_lading", TimestampType()),
    StructField("BL_number", StringType()),
    StructField("Shipment_date", TimestampType()),
    StructField("Load_Port", StringType()),
    StructField("Est_Arr_Load", TimestampType()),
    StructField("Act_Arr_Load", TimestampType()),
    StructField("Est_Dep_Load", TimestampType()),
    StructField("Act_Dep_Load", TimestampType()),
    StructField("Disport", StringType()),
    StructField("Est_Arr_Disport", TimestampType()),
    StructField("Act_Arr_Disport", TimestampType()),
    StructField("Est_Dep_Disport", TimestampType()),
    StructField("Act_Dep_Disport", TimestampType()),
    StructField("Sailing_days", IntegerType()),
    StructField("Shipping_agent", StringType()),
    StructField("Charter_Cargo", StringType()),
    StructField("Ship_long_spot", StringType()),
    StructField("Surveyor_Load", StringType()),
    StructField("Surveyor_Disport", StringType()),
    StructField("Country_Code", StringType()),
    StructField("Sch_Ship_Date", TimestampType()),
    StructField("Lay_Days_Start", TimestampType()),
    StructField("Lay_Days_End", TimestampType()),
    StructField("rail_cars", FloatType()),
    StructField("Last_Update", TimestampType()),
    StructField("Last_update_by", StringType()),
    StructField("Married", StringType()),
    StructField("Associated", IntegerType()),
    StructField("delivery_terms", StringType()),
    StructField("contractual_weight", FloatType()),
    StructField("contractual_weight_unit", StringType()),
    StructField("discharged_wet", FloatType()),
    StructField("discharged_dry", FloatType()),
    StructField("discharged_moisture", FloatType()),
    StructField("hedge_weight", FloatType()),
    StructField("freight_parity", IntegerType()),
    StructField("delivery_start", TimestampType()),
    StructField("delivery_end", TimestampType()),
    StructField("Freight_Weight", FloatType()),
    StructField("FCharge_LorD", StringType()),
    StructField("FAllow_LorD", StringType()),
    StructField("Est_BLading", TimestampType()),
    StructField("Customs_no", StringType()),
    StructField("Customs_Date", TimestampType()),
    StructField("Prior_Year_Results", FloatType()),
    StructField("ProForma_Live", StringType()),
    StructField("Default_DPs", IntegerType()),
    StructField("Hdg_dry_weight", FloatType()),
    StructField("Hdg_wet_weight", FloatType()),
    StructField("Hdg_Moisture", FloatType()),
    StructField("Hdg_franchise", FloatType()),
    StructField("Inv_dry_weight", FloatType()),
    StructField("Inv_wet_weight", FloatType()),
    StructField("Inv_Moisture", FloatType()),
    StructField("Inv_franchise", FloatType()),
    StructField("Membership", IntegerType()),
    StructField("Mem2", IntegerType()),
    StructField("Mem3", IntegerType()),
    StructField("Blending", IntegerType()),
    StructField("Mem5", IntegerType()),
    StructField("Assigned_User", StringType()),
    StructField("Finalised_Status", StringType()),
    StructField("Deal_No", StringType()),
    StructField("Auto_Comp", StringType()),
    StructField("Auto_Seq", StringType()),
    StructField("DeptGUID", StringType()),
    StructField("FinanceBank_Code", StringType()),
    StructField("FinanceBank_Ref", StringType()),
    StructField("DisableShippingAutoCopy", IntegerType()),
    StructField("strShortCode", StringType()),
    StructField("NegativeDev", FloatType()),
    StructField("MinWeight", FloatType()),
    StructField("MaxWeight", FloatType()),
    StructField("Options", StringType()),
    StructField("OptDecDate", TimestampType()),
    StructField("SubShipFrame", StringType()),
    StructField("Excluded", StringType()),
    StructField("Finance_Dep", FloatType()),
    StructField("Finance_Pct", IntegerType()),
    StructField("Finance_Amt", FloatType()),
    StructField("Finance_Unsold", FloatType()),
    StructField("Finance_Open", StringType()),
    StructField("Finance_Line", IntegerType()),
    StructField("Finance_Remarks", StringType()),
    StructField("Finance_Against", StringType()),
    StructField("Trader", StringType()),
    StructField("LoadingDays", IntegerType()),
    StructField("DischargeDays", IntegerType()),
    StructField("ShipDaysOverride", StringType()),
    StructField("LaytimeCalcs", StringType()),
    StructField("Married_2", StringType()),
    StructField("LCLocation", StringType()),
    StructField("Confirmed", StringType()),
    StructField("Orig_strguid", StringType()),
    StructField("Exposure_Type", StringType()),
    StructField("In_Use", IntegerType()),
    StructField("Tripartite_Broker", IntegerType()),
    StructField("In_Use_By", StringType()),
    StructField("Contract_Type2", StringType()),
    StructField("Schd_Arrival_Load", TimestampType()),
    StructField("Origin", StringType()),
    StructField("Packing", StringType()),
    StructField("Risk_Status", IntegerType()),
    StructField("Actual_Risk_Date", TimestampType()),
    StructField("PL_Centre", StringType()),
    StructField("Est_ContMADP", TimestampType()),
    StructField("Act_ContMADP", TimestampType()),
    StructField("voyage_number", StringType()),
    StructField("Carrier", StringType()),
    StructField("FinInvPresentation", TimestampType()),
    StructField("MetAvailabliity", TimestampType()),
    StructField("ProvPermitNo", StringType()),
    StructField("FinalPermitNo", StringType()),
    StructField("HoldingCertificate", TimestampType()),
    StructField("CashFLowRevalReqd", IntegerType()),
    StructField("MOA", TimestampType()),
    StructField("MAAInvDate", TimestampType()),
    StructField("QuotaMonth", TimestampType()),
    StructField("WeightUnitAlias", StringType()),
    StructField("ContractDuration", StringType()),
    StructField("MasterContractName", StringType()),
    StructField("BCShippingLinesID", StringType()),
    StructField("Volume", FloatType()),
    StructField("Density", FloatType()),
    StructField("SplitsAssayUpdate", StringType()),
    StructField("IsMasterContractEditable", BooleanType()),
    StructField("DraftWMT", FloatType()),
    StructField("DraftDMT", FloatType()),
    StructField("DraftH2O", FloatType()),
    StructField("StockLocation", StringType()),
    StructField("Stock_EA", TimestampType()),
    StructField("Stock_AA", TimestampType()),
    StructField("Stock_ED", TimestampType()),
    StructField("Stock_AD", TimestampType()),
    StructField("InStock", IntegerType()),
    StructField("LockOut", IntegerType()),
    StructField("IsLotbyLotInvoicingEnabled", BooleanType()),
    StructField("InvoiceVAT", BooleanType()),
    StructField("smelter_code", StringType()),
    StructField("stage_code", StringType()),
    StructField("PCFX_Code", StringType()),
    StructField("PCFX_Rate", FloatType()),
    StructField("IsPCFXRateOverrided", BooleanType()),
    StructField("HoldingCertificateReference", StringType()),
    StructField("Received_Weight", FloatType()),
    StructField("Include_Invoice", StringType()),
    StructField("SWCNumber", StringType()),
    StructField("IsFromExact", BooleanType()),
    StructField("DomesticTransportMode", StringType()),
    StructField("ForeignTransportMode", StringType()),
    StructField("ReceiptDocumentNumber", StringType()),
    StructField("IsFromSAP", BooleanType()),
    StructField("IsFakeContract", BooleanType()),
    StructField("ShortCodeFlag", IntegerType()),
    StructField("FixedFXRateConDetails", BooleanType()),
    StructField("In_Use_By_Form", StringType()),
    StructField("Split_From", StringType()),
    StructField("Inherit_Assay_From", StringType()),
    StructField("PaymentCode", StringType()),
    StructField("BackToBack", BooleanType()),
    StructField("MaterialAdverseChange", BooleanType()),
    StructField("Margining", BooleanType()),
    StructField("extractedAt", TimestampType())
])


# In[12]:


df = spark.read.load('abfss://aquarius-refined@synapsedataptfrmstacct.dfs.core.windows.net/dbo/Contracts/year=2024/month=*/dbo.Contracts_*.json', \
                     format='json', \
                     schema=raw_contracts_schema)


# In[38]:


import pyspark.sql.functions as sf

import hashlib
from pyspark.sql import functions as F, types as T

def sha256_binary(s: str):
    return bytearray(hashlib.sha256(s.encode('utf-8')).digest())

sha256_udf = F.udf(sha256_binary, T.BinaryType())

if 'Row_Hash' in df.columns:
    df = df.drop('Row_Hash')
if 'Hashable_Column' in df.columns:
    df = df.drop('Hashable_Column')

original_columns = df.columns

hash_calc_statement_columns = [f"COALESCE(CAST({column_name} AS STRING), '-9999')" for column_name in df.columns[0:-1]]
hash_calc_statement = f'CONCAT({", ".join(hash_calc_statement_columns)})'
print(hash_calc_statement_columns)

#print(hash_calc_statement)
df = df.selectExpr(f'{hash_calc_statement} AS Hashable_Column', *original_columns)
df = df.withColumn('Row_Hash', sha256_udf(sf.col('Hashable_Column')))
df = df.drop('Hashable_Column')
df = df.select(sf.col('Row_Hash'), *original_columns)


# In[39]:


df.write\
  .format("parquet")\
  .mode("overwrite")\
  .option("compression", "snappy")\
  .saveAsTable("contracts_landing")


# In[45]:


from pyspark.sql.functions import first

# staging_table_df = staging_table_df.sort(['Row_Hash', 'extractedAt'])

staging_table_df = df.sort(['Row_Hash', 'extractedAt']).groupBy(['Row_Hash', *original_columns[0:-1]])\
                     .agg(first("extractedAt", True))\
                     .withColumnRenamed('first(extractedAt)', 'minimumExtractedAt')\
                     .sort("Row_Hash", "minimumExtractedAt")


# In[46]:


staging_table_df.write\
                .format("parquet")\
                .mode("overwrite")\
                .option("compression", "snappy")\
                .saveAsTable("contracts_staging")