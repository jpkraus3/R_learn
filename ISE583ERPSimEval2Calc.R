## 22.1 At the end of the game, what was your team's Return on Share Holders Equity?
# instructions - Net Income / Total Equity x 100% = %
# Query - Income statement
# filter to only company code "CC"
# Column - Net Income, Equity
# Net Income - q8, d30: (4,482,150.19 €)
# Equity - q8, d30: (12,482,150.19 €)
CC.Net.Income <- 4482150.19
CC.Equity <- 12482150.19
CC.ROE = 100*(CC.Net.Income/CC.Equity)
CC.ROE

## 22.2 At the end of the game what was your team's Debt-to-Equity Ratio
# Instruction - Total Liabilities / Total Equity x 100 = %
# Query - Income statement
# filter to only company code "CC"
# Column - Current Liabilities, Equity
# Current Liabilities - q8, d30: (13,346,554.71 €)
# Equity - q8, d30: (12,482,150.19 €)
CC.Current.Liabilities <- 13346554.71
CC.Equity
CC.DtoE <- 100*(CC.Current.Liabilities/CC.Equity) 
CC.DtoE

## 23.1 Complete the table for the ROE and D/E for all the Teams
# Query - Income statement
# Columns - Current Liabilities, Net Income, Equity
# instructions - Net Income / Total Equity x 100% = ROE%
# instruction - Total Liabilities / Total Equity x 100 = D/E%

# filter company code AA
# Current Liabilities - q8, d30: (11,765,736.13 €)
AA.Current.Liabilities <- 11765736.13
# Net Income - q8, d30: 457,885.30 €
AA.Net.Income <- 457885.30 
# Equity - q8, d30: (7,542,114.70 €)
AA.Equity <- 7542114.70
AA.ROE <- 100*(AA.Net.Income/AA.Equity)
AA.DtoE <- 100*(AA.Current.Liabilities/AA.Equity) 
AA.ROE
AA.DtoE

# filter company code BB
# Current Liabilities - q8, d30: (13,872,111.98 €)
BB.Current.Liabilities <- 13872111.98
# Net Income - q8, d30: (6,908,707.16 €)
BB.Net.Income <- 6908707.16
#Equity - q8, d30: (14,908,707.16 €)
BB.Equity <- 14908707.16
BB.ROE <- 100*(BB.Net.Income/BB.Equity)
BB.DtoE <- 100*(BB.Current.Liabilities/BB.Equity) 
BB.ROE
BB.DtoE

# filter company code DD
# Current Liabilities - q8, d30: (12,136,818.80 €)
DD.Current.Liabilities <- 12136818.80
# Net Income - q8, d30: (6,505,740.11 €)
DD.Net.Income <- 6505740.11
# Equity - q8, d30: (14,505,740.11 €)
DD.Equity <- 14505740.11
DD.ROE <- 100*(DD.Net.Income/DD.Equity)
DD.DtoE <- 100*(DD.Current.Liabilities/DD.Equity) 
DD.ROE
DD.DtoE

# filter company code EE
# Current Liabilities - q8, d30: (10,900,000.00 €)
EE.Current.Liabilities <- 10900000.00
# Net Income - q8, d30: (2,532,154.65 €)
EE.Net.Income <- 2532154.65
# Equity - q8, d30: (10,532,154.65 €)
EE.Equity <- 10532154.65
EE.ROE <- 100*(EE.Net.Income/EE.Equity)
EE.DtoE <- 100*(EE.Current.Liabilities/EE.Equity) 
EE.ROE
EE.DtoE

# filter company code FF
# Current Liabilities - q8, d30: (16,543,894.30 €)
FF.Current.Liabilities <- 16543894.30
# Net Income - q8, d30: (2,605,548.31 €)
FF.Net.Income <- 2605548.31
# Equity - q8, d30: (10,605,548.31 €)
FF.Equity <- 10605548.31
FF.ROE <- 100*(FF.Net.Income/FF.Equity)
FF.DtoE <- 100*(FF.Current.Liabilities/FF.Equity) 
FF.ROE
FF.DtoE

