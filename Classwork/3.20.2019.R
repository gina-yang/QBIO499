R version 3.5.2 (2018-12-20) -- "Eggshell Igloo"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> setwd("C:/Users/ginay/Downloads")
> prostate <- read.table("prostate.data")
> dim(prostate)
[1] 97 10
> fix(prostate)
> summary(prostate)
     lcavol           lweight           age             lbph              svi              lcp             gleason          pgg45             lpsa           train        
 Min.   :-1.3471   Min.   :2.375   Min.   :41.00   Min.   :-1.3863   Min.   :0.0000   Min.   :-1.3863   Min.   :6.000   Min.   :  0.00   Min.   :-0.4308   Mode :logical  
 1st Qu.: 0.5128   1st Qu.:3.376   1st Qu.:60.00   1st Qu.:-1.3863   1st Qu.:0.0000   1st Qu.:-1.3863   1st Qu.:6.000   1st Qu.:  0.00   1st Qu.: 1.7317   FALSE:30       
 Median : 1.4469   Median :3.623   Median :65.00   Median : 0.3001   Median :0.0000   Median :-0.7985   Median :7.000   Median : 15.00   Median : 2.5915   TRUE :67       
 Mean   : 1.3500   Mean   :3.629   Mean   :63.87   Mean   : 0.1004   Mean   :0.2165   Mean   :-0.1794   Mean   :6.753   Mean   : 24.38   Mean   : 2.4784                  
 3rd Qu.: 2.1270   3rd Qu.:3.876   3rd Qu.:68.00   3rd Qu.: 1.5581   3rd Qu.:0.0000   3rd Qu.: 1.1787   3rd Qu.:7.000   3rd Qu.: 40.00   3rd Qu.: 3.0564                  
 Max.   : 3.8210   Max.   :4.780   Max.   :79.00   Max.   : 2.3263   Max.   :1.0000   Max.   : 2.9042   Max.   :9.000   Max.   :100.00   Max.   : 5.5829                  
> fix(prostate)
> pairs(prostate)
> lm.fit = lm(lpsa~lcavol, data=prostate)
> summary(lm.fit)

Call:
lm(formula = lpsa ~ lcavol, data = prostate)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.67624 -0.41648  0.09859  0.50709  1.89672 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  1.50730    0.12194   12.36   <2e-16 ***
lcavol       0.71932    0.06819   10.55   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7875 on 95 degrees of freedom
Multiple R-squared:  0.5394,	Adjusted R-squared:  0.5346 
F-statistic: 111.3 on 1 and 95 DF,  p-value: < 2.2e-16

> confint(lm.fit)
                2.5 %    97.5 %
(Intercept) 1.2652222 1.7493727
lcavol      0.5839404 0.8547004
> predict(lm.fit, data=prostate)
        1         2         3         4         5         6         7         8         9        10        11        12        13        14        15        16        17 
1.0902222 0.7921115 1.1398502 0.6412553 2.0478064 0.7521390 2.0375546 2.0058924 0.9487245 1.6678092 1.6904668 0.5383199 2.6678705 2.5697687 2.3747769 2.6158846 1.2084087 
       18        19        20        21        22        23        24        25        26        27        28        29        30        31        32        33        34 
3.1534522 1.1029539 1.6384451 2.3326474 2.9885499 1.1154641 2.7889172 1.7844246 2.5480958 1.8761819 1.2192258 2.2555897 3.2406036 1.7124325 1.6384451 2.4246919 1.5144549 
       35        36        37        38        39        40        41        42        43        44        45        46        47        48        49        50        51 
1.5000680 2.4484079 2.5309683 1.8363325 3.4213792 2.0809606 1.9536908 2.5447028 1.9260970 2.7816144 2.5763080 2.7041934 3.4694976 2.3439756 2.7630262 2.3854653 2.2927402 
       52        53        54        55        56        57        58        59        60        61        62        63        64        65        66        67        68 
2.7014636 1.8761819 3.0373211 3.7757393 2.4186387 2.2083181 1.8408708 1.8974024 2.2706809 1.8363325 2.9440807 3.5039214 2.9709027 2.9985723 2.5565090 2.9623900 3.0886047 
       69        70        71        72        73        74        75        76        77        78        79        80        81        82        83        84        85 
1.1862740 2.3661102 2.8481683 2.3417242 2.3812090 2.8300997 3.6647020 3.7667767 2.9537752 3.3326860 3.4122738 3.5066055 2.5631694 3.3154215 3.3868864 3.4333433 2.6311250 
       86        87        88        89        90        91        92        93        94        95        96        97 
3.8831043 2.9633408 2.7529126 3.5268570 2.6311250 3.8425646 3.3292661 3.5431668 4.2558233 3.5986836 3.5807842 4.0047537 
> lm2.fit = lm(lpsa~lcavol+lweight, data=prostate)
> summary(lm2, fit)
Error in summary(lm2, fit) : object 'lm2' not found
> summary(lm2.fit)

Call:
lm(formula = lpsa ~ lcavol + lweight, data = prostate)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.61051 -0.44135 -0.04666  0.53542  1.90424 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -0.81344    0.65309  -1.246 0.216033    
lcavol       0.65154    0.06693   9.734 6.75e-16 ***
lweight      0.66472    0.18414   3.610 0.000494 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7419 on 94 degrees of freedom
Multiple R-squared:  0.5955,	Adjusted R-squared:  0.5869 
F-statistic: 69.19 on 2 and 94 DF,  p-value: < 2.2e-16

> lmall.fit = lm(lpsa~., data=prostate)
> summary(lmall.fit)

Call:
lm(formula = lpsa ~ ., data = prostate)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.76795 -0.35653 -0.00437  0.37978  1.55913 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.177306   1.338810   0.132  0.89495    
lcavol       0.564417   0.088387   6.386 8.08e-09 ***
lweight      0.622204   0.202179   3.077  0.00279 ** 
age         -0.021306   0.011383  -1.872  0.06460 .  
lbph         0.096833   0.058441   1.657  0.10113    
svi          0.761466   0.242697   3.138  0.00233 ** 
lcp         -0.105872   0.090661  -1.168  0.24609    
gleason      0.049967   0.158955   0.314  0.75401    
pgg45        0.004434   0.004485   0.989  0.32558    
trainTRUE    0.004104   0.162772   0.025  0.97994    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7035 on 87 degrees of freedom
Multiple R-squared:  0.6634,	Adjusted R-squared:  0.6286 
F-statistic: 19.05 on 9 and 87 DF,  p-value: < 2.2e-16

> install.packages("leaps")
Installing package into ‘C:/Users/ginay/Documents/R/win-library/3.5’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/leaps_3.0.zip'
Content type 'application/zip' length 360746 bytes (352 KB)
downloaded 352 KB

package ‘leaps’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\ginay\AppData\Local\Temp\RtmpGMs4hY\downloaded_packages
> library(leaps)
Warning message:
package ‘leaps’ was built under R version 3.5.3 
> library(boot)
> ff = regsbusets(lpsa~.,data=prostate, method="forward")
Error in regsbusets(lpsa ~ ., data = prostate, method = "forward") : 
  could not find function "regsbusets"
> ff = regsubsets(lpsa~.,data=prostate, method="forward")
> summary(ff)
Subset selection object
Call: regsubsets.formula(lpsa ~ ., data = prostate, method = "forward")
9 Variables  (and intercept)
          Forced in Forced out
lcavol        FALSE      FALSE
lweight       FALSE      FALSE
age           FALSE      FALSE
lbph          FALSE      FALSE
svi           FALSE      FALSE
lcp           FALSE      FALSE
gleason       FALSE      FALSE
pgg45         FALSE      FALSE
trainTRUE     FALSE      FALSE
1 subsets of each size up to 8
Selection Algorithm: forward
         lcavol lweight age lbph svi lcp gleason pgg45 trainTRUE
1  ( 1 ) "*"    " "     " " " "  " " " " " "     " "   " "      
2  ( 1 ) "*"    "*"     " " " "  " " " " " "     " "   " "      
3  ( 1 ) "*"    "*"     " " " "  "*" " " " "     " "   " "      
4  ( 1 ) "*"    "*"     " " "*"  "*" " " " "     " "   " "      
5  ( 1 ) "*"    "*"     "*" "*"  "*" " " " "     " "   " "      
6  ( 1 ) "*"    "*"     "*" "*"  "*" " " " "     "*"   " "      
7  ( 1 ) "*"    "*"     "*" "*"  "*" "*" " "     "*"   " "      
8  ( 1 ) "*"    "*"     "*" "*"  "*" "*" "*"     "*"   " "      
> plot(summary(ff))
Error in xy.coords(x, y, xlabel, ylabel, log) : 
  'x' is a list, but does not have components 'x' and 'y'
> plot(summary(ff)$rss)
> plot(summary(ff)$adjr2)
> nl.fit = lm(lpsa~I(lcavol^2), data=prostate)
> summary(nl.fit)

Call:
lm(formula = lpsa ~ I(lcavol^2), data = prostate)

Residuals:
    Min      1Q  Median      3Q     Max 
-2.2431 -0.6426  0.1474  0.5537  1.8091 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  1.73404    0.12395  13.990  < 2e-16 ***
I(lcavol^2)  0.23280    0.02715   8.574 1.83e-13 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.8713 on 95 degrees of freedom
Multiple R-squared:  0.4362,	Adjusted R-squared:  0.4303 
F-statistic: 73.51 on 1 and 95 DF,  p-value: 1.834e-13

> # y = mx^2 + b instead of y = mx + b
> 
> nl.fit = lm(lpsa~poly(lcavol, 3), data=prostate)
> # y = m1x^3 + m2x^2 + m3x + b
> glm.fit = glm(lpsa~lcavol+weight+svi,data=prostate)
Error in eval(predvars, data, env) : object 'weight' not found
> glm.fit = glm(lpsa~lcavol+lweight+svi,data=prostate)
> cv.glm(prostate, glm.fit,k=5)
Error in cv.glm(prostate, glm.fit, k = 5) : unused argument (k = 5)
> cv.glm(prostate, glm.fit,K=5)
$call
cv.glm(data = prostate, glmfit = glm.fit, K = 5)

$K
[1] 5

$delta
[1] 0.5536525 0.5451017

$seed
  [1]         403          10  1920117878  -669702240   608632931 -1467939583  1108166768   654685198  2065769593   670667787 -1384653510  -521036740   246283135  2109384917
 [15]    46558444   751593026  1332148637  -398246889  -596885122  1288755000   156499995  -480423559  -643647544 -2141742090  -226202063  -167843741  -665933774 -1082890876
 [29]   422079431  1537228445  -663513580   203721914   -84076283  1675074271  -467966106  1574117104  1682277907 -1600745551  -868943264  -240064514 -1127053431  -576073541
 [43]  1632332938  -173584532 -1492140817 -1445030107  1884758492  1029963698   585254573 -1704624537  1635941774 -1820755352  1506621035 -1235939319  -225988968 -1925432890
 [57]  -732329695   164186547  -226323166  1794723604   955488151 -1460144243   635906724 -1141627766 -1980646667  -299242161  1804503638  2101180672 -1062339517  -608210975
 [71]  1659420496  -324005458 -1931108519 -2066950805  1544109274  -658950756  1831090591   810294261 -2133951860   474771298 -1630695619  1394304951  -803494818 -1890018920
 [85]  1913666811   345938073   721799464  -343871530    64044113 -1563568381 -1982177646 -1772241884  1753244391 -1240492227 -2093078604   550939674  -160721051 -2066191873
 [99]   -68967290  -976992240  -362849613   488708433    15005952  -378979362  1414662185 -2031435813   -38732566 -1357124980   813602255 -1132091003 -1943621060   631269138
[113]  1880976397  1801987911  -657521362 -2022034296 -1962442357   673151337     6501176  -475882010  -406230655  -535913197  -660219198  -472496780   183399799    27131501
[127]  -422063868  2002568234   716454293 -1591456209  -189404362   273331040   197818787 -1121752383 -1353366864  1678958030 -2034044615 -1372959413   973145850  2079410172
[141]   709511231   108531989 -1131718100   743507714  1023755229   525643479 -1043457602  1081744376 -1937936421   670335545   692421512 -2060836042  -114548367  -246793309
[155]  1949706994    48261700  -805325561   620309725   -75437612  -984830726  -459107259 -1400290145   789497382  1062503088 -1417506989  -978929039 -1743599712  -377196738
[169]    83129929    98751227  -528411958 -2083605460 -1409160145   213058789 -1049399908  1887539186  1207781997   885755815 -1048194610  1271174952   666656043  1670344521
[183]  -624421800  1834725638  1228500193 -1266676621  1960409314   199680084  -452876969   563795277  -419075868   312530122 -1584146123  -172814449  -133116778  1537918016
[197]  -973499133 -1022969567 -1721404912  -798197266   899206553  2047818283   -95974630   832532956  1161234399  1044709301   433047884  -466059358   572626685   313087991
[211]   147714334 -1442341928   226393403 -1220044071  1618179688 -1482872938   644231953  1149099203  1874597074 -1203052188   150336679   962566653  1957475316 -1491415846
[225]  -738009563 -2064665793   590708934   210607440  -474094221  -967489888  -393071940  -267000880 -1300441758  -902684952  1639529676 -1568355844  1376931314  1972853888
[239] -1574524428   -25398648  2042166074  -205421232  1509180524 -1884029548 -2050226094   821931488  1567581388 -1228484960  -472153726   354881768 -1000068372    99745084
[253] -1926821774   934040176 -1787733468 -1439709128  1586186522  1360835792  2068998460  2056663956   506500994  1711520704   871470652  -970403440 -2078214110  1962900744
[267]  -613447540   954023708     -115566  -607326848 -2068877292   273475368  -250964422  -810686000    71500140  -791565388 -1703489006 -1015887904 -1146852916  -966162208
[281] -1803332574  1622858536 -1212581364   698594108  1003370482    69223152  1397029444 -1248565672 -1400731846  -980150288 -1604334916  1090876692  -691045182  -451572640
[295]   625061244   513359824  -885991134 -1111470424  -520437876  1160381628 -1289305294   -85006784  -572910412 -1911284664   598039994   157850128   430005484   970670420
[309]   445274898  1326835104  -776482100 -1663165856  1098045378 -1349299416 -2127183444 -1909070532 -1901272206  1025725744 -1697923292 -2066762440  -949578022  1914754960
[323]   483189500   714865556 -2088942526   314453248 -2075807684  1972247888  1484035234  -230208696 -2134671604 -1963753764 -1899698350  1687983744  -129486764 -1569909784
[337] -1056208134   858840400   308848428 -1260991628  1048298386  1235597920  -946311284   485042016   462130146 -2008429656 -1647448884   669456892 -1132617806  1618030064
[351]  -148083260 -1158332072   651154810   734842288  1219675068 -1138214828  -653611070   760064032   559366332  -587679152 -1292855326  1541574248  1941499468  1419811068
[365] -2070216718  -129878784  1337404276 -1355995128  1115064762   866373072   747545580 -1754735724   754125778   493080416   299391308   175329568   476622722 -1470943512
[379]  -263575316  1249451580  -847064206  -457664912  2041990180  1555603256    59097242    29857488  -518015812  1520556692  -234427774 -2063298368  1516782908   500422800
[393]  -411976158  1420024328  -378399476 -1640324452  2032137746  1878442368  -597138924   314261032   923115834  1710619600  1507618412  -659207372  1217655442  1457624416
[407]    31429964  -946400288  1883336610  1361907624   141119372  -813888836  -110171278  -589643536   368254020   226409816  2024771642  1470854000   785732668  1510058772
[421]  -513761854   524250336  1247852412   650475216  -735307102   446190632 -1235787508  -622322756   412128562   663963584  1669228084 -1201579064  1620489402 -1484544112
[435]  -346617364 -1061645228   513489554  -795739360 -1287716404 -1202934816 -1330514238 -1231604184 -1643549012 -1814161732   302850546 -1003251408 -1443936092 -1527059784
[449]   815312730  -984597104 -1768190596   997626132 -1075233470  -574340352  1816095676   108061520 -1378903021  1398127156  -298718142   742949975  -820621407 -1076936602
[463] -1612318620  -856976491   943379647  1997427800  -650375050  -165388157  -176099131 -1979429406 -1403718576   427916665   958186155  -821020132 -1024907958   530054463
[477]  2013019017   729428894  1702941260  2102662173   466808231   493707472  -393375122  -210940645  1713903229  -431172502  1265918216 -1003342415  1659900451 -1436829916
[491]  -747270190  1793563687   552105585   266693814  1011752020   588473573  -715607825  1331409960  1789935750  1350974131  -600015851 -1195417998  -708576576  1279033129
[505]  -232141413   222722668  -354914694  1951309743   620997305   526681294  1665613340 -1014422131   512205815 -1246771456  -258953890  1000461867  -251799251  1297065370
[519]  1514271576   423275201  -887841421 -1987920236  1342847778   903173687  -121400575  1844517382  1187571780  1704339829 -1220793121  1416097848 -1530636266  -634361821
[533]  1782994917  -632507902   880619632 -1867938279   859494411  1562276604  -870833366 -1600862881  -133915415   836918270  -916576276  2069611325  1856884487  1123960560
[547]  -417651058  1310630075  1435681949  -497436598    39742056   451823185  1160854851  1827368004   402595570 -1808988473  -516846447  2144780822 -2041581452    52990725
[561]   958945615   694577992 -1903547674   874470419   420856693 -1962536110  -262560864  -259078519  1200599739   476571916  2029110426  -838895089   -11825575   882205422
[575]  1704315260  2121423341   470795927  1624858976  -624364226  -666909173  1842717325  -839163974 -1602662920  1172498849  1965297491  -372171148 -1554259966  1884248727
[589]   454640737 -1235459930  1915523236  1601530197 -1899734529 -1131241320 -1572819530 -1925020093   270748549 -1902841822  -237903088  -682668359  1819583339 -1533412772
[603]  1244051338 -1924511873 -1596458295  1275466590   337422348  1667839965  -998489369  -239199472  1305784878 -2054338341   258766269  1703519018   930474952  1103587569
[617] -1470609821  -478031260  1996870034  1252351591  1102921265   804651894 -1870137196  -450050395   426075055 -1521404881

> cv.glm(prostate, glm.fit,K=5)$delta
[1] 0.5122999 0.5088001
> glm.fit = glm(lpsa~lweight,data=prostate)
> cv.glm(prostate, glm.fit,K=5)$delta
[1] 1.128761 1.122159
> help(cv.glm)
> glm.fit = glm(lpsa~lcavol+lweight+svi,data=prostate)
> glm1.fit = glm(lpsa~lcavol+lweight,data=prostate)
> glm2.fit = glm(lpsa~lcavol,data=prostate)
> cv.glm(prostate, glm.fit,K=5)$delta
[1] 0.5085132 0.5053823
> cv.glm(prostate, glm1.fit,K=5)$delta
[1] 0.5551043 0.5527108
> cv.glm(prostate, glm2.fit,K=5)$delta
[1] 0.6595670 0.6537004
> 
> 
> library(MASS)
> library(ISLR)
Error in library(ISLR) : there is no package called ‘ISLR’
> pkg.install(ISLR)
Error in pkg.install(ISLR) : could not find function "pkg.install"
> library(MASS)?bostom
Error in `?`(library(MASS), bostom) : 
  c("no documentation of type ‘MASS’ and topic ‘bostom’ (or error in processing help)", "no documentation of type ‘boot’ and topic ‘bostom’ (or error in processing help)", "no documentation of type ‘leaps’ and topic ‘bostom’ (or error in processing help)", "no documentation of type ‘stats’ and topic ‘bostom’ (or error in processing help)", "no documentation of type ‘graphics’ and topic ‘bostom’ (or error in processing help)", "no documentation of type ‘grDevices’ and topic ‘bostom’ (or error in processing help)", 
"no documentation of type ‘utils’ and topic ‘bostom’ (or error in processing help)", "no documentation of type ‘datasets’ and topic ‘bostom’ (or error in processing help)", "no documentation of type ‘methods’ and topic ‘bostom’ (or error in processing help)", "no documentation of type ‘base’ and topic ‘bostom’ (or error in processing help)")
In addition: Warning message:
In if (type == "package") package <- topic :
  the condition has length > 1 and only the first element will be used
> library(MASS)?boston
Error in `?`(library(MASS), boston) : 
  c("no documentation of type ‘MASS’ and topic ‘boston’ (or error in processing help)", "no documentation of type ‘boot’ and topic ‘boston’ (or error in processing help)", "no documentation of type ‘leaps’ and topic ‘boston’ (or error in processing help)", "no documentation of type ‘stats’ and topic ‘boston’ (or error in processing help)", "no documentation of type ‘graphics’ and topic ‘boston’ (or error in processing help)", "no documentation of type ‘grDevices’ and topic ‘boston’ (or error in processing help)", 
"no documentation of type ‘utils’ and topic ‘boston’ (or error in processing help)", "no documentation of type ‘datasets’ and topic ‘boston’ (or error in processing help)", "no documentation of type ‘methods’ and topic ‘boston’ (or error in processing help)", "no documentation of type ‘base’ and topic ‘boston’ (or error in processing help)")
In addition: Warning message:
In if (type == "package") package <- topic :
  the condition has length > 1 and only the first element will be used
> ?Boston
> dim(Boston)
[1] 506  14
> fix(Boston)
> 
> 
> 
> s
Error: object 's' not found
> 
> 
> glm3.fit = glm(crim~ptratio,data=MASS)
Error in is.data.frame(data) : object 'MASS' not found
> ?Boston
> ff = regsubsets(medv~., data=Boston, method="forward")
> summary(ff)
Subset selection object
Call: regsubsets.formula(medv ~ ., data = Boston, method = "forward")
13 Variables  (and intercept)
        Forced in Forced out
crim        FALSE      FALSE
zn          FALSE      FALSE
indus       FALSE      FALSE
chas        FALSE      FALSE
nox         FALSE      FALSE
rm          FALSE      FALSE
age         FALSE      FALSE
dis         FALSE      FALSE
rad         FALSE      FALSE
tax         FALSE      FALSE
ptratio     FALSE      FALSE
black       FALSE      FALSE
lstat       FALSE      FALSE
1 subsets of each size up to 8
Selection Algorithm: forward
         crim zn  indus chas nox rm  age dis rad tax ptratio black lstat
1  ( 1 ) " "  " " " "   " "  " " " " " " " " " " " " " "     " "   "*"  
2  ( 1 ) " "  " " " "   " "  " " "*" " " " " " " " " " "     " "   "*"  
3  ( 1 ) " "  " " " "   " "  " " "*" " " " " " " " " "*"     " "   "*"  
4  ( 1 ) " "  " " " "   " "  " " "*" " " "*" " " " " "*"     " "   "*"  
5  ( 1 ) " "  " " " "   " "  "*" "*" " " "*" " " " " "*"     " "   "*"  
6  ( 1 ) " "  " " " "   "*"  "*" "*" " " "*" " " " " "*"     " "   "*"  
7  ( 1 ) " "  " " " "   "*"  "*" "*" " " "*" " " " " "*"     "*"   "*"  
8  ( 1 ) " "  "*" " "   "*"  "*" "*" " " "*" " " " " "*"     "*"   "*"  
> glm.fit = glm(medv~., data=Boston)
> cv.glm(Boston, glm.fit, K=5)$delta
[1] 24.14044 23.88439
> 
> 
> 
> library(pls)
Error in library(pls) : there is no package called ‘pls’
> install.packages("pls")
Installing package into ‘C:/Users/ginay/Documents/R/win-library/3.5’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/pls_2.7-0.zip'
Content type 'application/zip' length 1224694 bytes (1.2 MB)
downloaded 1.2 MB

package ‘pls’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\ginay\AppData\Local\Temp\RtmpGMs4hY\downloaded_packages
> library(pls)

Attaching package: ‘pls’

The following object is masked from ‘package:stats’:

    loadings

Warning message:
package ‘pls’ was built under R version 3.5.3 
> pcr.fit = pcr(lpsa~., data=prostate, scale=T, validation="CV")
> summary(pcr.fit)
Data: 	X dimension: 97 9 
	Y dimension: 97 1
Fit method: svdpc
Number of components considered: 9

VALIDATION: RMSEP
Cross-validated using 10 random segments.
       (Intercept)  1 comps  2 comps  3 comps  4 comps  5 comps  6 comps  7 comps  8 comps  9 comps
CV            1.16   0.8574   0.8798   0.8459   0.7962   0.7992   0.7963   0.7894   0.7565   0.7406
adjCV         1.16   0.8555   0.8782   0.8423   0.7928   0.7956   0.7938   0.7859   0.7520   0.7366

TRAINING: % variance explained
      1 comps  2 comps  3 comps  4 comps  5 comps  6 comps  7 comps  8 comps  9 comps
X       37.35    55.72    68.00    78.46    84.95    90.24    95.04    97.92   100.00
lpsa    46.97    47.47    52.55    58.68    59.05    60.04    61.64    64.75    66.34
> validationplot(pcr.fit, val.type="MSEP")
> pcr.fit = pcr(lpsa~lcavol+lweight+svi, data=prostate, scale=T, validation="CV")
> validationplot(pcr.fit, val.type="MSEP")
> library(caret)
Error in library(caret) : there is no package called ‘caret’
> install.package("caret")
Error in install.package("caret") : 
  could not find function "install.package"
> package.install("caret")
Error in package.install("caret") : 
  could not find function "package.install"
> install.packages("caret")
Installing package into ‘C:/Users/ginay/Documents/R/win-library/3.5’
(as ‘lib’ is unspecified)
also installing the dependencies ‘numDeriv’, ‘SQUAREM’, ‘colorspace’, ‘utf8’, ‘lava’, ‘labeling’, ‘munsell’, ‘R6’, ‘RColorBrewer’, ‘cli’, ‘crayon’, ‘fansi’, ‘pillar’, ‘pkgconfig’, ‘glue’, ‘stringi’, ‘assertthat’, ‘BH’, ‘plogr’, ‘prodlim’, ‘digest’, ‘gtable’, ‘lazyeval’, ‘rlang’, ‘scales’, ‘tibble’, ‘viridisLite’, ‘iterators’, ‘Rcpp’, ‘data.table’, ‘stringr’, ‘dplyr’, ‘generics’, ‘gower’, ‘ipred’, ‘lubridate’, ‘magrittr’, ‘purrr’, ‘RcppRoll’, ‘tidyr’, ‘tidyselect’, ‘timeDate’, ‘ggplot2’, ‘foreach’, ‘plyr’, ‘ModelMetrics’, ‘reshape2’, ‘recipes’, ‘withr’


  There are binary versions available but the source versions are later:
           binary source needs_compilation
colorspace  1.4-0  1.4-1              TRUE
cli         1.0.1  1.1.0             FALSE

  Binaries will be installed
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/numDeriv_2016.8-1.zip'
Content type 'application/zip' length 115381 bytes (112 KB)
downloaded 112 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/SQUAREM_2017.10-1.zip'
Content type 'application/zip' length 292852 bytes (285 KB)
downloaded 285 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/colorspace_1.4-0.zip'
Content type 'application/zip' length 2545223 bytes (2.4 MB)
downloaded 2.4 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/utf8_1.1.4.zip'
Content type 'application/zip' length 214619 bytes (209 KB)
downloaded 209 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/lava_1.6.5.zip'
Content type 'application/zip' length 2165655 bytes (2.1 MB)
downloaded 2.1 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/labeling_0.3.zip'
Content type 'application/zip' length 61756 bytes (60 KB)
downloaded 60 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/munsell_0.5.0.zip'
Content type 'application/zip' length 243630 bytes (237 KB)
downloaded 237 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/R6_2.4.0.zip'
Content type 'application/zip' length 58379 bytes (57 KB)
downloaded 57 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/RColorBrewer_1.1-2.zip'
Content type 'application/zip' length 55498 bytes (54 KB)
downloaded 54 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/crayon_1.3.4.zip'
Content type 'application/zip' length 749236 bytes (731 KB)
downloaded 731 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/fansi_0.4.0.zip'
Content type 'application/zip' length 220358 bytes (215 KB)
downloaded 215 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/pillar_1.3.1.zip'
Content type 'application/zip' length 155125 bytes (151 KB)
downloaded 151 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/pkgconfig_2.0.2.zip'
Content type 'application/zip' length 22064 bytes (21 KB)
downloaded 21 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/glue_1.3.1.zip'
Content type 'application/zip' length 172520 bytes (168 KB)
downloaded 168 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/stringi_1.4.3.zip'
Content type 'application/zip' length 15289558 bytes (14.6 MB)
downloaded 14.6 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/assertthat_0.2.0.zip'
Content type 'application/zip' length 53732 bytes (52 KB)
downloaded 52 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/BH_1.69.0-1.zip'
Content type 'application/zip' length 19008161 bytes (18.1 MB)
downloaded 18.1 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/plogr_0.2.0.zip'
Content type 'application/zip' length 18731 bytes (18 KB)
downloaded 18 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/prodlim_2018.04.18.zip'
Content type 'application/zip' length 417252 bytes (407 KB)
downloaded 407 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/digest_0.6.18.zip'
Content type 'application/zip' length 194621 bytes (190 KB)
downloaded 190 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/gtable_0.2.0.zip'
Content type 'application/zip' length 85828 bytes (83 KB)
downloaded 83 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/lazyeval_0.2.2.zip'
Content type 'application/zip' length 171432 bytes (167 KB)
downloaded 167 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/rlang_0.3.1.zip'
Content type 'application/zip' length 1081821 bytes (1.0 MB)
downloaded 1.0 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/scales_1.0.0.zip'
Content type 'application/zip' length 1065052 bytes (1.0 MB)
downloaded 1.0 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/tibble_2.1.1.zip'
Content type 'application/zip' length 334765 bytes (326 KB)
downloaded 326 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/viridisLite_0.3.0.zip'
Content type 'application/zip' length 60482 bytes (59 KB)
downloaded 59 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/iterators_1.0.10.zip'
Content type 'application/zip' length 339770 bytes (331 KB)
downloaded 331 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/Rcpp_1.0.1.zip'
Content type 'application/zip' length 4509376 bytes (4.3 MB)
downloaded 4.3 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/data.table_1.12.0.zip'
Content type 'application/zip' length 1894993 bytes (1.8 MB)
downloaded 1.8 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/stringr_1.4.0.zip'
Content type 'application/zip' length 215366 bytes (210 KB)
downloaded 210 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/dplyr_0.8.0.1.zip'
Content type 'application/zip' length 3254498 bytes (3.1 MB)
downloaded 3.1 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/generics_0.0.2.zip'
Content type 'application/zip' length 64020 bytes (62 KB)
downloaded 62 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/gower_0.2.0.zip'
Content type 'application/zip' length 244854 bytes (239 KB)
downloaded 239 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/ipred_0.9-8.zip'
Content type 'application/zip' length 396973 bytes (387 KB)
downloaded 387 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/lubridate_1.7.4.zip'
Content type 'application/zip' length 1570507 bytes (1.5 MB)
downloaded 1.5 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/magrittr_1.5.zip'
Content type 'application/zip' length 155779 bytes (152 KB)
downloaded 152 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/purrr_0.3.2.zip'
Content type 'application/zip' length 417640 bytes (407 KB)
downloaded 407 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/RcppRoll_0.3.0.zip'
Content type 'application/zip' length 629172 bytes (614 KB)
downloaded 614 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/tidyr_0.8.3.zip'
Content type 'application/zip' length 953832 bytes (931 KB)
downloaded 931 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/tidyselect_0.2.5.zip'
Content type 'application/zip' length 625713 bytes (611 KB)
downloaded 611 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/timeDate_3043.102.zip'
Content type 'application/zip' length 1541614 bytes (1.5 MB)
downloaded 1.5 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/ggplot2_3.1.0.zip'
Content type 'application/zip' length 3621895 bytes (3.5 MB)
downloaded 3.5 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/foreach_1.4.4.zip'
Content type 'application/zip' length 419077 bytes (409 KB)
downloaded 409 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/plyr_1.8.4.zip'
Content type 'application/zip' length 1296922 bytes (1.2 MB)
downloaded 1.2 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/ModelMetrics_1.2.2.zip'
Content type 'application/zip' length 664680 bytes (649 KB)
downloaded 649 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/reshape2_1.4.3.zip'
Content type 'application/zip' length 626913 bytes (612 KB)
downloaded 612 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/recipes_0.1.4.zip'
Content type 'application/zip' length 1386006 bytes (1.3 MB)
downloaded 1.3 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/withr_2.1.2.zip'
Content type 'application/zip' length 150831 bytes (147 KB)
downloaded 147 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/caret_6.0-81.zip'
Content type 'application/zip' length 6133027 bytes (5.8 MB)
downloaded 5.8 MB

package ‘numDeriv’ successfully unpacked and MD5 sums checked
package ‘SQUAREM’ successfully unpacked and MD5 sums checked
package ‘colorspace’ successfully unpacked and MD5 sums checked
package ‘utf8’ successfully unpacked and MD5 sums checked
package ‘lava’ successfully unpacked and MD5 sums checked
package ‘labeling’ successfully unpacked and MD5 sums checked
package ‘munsell’ successfully unpacked and MD5 sums checked
package ‘R6’ successfully unpacked and MD5 sums checked
package ‘RColorBrewer’ successfully unpacked and MD5 sums checked
package ‘crayon’ successfully unpacked and MD5 sums checked
package ‘fansi’ successfully unpacked and MD5 sums checked
package ‘pillar’ successfully unpacked and MD5 sums checked
package ‘pkgconfig’ successfully unpacked and MD5 sums checked
package ‘glue’ successfully unpacked and MD5 sums checked
package ‘stringi’ successfully unpacked and MD5 sums checked
package ‘assertthat’ successfully unpacked and MD5 sums checked
package ‘BH’ successfully unpacked and MD5 sums checked
package ‘plogr’ successfully unpacked and MD5 sums checked
package ‘prodlim’ successfully unpacked and MD5 sums checked
package ‘digest’ successfully unpacked and MD5 sums checked
package ‘gtable’ successfully unpacked and MD5 sums checked
package ‘lazyeval’ successfully unpacked and MD5 sums checked
package ‘rlang’ successfully unpacked and MD5 sums checked
package ‘scales’ successfully unpacked and MD5 sums checked
package ‘tibble’ successfully unpacked and MD5 sums checked
package ‘viridisLite’ successfully unpacked and MD5 sums checked
package ‘iterators’ successfully unpacked and MD5 sums checked
package ‘Rcpp’ successfully unpacked and MD5 sums checked
package ‘data.table’ successfully unpacked and MD5 sums checked
package ‘stringr’ successfully unpacked and MD5 sums checked
package ‘dplyr’ successfully unpacked and MD5 sums checked
package ‘generics’ successfully unpacked and MD5 sums checked
package ‘gower’ successfully unpacked and MD5 sums checked
package ‘ipred’ successfully unpacked and MD5 sums checked
package ‘lubridate’ successfully unpacked and MD5 sums checked
package ‘magrittr’ successfully unpacked and MD5 sums checked
package ‘purrr’ successfully unpacked and MD5 sums checked
package ‘RcppRoll’ successfully unpacked and MD5 sums checked
package ‘tidyr’ successfully unpacked and MD5 sums checked
package ‘tidyselect’ successfully unpacked and MD5 sums checked
package ‘timeDate’ successfully unpacked and MD5 sums checked
package ‘ggplot2’ successfully unpacked and MD5 sums checked
package ‘foreach’ successfully unpacked and MD5 sums checked
package ‘plyr’ successfully unpacked and MD5 sums checked
package ‘ModelMetrics’ successfully unpacked and MD5 sums checked
package ‘reshape2’ successfully unpacked and MD5 sums checked
package ‘recipes’ successfully unpacked and MD5 sums checked
package ‘withr’ successfully unpacked and MD5 sums checked
package ‘caret’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\ginay\AppData\Local\Temp\RtmpGMs4hY\downloaded_packages
installing the source package ‘cli’

trying URL 'https://cran.rstudio.com/src/contrib/cli_1.1.0.tar.gz'
Content type 'application/x-gzip' length 40232 bytes (39 KB)
downloaded 39 KB

* installing *source* package 'cli' ...
** package 'cli' successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
  converting help for package 'cli'
    finding HTML links ... done
    ansi-styles                             html  
    ansi_hide_cursor                        html  
    boxx                                    html  
    cat_line                                html  
    cli_sitrep                              html  
    combine_ansi_styles                     html  
    console_width                           html  
    demo_spinners                           html  
    get_spinner                             html  
    is_ansi_tty                             html  
    is_dynamic_tty                          html  
    is_utf8_output                          html  
    list_spinners                           html  
    make_ansi_style                         html  
    make_spinner                            html  
    rule                                    html  
    symbol                                  html  
    tree                                    html  
** building package indices
** testing if installed package can be loaded
*** arch - i386
*** arch - x64
* DONE (cli)
In R CMD INSTALL

The downloaded source packages are in
	‘C:\Users\ginay\AppData\Local\Temp\RtmpGMs4hY\downloaded_packages’
> 
> 
> 
> library(caret)
Loading required package: lattice

Attaching package: ‘lattice’

The following object is masked from ‘package:boot’:

    melanoma

Loading required package: ggplot2
Need help getting started? Try the cookbook for R: http://www.cookbook-r.com/Graphs/

Attaching package: ‘caret’

The following object is masked from ‘package:pls’:

    R2

Warning messages:
1: package ‘caret’ was built under R version 3.5.3 
2: package ‘ggplot2’ was built under R version 3.5.3 
> 