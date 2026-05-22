"
```language=Pharo
day5 := AOC2015Day5 new.
day5 solution1Part1 .
day5 solution1Part2 .
```

answers a little brittle tied to actual puzzle input , no option for input from files , where is the filesystem anyway ?


AOC2015Day1 is class name since all classes live in the global scope
AdventCode is the package name 

AOC2015Day1 input 
a class side method to return pattern of '()()()()()'




"
Class {
	#name : 'AOC2015Day5',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day5 >> containsOneLetterBetween: str [

	| a b c d i j len |
	len := str size.
	"if str size < 4 then return false"
	len < 3 ifTrue: [ ^ false ].
	i := 1.
	j := 3.
	"end loop condition - for ease mental correctness 3rd letter will end on last letter of string"
	[
		a := str at: i.
		"b := str at: (i + 1). " "never access middle letter of three letters"
		c := str at: i + 2.
		a = c ifTrue: [ ^ true ].
		i := i + 1.
		j := j + 1 ] doWhileTrue: [ j <= len ].
	^ false
]

{ #category : 'as yet unclassified' }
AOC2015Day5 >> containsPairLettersNoOverlap: str [

	| a b c d i j len |
	len := str size.
	"if str size < 4 then return false"
	len < 4 ifTrue: [ ^ false ].
	a := str at: 1.
	b := str at: 2.
	i := 3.
	j := 4.
	[
		c := str at: i.
		d := str at: j.
		(a = c and: [ b = d ]) ifTrue: [ ^ true ].
		"next pair letters from "
		i := i + 1.
		j := j + 1 ] doWhileTrue: [ j <= len ].
	"if we reached here no matching pair found in this string. 
chop string and call itself again "
	^ self containsPairLettersNoOverlap: (str allButFirst).
	
]

{ #category : 'as yet unclassified' }
AOC2015Day5 >> containsThreeVowels: str [
	"filter vowels a e i o u - if length of this >= 3 then true else false"

	| tot |
	tot := 0.
	str do: [ :e |
			('aeiou' includes: e) ifTrue: [
					tot := tot + 1.
					(tot >= 3) ifTrue: [ ^ true ] ] ].
	^ false
]

{ #category : 'as yet unclassified' }
AOC2015Day5 >> doesContainStrings: str strings: stringsCollection [
	"It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements"

	| i j len |
	len := str size.
	i := 1.
	j := i + 1.
	"while loop"
	[ "iterate over each pair of characters in stringsCollection"
		stringsCollection do: [ :sc |
				| a b c d chk chk2 |
				a := str at: i.
				b := str at: j.
				c := sc at: 1.
				d := sc at: 2.
				chk := {
					       a.
					       b }.
				chk2 := {
					        c.
					        d }.
				(a = c and: [ b = d ]) ifTrue: [ ^ true ] ].
		i := i + 1.
		j := j + 1 ] doWhileTrue: [ j <= len ].
	^ false
]

{ #category : 'as yet unclassified' }
AOC2015Day5 >> doesNotContainStrings: str [
	"It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements"

	| strings |
	strings := { 'ab'. 'cd'. 'pq'. 'xy' }.
	^ (self doesContainStrings: str strings: strings) not
]

{ #category : 'as yet unclassified' }
AOC2015Day5 >> oneLetterTwiceInARow: str [
	"could compute all pairs"

	| i j len |
	len := str size.
	i := 1.
	j := i + 1.
	"while loop"
	[
		(str at: i) = (str at: j)
			ifTrue: [ ^ true ]
			ifFalse: [
					i := i + 1.
					j := j + 1 ] ] doWhileTrue: [ j <= len ].
	" 'asdf' copyFrom:1 to: 2 . 'asdf' copyFrom:3 to: 4 ."
	^ false
]

{ #category : 'accessing' }
AOC2015Day5 >> puzzleInput [ 
^ 'zgsnvdmlfuplrubt
vlhagaovgqjmgvwq
ffumlmqwfcsyqpss
zztdcqzqddaazdjp
eavfzjajkjesnlsb
urrvucyrzzzooxhx
xdwduffwgcptfwad
orbryxwrmvkrsxsr
jzfeybjlgqikjcow
mayoqiswqqryvqdi
iiyrkoujhgpgkcvx
egcgupjkqwfiwsjl
zbgtglaqqolttgng
eytquncjituzzhsx
dtfkgggvqadhqbwb
zettygjpcoedwyio
rwgwbwzebsnjmtln
esbplxhvzzgawctn
vnvshqgmbotvoine
wflxwmvbhflkqxvo
twdjikcgtpvlctte
minfkyocskvgubvm
sfxhhdhaopajbzof
sofkjdtalvhgwpql
uqfpeauqzumccnrc
tdflsbtiiepijanf
dhfespzrhecigzqb
xobfthcuuzhvhzpn
olgjglxaotocvrhw
jhkzpfcskutwlwge
zurkakkkpchzxjhq
hekxiofhalvmmkdl
azvxuwwfmjdpjskj
arsvmfznblsqngvb
ldhkzhejofreaucc
adrphwlkehqkrdmo
wmveqrezfkaivvaw
iyphmphgntinfezg
blomkvgslfnvspem
cgpaqjvzhbumckwo
ydhqjcuotkeyurpx
sbtzboxypnmdaefr
vxrkhvglynljgqrg
ttgrkjjrxnxherxd
hinyfrjdiwytetkw
sufltffwqbugmozk
tohmqlzxxqzinwxr
jbqkhxfokaljgrlg
fvjeprbxyjemyvuq
gmlondgqmlselwah
ubpwixgxdloqnvjp
lxjfhihcsajxtomj
qouairhvrgpjorgh
nloszcwcxgullvxb
myhsndsttanohnjn
zjvivcgtjwenyilz
qaqlyoyouotsmamm
tadsdceadifqthag
mafgrbmdhpnlbnks
aohjxahenxaermrq
ovvqestjhbuhrwlr
lnakerdnvequfnqb
agwpwsgjrtcjjikz
lhlysrshsmzryzes
xopwzoaqtlukwwdu
xsmfrfteyddrqufn
ohnxbykuvvlbbxpf
bbdlivmchvzfuhoc
vtacidimfcfyobhf
tinyzzddgcnmiabd
tcjzxftqcqrivqhn
vgnduqyfpokbmzim
revkvaxnsxospyow
ydpgwxxoxlywxcgi
wzuxupbzlpzmikel
nscghlafavnsycjh
xorwbquzmgmcapon
asmtiycegeobfxrn
eqjzvgkxgtlyuxok
mmjrskloposgjoqu
gceqosugbkvytfto
khivvoxkvhrgwzjl
qtmejuxbafroifjt
ttmukbmpoagthtfl
bxqkvuzdbehtduwv
gvblrpzjylanoggj
cltewhyjxdbmbtqj
fbkgedqvomdipklj
uxvuplhenqawfcjt
fkdjmayiawdkycva
gnloqfgbnibzyidh
kyzorvtopjiyyyqg
drckpekhpgrioblt
tvhrkmbnpmkkrtki
khaldwntissbijiz
aoojqakosnaxosom
xfptccznbgnpfyqw
moqdwobwhjxhtrow
chfwivedutskovri
gprkyalfnpljcrmi
pwyshpwjndasykst
xuejivogihttzimd
bugepxgpgahtsttl
zufmkmuujavcskpq
urybkdyvsrosrfro
isjxqmlxwtqmulbg
pxctldxgqjqhulgz
hclsekryiwhqqhir
hbuihpalwuidjpcq
ejyqcxmfczqfhbxa
xljdvbucuxnnaysv
irqceqtqwemostbb
anfziqtpqzqdttnz
cgfklbljeneeqfub
zudyqkuqqtdcpmuo
iuvhylvznmhbkbgg
mpgppmgfdzihulnd
argwmgcvqqkxkrdi
pdhrfvdldkfihlou
cbvqnjrvrsnqzfob
lkvovtsqanohzcmm
vxoxjdyoylqcnyzt
kurdpaqiaagiwjle
gwklwnazaxfkuekn
rbaamufphjsjhbdl
tzbrvaqvizhsisbd
pbcqlbfjvlideiub
hiwoetbfywaeddtx
fjirczxtuupfywyf
omeoegeyyospreem
ozbbpupqpsskvrjh
pzvcxkvjdiyeyhxa
odclumkenabcsfzr
npdyqezqdjqaszvm
yodkwzmrhtexfrqa
rjcmmggjtactfrxz
mioxfingsfoimual
aqskaxjjborspfaa
wientdsttkevjtkf
tdaswkzckmxnfnct
voucjhzvkkhuwoqk
boaaruhalgaamqmh
iufzxutxymorltvb
pfbyvbayvnrpijpo
obztirulgyfthgcg
ntrenvhwxypgtjwy
ephlkipjfnjfjrns
pkjhurzbmobhszpx
gqbnjvienzqfbzvj
wjelolsrbginwnno
votanpqpccxqricj
bxyuyiglnmbtvehi
qyophcjfknbcbjrb
anoqkkbcdropskhj
tcnyqaczcfffkrtl
rsvqimuqbuddozrf
meppxdrenexxksdt
tyfhfiynzwadcord
wayrnykevdmywycf
mhowloqnppswyzbu
tserychksuwrgkxz
xycjvvsuaxsbrqal
fkrdsgaoqdcqwlpn
vrabcmlhuktigecp
xgxtdsvpaymzhurx
ciabcqymnchhsxkc
eqxadalcxzocsgtr
tsligrgsjtrnzrex
qeqgmwipbspkbbfq
vzkzsjujltnqwliw
ldrohvodgbxokjxz
jkoricsxhipcibrq
qzquxawqmupeujrr
mizpuwqyzkdbahvk
suupfxbtoojqvdca
ywfmuogvicpywpwm
uevmznxmsxozhobl
vjbyhsemwfwdxfxk
iyouatgejvecmtin
tcchwpuouypllcxe
lgnacnphdiobdsef
uoxjfzmdrmpojgbf
lqbxsxbqqhpjhfxj
knpwpcnnimyjlsyz
fezotpoicsrshfnh
dkiwkgpmhudghyhk
yzptxekgldksridv
pckmzqzyiyzdbcts
oqshafncvftvwvsi
yynihvdywxupqmbt
iwmbeunfiuhjaaic
pkpkrqjvgocvaxjs
ieqspassuvquvlyz
xshhahjaxjoqsjtl
fxrrnaxlqezdcdvd
pksrohfwlaqzpkdd
ravytrdnbxvnnoyy
atkwaifeobgztbgo
inkcabgfdobyeeom
ywpfwectajohqizp
amcgorhxjcybbisv
mbbwmnznhafsofvr
wofcubucymnhuhrv
mrsamnwvftzqcgta
tlfyqoxmsiyzyvgv
ydceguvgotylwtea
btyvcjqhsygunvle
usquiquspcdppqeq
kifnymikhhehgote
ybvkayvtdpgxfpyn
oulxagvbavzmewnx
tvvpekhnbhjskzpj
azzxtstaevxurboa
nfmwtfgrggmqyhdf
ynyzypdmysfwyxgr
iaobtgubrcyqrgmk
uyxcauvpyzabbzgv
fbasfnwiguasoedc
mgmjoalkbvtljilq
szgkxiqkufdvtksb
xgfzborpavdmhiuj
hmuiwnsonvfgcrva
zolcffdtobfntifb
mvzgcsortkugvqjr
pbbpgraaldqvzwhs
zvsxegchksgnhpuv
kdpdboaxsuxfswhx
jdfggigejfupabth
tpeddioybqemyvqz
mxsntwuesonybjby
tzltdsiojfvocige
ubtdrneozoejiqrv
fusyucnhncoxqzql
nlifgomoftdvkpby
pyikzbxoapffbqjw
hzballplvzcsgjug
ymjyigsfehmdsvgz
vpqgyxknniunksko
ffkmaqsjxgzclsnq
jcuxthbedplxhslk
ymlevgofmharicfs
nyhbejkndhqcoisy
rjntxasfjhnlizgm
oqlnuxtzhyiwzeto
tntthdowhewszitu
rmxyoceuwhsvfcua
qpgsjzwenzbxyfgw
sumguxpdkocyagpu
ymfrbxwrawejkduu
hetgrtmojolbmsuf
qzqizpiyfasgttex
qnmoemcpuckzsshx
ddyqiihagcmnxccu
oirwxyfxxyktgheo
phpaoozbdogbushy
uctjdavsimsrnvjn
aurbbphvjtzipnuh
hpbtrubopljmltep
pyyvkthqfsxqhrxg
jdxaiqzkepxbfejk
ukgnwbnysrzvqzlw
lfkatkvcssnlpthd
ucsyecgshklhqmsc
rwdcbdchuahkvmga
rxkgqakawgpwokum
hbuyxeylddfgorgu
tbllspqozaqzglkz
rqfwizjlbwngdvvi
xuxduyzscovachew
kouiuxckkvmetvdy
ycyejrpwxyrweppd
trctlytzwiisjamx
vtvpjceydunjdbez
gmtlejdsrbfofgqy
jgfbgtkzavcjlffj
tyudxlpgraxzchdk
gyecxacqitgozzgd
rxaocylfabmmjcvt
tornfzkzhjyofzqa
kocjcrqcsvagmfqv
zfrswnskuupivzxb
cunkuvhbepztpdug
pmpfnmklqhcmrtmf
tfebzovjwxzumxap
xpsxgaswavnzkzye
lmwijdothmxclqbr
upqxhmctbltxkarl
axspehytmyicthmq
xdwrhwtuooikehbk
tpggalqsytvmwerj
jodysbwnymloeqjf
rxbazvwuvudqlydn
ibizqysweiezhlqa
uexgmotsqjfauhzp
ldymyvumyhyamopg
vbxvlvthgzgnkxnf
pyvbrwlnatxigbrp
azxynqididtrwokb
lwafybyhpfvoawto
ogqoivurfcgspytw
cinrzzradwymqcgu
sgruxdvrewgpmypu
snfnsbywuczrshtd
xfzbyqtyxuxdutpw
fmpvjwbulmncykbo
ljnwoslktrrnffwo
ceaouqquvvienszn
yjomrunrxjyljyge
xpmjsapbnsdnbkdi
uetoytptktkmewre
eixsvzegkadkfbua
afaefrwhcosurprw
bwzmmvkuaxiymzwc
gejyqhhzqgsrybni
gjriqsfrhyguoiiw
gtfyomppzsruhuac
ogemfvmsdqqkfymr
jgzbipsygirsnydh
zghvlhpjnvqmocgr
ngvssuwrbtoxtrka
ietahyupkbuisekn
gqxqwjizescbufvl
eiprekzrygkncxzl
igxfnxtwpyaamkxf
soqjdkxcupevbren
fspypobyzdwstxak
qstcgawvqwtyyidf
gsccjacboqvezxvd
bfsblokjvrqzphmc
srezeptvjmncqkec
opmopgyabjjjoygt
msvbufqexfrtecbf
uiaqweyjiulplelu
pbkwhjsibtwjvswi
xwwzstmozqarurrq
nytptwddwivtbgyq
ejxvsufbzwhzpabr
jouozvzuwlfqzdgh
gfgugjihbklbenrk
lwmnnhiuxqsfvthv
bzvwbknfmaeahzhi
cgyqswikclozyvnu
udmkpvrljsjiagzi
zzuhqokgmisguyna
ekwcdnjzuctsdoua
eueqkdrnzqcaecyd
lnibwxmokbxhlris
fdrbftgjljpzwhea
iabvuhhjsxmqfwld
qgogzkynrgejakta
mfcqftytemgnpupp
klvhlhuqhosvjuqk
gdokmxcgoqvzvaup
juududyojcazzgvr
fyszciheodgmnotg
yfpngnofceqfvtfs
cahndkfehjumwavc
dxsvscqukljxcqyi
cqukcjtucxwrusji
vevmmqlehvgebmid
ahswsogfrumzdofy
ftasbklvdquaxhxb
tsdeumygukferuif
ybfgbwxaaitpwryg
djyaoycbymezglio
trzrgxdjqnmlnzpn
rumwchfihhihpqui
ffrvnsgrnzemksif
oizlksxineqknwzd
cirqcprftpjzrxhk
zrhemeqegmzrpufd
kqgatudhxgzlgkey
syjugymeajlzffhq
nlildhmgnwlopohp
flcszztfbesqhnyz
ohzicmqsajyqptrw
ebyszucgozsjbelq
enxbgvvcuqeloxud
ubwnvecbsmhkxwuk
noifliyxvlkqphbo
hazlqpetgugxxsiz
ihdzoerqwqhgajzb
ivrdwdquxzhdrzar
synwycdvrupablib
mqkdjkntblnmtvxj
qmmvoylxymyovrnq
pjtuxskkowutltlq
gchrqtloggkrjciz
namzqovvsdipazae
yfokqhkmakyjzmys
iapxlbuoiwqfnozm
fbcmlcekgfdurqxe
ednzgtczbplwxjlq
gdvsltzpywffelsp
oaitrrmpqdvduqej
gseupzwowmuuibjo
dfzsffsqpaqoixhh
tclhzqpcvbshxmgx
cfqkptjrulxiabgo
iraiysmwcpmtklhf
znwjlzodhktjqwlm
lcietjndlbgxzjht
gdkcluwjhtaaprfo
vbksxrfznjzwvmmt
vpfftxjfkeltcojl
thrmzmeplpdespnh
yafopikiqswafsit
xxbqgeblfruklnhs
qiufjijzbcpfdgig
ikksmllfyvhyydmi
sknufchjdvccccta
wpdcrramajdoisxr
grnqkjfxofpwjmji
lkffhxonjskyccoh
npnzshnoaqayhpmb
fqpvaamqbrnatjia
oljkoldhfggkfnfc
ihpralzpqfrijynm
gvaxadkuyzgbjpod
onchdguuhrhhspen
uefjmufwlioenaus
thifdypigyihgnzo
ugqblsonqaxycvkg
yevmbiyrqdqrmlbw
bvpvwrhoyneorcmm
gbyjqzcsheaxnyib
knhsmdjssycvuoqf
nizjxiwdakpfttyh
nwrkbhorhfqqoliz
ynsqwvwuwzqpzzwp
yitscrgexjfclwwh
dhajwxqdbtrfltzz
bmrfylxhthiaozpv
frvatcvgknjhcndw
xlvtdmpvkpcnmhya
pxpemuzuqzjlmtoc
dijdacfteteypkoq
knrcdkrvywagglnf
fviuajtspnvnptia
xvlqzukmwbcjgwho
bazlsjdsjoeuvgoz
nslzmlhosrjarndj
menvuwiuymknunwm
uavfnvyrjeiwqmuu
yrfowuvasupngckz
taevqhlrcohlnwye
skcudnogbncusorn
omtnmkqnqedsajfv
yqmgsqdgsuysqcts
odsnbtyimikkbmdd
vuryaohxdvjllieb
dhaxldeywwsfamlo
opobvtchezqnxpak
pzfnegouvsrfgvro
rzkcgpxdslzrdktu
ksztdtqzxvhuryam
ctnqnhkcooqipgkh
pyqbbvrzdittqbgm
koennvmolejeftij
rvzlreqikqlgyczj
xrnujfoyhonzkdgd
mmsmhkxaiqupfjil
ypjwoemqizddvyfd
qgugcxnbhvgahykj
cviodlsrtimbkgmy
xbfbbechhmrjxhnw
psuipaoucfczfxkp
hdhwcpeuptgqqvim
gsxlruhjeaareilr
vgyqonnljuznyrhk
eewezahlumervpyu
iiolebrxfadtnigy
tdadlrodykrdfscn
ocvdtzjxrhtjurpo
gidljbuvuovkhhrf
qwfcpilbjwzboohd
xzohxonlezuiupbg
vslpbkkqgvgbcbix
pivzqrzfxosbstzn
fyqcfboevcqmbhhs
yqsrneacnlxswojx
heicqpxxyrwcbsjz
yzynmnnoumkmlbeh
bncadbjdvvmczylw
hlnjskgfzbgmigfn
fphpszymugpcykka
zbifcktanxpmufvy
saklpkhoyfeqbguy
nqtqfcfxmpivnjyo
locygrwerxlsvzqm
qqflecydqvlogjme
njklmixvgkzpgppf
ugzkpjwjflaswyma
lriousvkbeftslcy
nsvsauxzfbbotgmh
tblcpuhjyybrlica
hqwshxcilwtmxrsf
xojwroydfeoqupup
tikuzsrogpnohpib
layenyqgxdfggloc
nqsvjvbrpuxkqvmq
ivchgxkdlfjdzxmk
uoghiuosiiwiwdws
twsgsfzyszsfinlc
waixcmadmhtqvcmd
zkgitozgrqehtjkw
xbkmyxkzqyktmpfi
qlyapfmlybmatwxn
ntawlvcpuaebuypf
clhebxqdkcyndyof
nrcxuceywiklpemc
lmurgiminxpapzmq
obalwqlkykzflxou
huvcudpiryefbcye
zlxbddpnyuyapach
gqfwzfislmwzyegy
jhynkjtxedmemlob
hmrnvjodnsfiukex
pstmikjykzyavfef
wuwpnscrwzsyalyt
hksvadripgdgwynm
tvpfthzjleqfxwkh
xpmrxxepkrosnrco
qjkqecsnevlhqsly
jjnrfsxzzwkhnwdm
pehmzrzsjngccale
bsnansnfxduritrr
ejzxkefwmzmbxhlb
pceatehnizeujfrs
jtidrtgxopyeslzl
sytaoidnamfwtqcr
iabjnikomkgmyirr
eitavndozoezojsi
wtsbhaftgrbqfsmm
vvusvrivsmhtfild
qifbtzszfyzsjzyx
ifhhjpaqatpbxzau
etjqdimpyjxiuhty
fvllmbdbsjozxrip
tjtgkadqkdtdlkpi
xnydmjleowezrecn
vhcbhxqalroaryfn
scgvfqsangfbhtay
lbufpduxwvdkwhmb
tshipehzspkhmdoi
gtszsebsulyajcfl
dlrzswhxajcivlgg
kgjruggcikrfrkrw
xxupctxtmryersbn
hljjqfjrubzozxts
giaxjhcwazrenjzs
tyffxtpufpxylpye
jfugdxxyfwkzqmgv
kbgufbosjghahacw
xpbhhssgegmthwxb
npefofiharjypyzk
velxsseyxuhrpycy
sglslryxsiwwqzfw
susohnlpelojhklv
lfnpqfvptqhogdmk
vtcrzetlekguqyle
jlyggqdtamcjiuxn
olxxqfgizjmvigvl
cyypypveppxxxfuq
hewmxtlzfqoqznwd
jzgxxybfeqfyzsmp
xzvvndrhuejnzesx
esiripjpvtqqwjkv
xnhrwhjtactofwrd
knuzpuogbzplofqx
tihycsdwqggxntqk
xkfywvvugkdalehs
cztwdivxagtqjjel
dsaslcagopsbfioy
gmowqtkgrlqjimbl
ctcomvdbiatdvbsd
gujyrnpsssxmqjhz
nygeovliqjfauhjf
mmgmcvnuppkbnonz
bhipnkoxhzcotwel
wkwpgedgxvpltqid
mliajvpdocyzcbot
kqjhsipuibyjuref
zqdczykothbgxwsy
koirtljkuqzxioaz
audpjvhmqzvhzqas
cxyhxlhntyidldfx
iasgocejboxjgtkx
abehujmqotwcufxp
fmlrzqmazajxeedl
knswpkekbacuxfby
yvyalnvrxgstqhxm
sjnrljfrfuyqfwuw
ssaqruwarlvxrqzm
iaxbpeqqzlcwfqjz
uwyxshjutkanvvsc
uxwrlwbblcianvnb
nodtifgrxdojhneh
mloxjfusriktxrms
lkfzrwulbctupggc
gcrjljatfhitcgfj
tkdfxeanwskaivqs
ypyjxqtmitwubbgt
ssxbygzbjsltedjj
zdrsnoorwqfalnha
xlgmissaiqmowppd
azhbwhiopwpguiuo
fydlahgxtekbweet
qtaveuqpifprdoiy
kpubqyepxqleucem
wlqrgqmnupwiuory
rwyocktuqkuhdwxz
abzjfsdevoygctqv
zsofhaqqghncmzuw
lqbjwjqxqbfgdckc
bkhyxjkrqbbunido
yepxfjnnhldidsjb
builayfduxbppafc
wedllowzeuswkuez
gverfowxwtnvgrmo
tpxycfumxdqgntwf
lqzokaoglwnfcolw
yqsksyheyspmcdqt
vufvchcjjcltwddl
saeatqmuvnoacddt
dxjngeydvsjbobjs
ucrcxoakevhsgcep
cajgwjsfxkasbayt
hknzmteafsfemwuv
xxwhxwiinchqqudr
usfenmavvuevevgr
kxcobcwhsgyizjok
vhqnydeboeunnvyk
bgxbwbxypnxvaacw
bwjzdypacwgervgk
rrioqjluawwwnjcr
fiaeyggmgijnasot
xizotjsoqmkvhbzm
uzphtrpxwfnaiidz
kihppzgvgyoncptg
hfbkfrxwejdeuwbz
zgqthtuaqyrxicdy
zitqdjnnwhznftze
jnzlplsrwovxlqsn
bmwrobuhwnwivpca
uuwsvcdnoyovxuhn
nmfvoqgoppoyosaj
hxjkcppaisezygpe
icvnysgixapvtoos
vbvzajjgrmjygkhu
jinptbqkyqredaos
dpmknzhkhleawfvz
ouwwkfhcedsgqqxe
owroouiyptrijzgv
bewnckpmnbrmhfyu
evdqxevdacsbfbjb
catppmrovqavxstn
dqsbjibugjkhgazg
mkcldhjochtnvvne
sblkmhtifwtfnmsx
lynnaujghehmpfpt
vrseaozoheawffoq
ytysdzbpbazorqes
sezawbudymfvziff
vrlfhledogbgxbau
bipdlplesdezbldn
ermaenjunjtbekeo
eyaedubkthdecxjq
gbzurepoojlwucuy
rsiaqiiipjlouecx
beqjhvroixhiemtw
buzlowghhqbcbdwv
ldexambveeosaimo
fpyjzachgrhxcvnx
komgvqejojpnykol
fxebehjoxdujwmfu
jnfgvheocgtvmvkx
qmcclxxgnclkuspx
rsbelzrfdblatmzu
vexzwqjqrsenlrhm
tnfbkclwetommqmh
lzoskleonvmprdri
nnahplxqscvtgfwi
ubqdsflhnmiayzrp
xtiyqxhfyqonqzrn
omdtmjeqhmlfojfr
cnimgkdbxkkcnmkb
tapyijgmxzbmqnks
byacsxavjboovukk
awugnhcrygaoppjq
yxcnwrvhojpuxehg
btjdudofhxmgqbao
nzqlfygiysfuilou
nubwfjdxavunrliq
vqxmmhsbmhlewceh
ygavmcybepzfevrp
kgflmrqsvxprkqgq
iaqyqmcaedscmakk
cvbojnbfmrawxzkh
jjjrprbnlijzatuw
lcsudrrfnnggbrmk
qzgxbiavunawfibc
gnnalgfvefdfdwwg
nokmiitzrigxavsc
etzoxwzxqkkhvais
urxxfacgjccieufi
lqrioqhuvgcotuec
dydbaeyoypsbftra
hhrotenctylggzaf
evctqvzjnozpdxzu
tbpvithmorujxlcp
pllbtcbrtkfpvxcw
fzyxdqilyvqreowv
xdleeddxwvqjfmmt
fcldzthqqpbswoin
sgomzrpjfmvgwlzi
axjyskmtdjbxpwoz
hcvaevqxsmabvswh
lfdlsfcwkwicizfk
isjbwpzdognhoxvm
oqnexibqxlyxpluh
zqfbgodsfzwgcwuf
kvmnwruwsjllbldz
kghazimdyiyhmokj
uiktgpsxpoahofxn
zkdwawxargcmidct
ftbixlyiprshrjup
nofhmbxififwroeg
mcdaqrhplffxrcdt
fbjxnwojcvlawmlb
rizoftvwfdhiwyac
eduogrtyhxfwyars
zoikunqxgjwfqqwr
zxwbbpmvctzezaqh
nghujwyeabwdqnop
vcxamijpoyyksogn
jnckdbuteoqlsdae
jurfqqawafmsiqwv
inepmztrzehfafie
tznzkyvzodbrtscf
xewbavjeppflwscl
ucndzsorexjlnplo
jpxbctscngxgusvu
mfmygcllauzuoaok
oibkuxhjmhxhhzby
zjkslwagmeoisunw
avnnxmopdgvmukuu
jmaargejcwboqhkt
yacmpeosarsrfkrv
iqhgupookcaovwgh
ebjkdnxwtikqzufc
imdhbarytcscbsvb
ifyibukeffkbqvcr
aloighmyvwybtxhx
yszqwrutbkiwkxjg
xyholyzlltjhsuhp
gykhmrwucneoxcrf
badkdgqrpjzbabet
sunaucaucykwtkjj
pumqkglgfdhneero
usgtyuestahlydxq
xmfhflphzeudjsjm
knywgmclisgpootg
mtojnyrnvxtweuzb
uuxufbwfegysabww
vobhwwocqttlbsik
yuydfezeqgqxqmnd
wbqgqkwbibiilhzc
sfdmgxsbuzsawush
ilhbxcfgordyxwvp
ahqoavuysblnqaeg
plwgtvpgotskmsey
ewjcmzkcnautrrmp
tyekgzbznlikcyqj
bqzctiuaxpriuiga
bimvbfjkiupyqiys
mpqtbcxfhwymxncw
htemlptvqhharjgb
mqbsmsruwzzxgcxc
zjyedjwhnvteuaid
pzoelkoidwglpttc
efydnsvlfimvwxhx
gfyhgoeiyjcgfyze
deqtomhwopmzvjlt
casafubtkoopuaju
yylsfarntbucfulg
mgjwsormkjsrrxan
lkkenpupgmjpnqqd
tegweszyohsoluot
lihsfdwxmxvwdxna
rrefrjjxerphejwb
guuazonjoebhymtm
ysofqzmfmyneziki
lmjgaliatcpduoal
qzthcpjwtgahbebr
wvakvephyukmpemm
simxacxxzfoaeddw
aetgqmiqzxbvbviz
jxlmhdmqggevrxes
mmuglnjmuddzgaik
svopsqhtrslgycgc
xnvcsiiqrcjkvecn
kkvumxtvashxcops
bduflsdyeectvcgl
vfrxbwmmytjvqnsj
eeqtdneiyiaiofxw
crtbgknfacjtwkfl
uuutuoxdsxolpbhd
lcrztwzreaswovtn
htorkvnvujmjdqzj
wttzuzvrzlyhfzyf
oraewznfwgdsnhuk
rctlkqqvkwbgrcgk
cfehrsrqhzyiwtmz
kbvxwcumjkhvjpui
xxlocexbmniiakfo
gtknkkzvykmlqghl
kcjuxvkuimhwqrtk
vohekwkuyuoacuww
vorctgughscysyfo
zmjevqplngzswxyq
qhswdrhrijnatkyo
joakcwpfggtitizs
juzlwjijcmtswdtq
icbyaqohpkemhkip
rpdxgpzxncedmvzh
rozkmimbqhbhcddv
wkkypomlvyglpfpf
jcaqyaqvsefwtaya
ghvmtecoxlebdwnf
lqrcyiykkkpkxvqt
eqlarfazchmzotev
vqwndafvmpguggef
dbfxzrdkkrusmdke
cmjpjjgndozcmefj
hbrdcwjuyxapyhlo
mmforetykbosdwce
zynfntqwblbnfqik
sodwujfwlasznaiz
yyvrivjiqnxzqkfp
uldbskmmjbqllpnm
fyhhrmrsukeptynl
hpfjekktvdkgdkzl
bozhkoekcxzeorob
uvpptyfrzkvmtoky
hkhfprmjdpjvfkcb
igxzwktwsqhsivqu
qceomwysgkcylipb
cglateoynluyeqgc
xcsdfkpeguxgvpfh
owjhxlcncdgkqyia
rpbmrpcesiakqpna
lueszxiourxsmezb
zelvsowimzkxliwc
vzxbttoobtvdtkca
pfxvzphzwscqkzsi
edsjorainowytbzu
ipsegdaluoiphmnz
mkhueokfpemywvuw
urxdnumhylpafdlc
ggluurzavsxkvwkl
ctclphidqgteakox
tfobosynxsktajuk
jzrmemhxqmzhllif
eemwekimdfvqslsx
yjkwpzrbanoaajgq
rlxghzanuyeimfhx
hozbgdoorhthlqpv
obkbmflhyanxilnx
xojrippyxjmpzmsz
ukykmbfheixuviue
qivlmdexwucqkres
rmyxxipqkarpjmox
fgaftctbvcvnrror
raawxozucfqvasru
dinpjbdfjfizexdh
gybxubwnnbuyvjcr
qrqitdvyoneqyxcg
jqzcfggayzyoqteo
cikqpvxizpdbmppm
stfpldgyhfmucjjv
slzbcuihmimpduri
aufajwfrsorqqsnl
iylmzraibygmgmqj
lcdyfpcqlktudfmu
pmomzzsdpvgkkliw
zpplirgtscfhbrkj
mvhyerxfiljlotjl
ofkvrorwwhusyxjx
xngzmvcgkqfltjpe
yxfxaqipmysahqqq
sdqafdzgfdjuabup
qcqajmerahcdgxfv
xqimrqtupbapawro
qfvkqwidzzrehsbl
himixxvueksiqfdf
vgtfqpuzxxmhrvvd
adiioqeiejguaost
jnzxuycjxvxehbvm
xedbpxdhphamoodk
jsrioscmwlsfuxrg
mtsynnfxunuohbnf
enamqzfzjunnnkpe
uwcvfecunobyhces
ciygixtgbsccpftq
ewjgcronizkcsfjy
wztjkoipxsikoimv
jrgalyvfelwxforw
imylyalawbqwkrwb
yflwqfnuuvgjsgcj
wkysyzusldlojoue
zopllxnidcffcuau
bscgwxuprxaerskj
zvnvprxxjkhnkkpq
nejwxbhjxxdbenid
chryiccsebdbcnkc
guoeefaeafhlgvxh
nzapxrfrrqhsingx
mkzvquzvqvwsejqs
kozmlmbchydtxeeo
keylygnoqhmfzrfp
srwzoxccndoxylxe
uqjzalppoorosxxo
potmkinyuqxsfdfw
qkkwrhpbhypxhiun
wgfvnogarjmdbxyh
gkidtvepcvxopzuf
atwhvmmdvmewhzty
pybxizvuiwwngqej
zfumwnazxwwxtiry
keboraqttctosemx
vtlzxaqdetbhclib
wjiecykptzexuayl
ejatfnyjjdawepyk
mpcrobansyssvmju
gqukndzganeueabm
ukzscvomorucdnqd
wfydhtbzehgwfazx
mtwqdzlephqvxqmx
dltmlfxbjopefibh
atcfrowdflluqtbi
vowawlophlxaqonw
vblgdjzvwnocdipw
uzerzksmkvnlvlhm
ytjwhpaylohorvxd
siprvfxvnxcdgofz
cbhjupewcyjhvtgs
apqtozaofusmfqli
tmssrtlxfouowqnr
ntutrvwnzzgmokes
zrsgpwdzokztdpis
nrobvmsxtfmrqdhv
kadkaftffaziqdze
yrovbgcyqtlsnoux
modheiwuhntdecqs
gzhjypwddizemnys
gaputpwpcsvzxjho
bgmouxwoajgaozau
oxuapfrjcpyakiwt
kntwbvhuaahdixzj
epqjdjbnkxdnaccx
dspltdvznhypykri
tdrgqmbnagrxdwtt
njfqawzjggmemtbg
chpemsgwpzjpdnkk
fpsrobmbqbmigmwk
flxptsrqaazmprnl
nzdunrxlcbfklshm
miuwljvtkgzdlbnn
xbhjakklmbhsdmdt
xwxhsbnrwnegwcov
pwosflhodjaiexwq
fhgepuluczttfvqh
tldxcacbvxyamvkt
gffxatrjglkcehim
tzotkdrpxkucsdps
wxheftdepysvmzbe
qfooyczdzoewrmku
rvlwikuqdbpjuvoo
bcbrnbtfrdgijtzt
vaxqmvuogsxonlgq
ibsolflngegravgo
txntccjmqakcoorp
vrrbmqaxfbarmlmc
dzspqmttgsuhczto
pikcscjunxlwqtiw
lwzyogwxqitqfqlv
gsgjsuaqejtzglym
feyeqguxbgmcmgpp
gmttebyebdwvprkn
mzuuwbhzdjfdryxu
fganrbnplymqbzjx
cvsrbdcvhtxxdmro
scmgkjlkqukoamyp
fkgrqbyqpqcworqc
hjsrvkdibdjarxxb
sztzziuqroeidcus
pxdfvcpvwaddrzwv
phdqqxleqdjfgfbg
cqfikbgxvjmnfncy'.

]

{ #category : 'as yet unclassified' }
AOC2015Day5 >> puzzleInputParsed [
	"parsed input goes here"
	^ self puzzleInput splitOn: String cr.
	
	
	
	
]

{ #category : 'as yet unclassified' }
AOC2015Day5 >> puzzlePart1 [	
^ ' --- Day 5: Doesn''t He Have Intern-Elves For This? ---
Santa needs help figuring out which strings in his text file are naughty or nice.

A nice string is one with all of the following properties:

It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.
For example:

ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), a double letter (...dd...), and none of the disallowed substrings.
aaa is nice because it has at least three vowels and a double letter, even though the letters used by different rules overlap.
jchzalrnumimnmhp is naughty because it has no double letter.
haegwjzuvuyypxyu is naughty because it contains the string xy.
dvszwmarrgswjxmb is naughty because it contains only one vowel.
How many strings are nice?
'

]

{ #category : 'as yet unclassified' }
AOC2015Day5 >> puzzlePart2 [	
^ ' Realizing the error of his ways, Santa has switched to a better model of determining whether a string is naughty or nice. None of the old rules apply, as they are all clearly ridiculous.

Now, a nice string is one with all of the following properties:

It contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
It contains at least one letter which repeats with exactly one letter between them, like xyx, abcdefeghi (efe), or even aaa.
For example:

qjhvhtzxzqqjkmpb is nice because is has a pair that appears twice (qj) and a letter that repeats with exactly one letter between them (zxz).
xxyxx is nice because it has a pair that appears twice and a letter that repeats with one between, even though the letters used by each rule overlap.
uurcxstgmygtbstg is naughty because it has a pair (tg) but no repeat with a single letter between them.
ieodomkazucvgmuy is naughty because it has a repeating letter with one between (odo), but no pair that appears twice.
How many strings are nice under these new rules?

'

]

{ #category : 'as yet unclassified' }
AOC2015Day5 >> solution1Part1 [

	| nice naughty words |
	nice := 0.
	naughty := 0.
	words := self puzzleInputParsed.
	words do: [ :w |
			| a b c |
			a := self containsThreeVowels: w.
			b := self doesNotContainStrings: w.
			c := self oneLetterTwiceInARow: w.
			({
				 a.
				 b.
				 c } includes: false)
				ifTrue: [ naughty := naughty + 1 ]
				ifFalse: [ nice := nice + 1 ] ].
	^ {
		  'naughty=>'.
		  naughty.
		  'nice=>'.
		  nice }
]

{ #category : 'as yet unclassified' }
AOC2015Day5 >> solution1Part2 [
	| nice naughty words |
	nice := 0.
	naughty := 0.
	words := self puzzleInputParsed.
	words do: [ :w |
			| a b |
			a := self containsPairLettersNoOverlap: w.
			b := self containsOneLetterBetween: w.
			({
				 a.
				 b} includes: false)
				ifTrue: [ naughty := naughty + 1 ]
				ifFalse: [ nice := nice + 1 ] ].
	^ {
		  'naughty=>'.
		  naughty.
		  'nice=>'.
		  nice }


]
