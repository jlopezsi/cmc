
# access-to-culture

The aim of this paper is to use Social Network Analysis (SNA) techniques of music concsumers.

## Info

Project code name
  ~ gnr

## Variables measuring access to music

### Recorded music

  * During last 3 months: number of CD purchased, and downloaded (factor with 3 levels). I transformed the original variables (numeric) into this factors with 3 levels. May be we would need to analyze the original variables)

```
[46] "C9P6CD_buy3"
[47] "C9P6CD_down3"
```

  * During last 3 months: number of songs purchased, and downloaded (factor with 3 levels) I transformed the original variables (numeric) into this factors with 3 levels. May be we would need to analyze the original variables)

```
[48]"C9P6song_buy3"
[49] "C9P6song_downl3"
```

### Live music

  * Going to concerts: contemporary music, satisfaction

    ```
[12]  "C7_P5d_Concert_actualm"  (factor with 16 levels)
[13] "C7_p5e_concert_satisf3"   (factors with 3 levels)
    ```

### For relating access to listening

  * Frequency of listening to the radio, CD player, other (factors with 7 levels)

    ```
[14] "C9P1_FRECL_radio"
[15] "C9P1_Frecl_CD"            "C9P1_Frecl_other"
    ```
    
  * Listening music to the: radio, tv, PC, CD, MP3-internet, MP3-other equipment  (factors with 2 levels)

    ```
[17] "music_radio"              "music_tv"
[19] "music_PC"                 "music_CD" 
[21] "music_MP3_PC_Internet"    "music_MP3_otherequip"
    ```

  * Time listening music (it is a summary of C9P4)

    ```
[186] "C9P4TimeLabCat"
[187] "C9P4TimeSatCat"           "C9P4TimeSunCat"
Frequency buying and recording(factor with 4 levels)
[44]"C9P5Frec_buy"
[45] "C9P5Frec_record
    ```

  * Where did you buy  de CD: In a store/shop, in a kiosk, in a market but legal, in a market without label, by mail, through the Internet, 
"C9P7CD_shop"

    ```
 [51] "C9P7CD_kiosc"             "C9P7CDmarca_market"
 [53] "C9P7CDsinmarca_market"    "C9P7CD_mail"
 [55] "C9P7CD_Internet"
    ```

  * Where did you buy the songs: Internet, downloaded it but paying,

    ```
[56]"C9P7Song_Internet"
[57] "C9P7CD_downpay"           "C9P7Song_downpay"
[59] "C9P7CD_freedown"          "C9P7Song_freedown"
[61] "C9P7CD_recTVradio"        "C9P7Song_recTVradio"
[63] "C9P7CD_copyfriend"        "C9P7Song_copyfriend"
[65] "C9P7CD_gift"              "C9P7Song_gift"
    ```

## Motivation

  * Motivation for 
        TM/MTM: for buying from fairs/street markets
        MDL: for downloading
        MCP: copying from friend

  * (factor with 2 levels:

    ```
 [67] "TMConvenience"            "MTMFast"                 
 [69] "MTMCheaper"               "MTMTrack"                
 [71] "MTMListenBefore"          "MTMSkedule"              
 [73] "MTMNotInShop"             "MDLConvenience"          
 [75] "MCPConvenience"           "MDLFast"                 
 [77] "MCPFast"                  "MDLCheaper"              
 [79] "MCPCheaper"               "MDLTrack"                
 [81] "MCPTrack"                 "MDLListen"               
 [83] "MCPListen"                "MDLSkedule"              
 [85] "MCPSkedule"               "MDLNotInShop"            
 [87] "MCPNotInShop"             
    ```

  * Reasons for not buying original CD

    ```
[159] "Expensive"                "NotUpdated"              
[161] "LowInterest"              "NoTime"                  
[163] "ListenRadio"              "Rno_other"     
    ```

### Music genres

  * Genre of music purchased/downloaded-recorded/listening to (factor 2 levels):

    ```
 [91] "Gbuy_child"               "Gdowrec_child"           
 [93] "Glisten_child"            "Gbuy_solo"               
 [95] "Gdowrec_solo"             "Glisten_solo"            
 [97] "Gbuy_ballad"              "Gdowrec_ballad"          
 [99] "Glisten_ballad"           "Gbuy_flamenco"           
[101] "Gdownrec_flamenco"        "Glisten_flamenco"        
[103] "Gbuy_newflamenco"         "Gdowrec_newflamenco"     
[105] "Glisten_newflamenco"      "Gbuy_OSfolklore"         
[107] "Gdowrec_OSfolklore"       "Glisten_OSfolklore"      
[109] "Gbuy_Spoprock"            "Gdowrec_Spoprock"        
[111] "Glisten_Spoprock"         "Gbuy_Lpoprock"           
[113] "Gdowrec_Lpoprock"         "Glisten_Lpoprock"        
[115] "Gbuy_Fpoprock"            "Gdowrec_Fpoprock"        
[117] "Glisten_Fpoprock"         "Gbuy_blues"              
[119] "Gdowrec_blues"            "Glisten_blues"           
[121] "Gbuy_jazz"                "Gdowrec_jazz"            
[123] "Glisten_jazz"             "Gbuy_wmusic"             
[125] "Gdowrec_wmusic"           "Glisten_wmusic"          
[127] "Gbuy_reggae"              "Gdowrec_reggae"          
[129] "Glisten_reggae"           "Gbuy_rap"                
[131] "Gdowrec_rap"              "Glisten_rap"             
[133] "Gbuy_electr"              "Gdowrec_electr"          
[135] "Glisten_electr"           "Gbuy_hardrock"           
[137] "Gdowrec_hardrock"         "Glisten_hardrock"        
[139] "Gbuy_house"               "Gdowrec_house"           
[141] "Glisten_house"            "Gbuy_classic"            
[143] "Gdowrec_classic"          "Glisten_classic"         
[145] "Gbuy_liric"               "Gdowrec_liric"           
[147] "Glisten_liric"            "Gbuy_opera"              
[149] "Gdowrec_opera"            "Glisten_opera"           
[151] "Gbuy_zar"                 "Gdowrec_zar"             
[153] "Glisten_zar"              "Gbuy_other"              
[155] "Gdowrec_other"            "Glisten_other"      
    ```


### Descriptors

```
[190] "SitPersonal" (factor 5 levels)      
[191] "occupa5"  (factor 5 levels
[185] "Habitat" (factor 5 levels)                
[167] "educ3"  (factor 3 levels)         "CA"   (comunidad autónoma)                   
[169] "Gender"                
[171] "Age5"    (factor with 5 levels)                 
[181] "fam_3niv"  (number of members, factor 3 levels)                           
```
