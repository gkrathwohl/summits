# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email


# VT 4000 footers
@summit_list = SummitList.create(list_name: "Vermont 4000 footers")
@list_id = @summit_list.id

@summit = Summit.create(osm_id: "356554629", name: "The Chin", elevation: 1335, latitude: -72.8142903, longitude: 44.5436627)
@summit_id = @summit.id
SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
@summit = Summit.create(osm_id: "356555375", name: "Mount Mansfield", elevation: 1335, latitude: -72.8142903, longitude: 44.5436627)
@summit_id = @summit.id
SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
@summit = Summit.create(osm_id: "356552395", name: "Adams Apple", elevation: 1257, latitude: -72.8104014, longitude: 44.5464405)
@summit_id = @summit.id
SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
@summit = Summit.create(osm_id: "356552748", name: "Camels Hump", elevation: 1239, latitude: -72.886231, longitude: 44.3195)
@summit_id = @summit.id
SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
@summit = Summit.create(osm_id: "356555022", name: "Mount Ellen", elevation: 1234, latitude: -72.9294109, longitude: 44.1604418)
@summit_id = @summit.id
SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
@summit = Summit.create(osm_id: "356554653", name: "The Nose", elevation: 1228, latitude: -72.8152217, longitude: 44.5263353)
@summit_id = @summit.id
SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
@summit = Summit.create(osm_id: "356554905", name: "Mount Abraham", elevation: 1205, latitude: -72.9360524, longitude: 44.1204146)
@summit_id = @summit.id
SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)



# # NH 4000 footers
# @summit_list = SummitList.create(list_name: "New Hampshire 4000 footers")
# @list_id = @summit_list.id

# @summit = Summit.create(osm_id: "2432687944", name: "Mount Washington", elevation: 1917, latitude: -71.3035311, longitude: 44.27046)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729530", name: "Mount Adams", elevation: 1748, latitude: -71.2917439, longitude: 44.3205392)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730203", name: "Mount Jefferson", elevation: 1725, latitude: -71.3171819, longitude: 44.3041566)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729820", name: "Mount Clay", elevation: 1684, latitude: -71.3159091, longitude: 44.2858978)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729493", name: "Mount Sam Adams", elevation: 1682, latitude: -71.3003537, longitude: 44.3217301)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729727", name: "Boott Spur", elevation: 1664, latitude: -71.2940715, longitude: 44.252654)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729489", name: "Mount Quincy Adams", elevation: 1633, latitude: -71.2881313, longitude: 44.3245077)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729523", name: "Adams Four", elevation: 1626, latitude: -71.300603, longitude: 44.3251165)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730333", name: "Mount Madison", elevation: 1620, latitude: -71.2766455, longitude: 44.3287686)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730406", name: "Mount Monroe", elevation: 1617, latitude: -71.3218848, longitude: 44.2551547)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730240", name: "Mount Lafayette", elevation: 1600, latitude: -71.6443751, longitude: 44.1607104)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729526", name: "Adams Five", elevation: 1590, latitude: -71.3064648, longitude: 44.3158968)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730273", name: "Mount Lincoln", elevation: 1551.12, latitude: -71.6445267, longitude: 44.1489542)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730025", name: "Mount Franklin", elevation: 1516, latitude: -71.3306312, longitude: 44.24951)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730793", name: "South Twin Mountain", elevation: 1491, latitude: -71.5548027, longitude: 44.187565)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729779", name: "Carter Dome", elevation: 1471, latitude: -71.1789625, longitude: 44.2672877)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730416", name: "Mount Moosilauke", elevation: 1468, latitude: -71.8314697, longitude: 44.0233582)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730089", name: "Gulf Peak", elevation: 1455, latitude: -71.2903523, longitude: 44.241455)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730481", name: "North Twin Mountain", elevation: 1452, latitude: -71.5582541, longitude: 44.20264)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729959", name: "Mount Eisenhower", elevation: 1449, latitude: -71.3503537, longitude: 44.2403434)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730283", name: "Little Haystack Mountain", elevation: 1440, latitude: -71.6457687, longitude: 44.1404366)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729724", name: "Mount Bond", elevation: 1432, latitude: -71.5312136, longitude: 44.1529181)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729772", name: "Mount Carrigain", elevation: 1422, latitude: -71.4467712, longitude: 44.0936334)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730126", name: "Mount Hight", elevation: 1415, latitude: -71.169796, longitude: 44.2758985)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730093", name: "Mount Guyot", elevation: 1396, latitude: -71.5339684, longitude: 44.1681211)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730372", name: "Middle Carter Mountain", elevation: 1384, latitude: -71.1672964, longitude: 44.3031199)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730774", name: "South Peak", elevation: 1381, latitude: -71.8409172, longitude: 44.0111779)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729714", name: "Mount Blue", elevation: 1380, latitude: -71.8203616, longitude: 44.0308998)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730457", name: "North Carter Mountain", elevation: 1359, latitude: -71.1645187, longitude: 44.3131195)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730264", name: "Mount Liberty", elevation: 1353, latitude: -71.6422055, longitude: 44.1158222)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730032", name: "Mount Garfield", elevation: 1345, latitude: -71.6107242, longitude: 44.1872209)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730765", name: "South Carter Mountain", elevation: 1344, latitude: -71.1761851, longitude: 44.2897869)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730099", name: "Mount Hancock", elevation: 1343, latitude: -71.4936885, longitude: 44.0836782)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357731054", name: "Wildcat Mountain", elevation: 1340, latitude: -71.2014625, longitude: 44.2589548)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730786", name: "South Peak Kinsman Mountain", elevation: 1320, latitude: -71.7366318, longitude: 44.1229615)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730004", name: "Mount Flume", elevation: 1316, latitude: -71.6280036, longitude: 44.1088054)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730514", name: "Mount Osceola", elevation: 1315, latitude: -71.5359105, longitude: 44.0014572)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730582", name: "Mount Pierce", elevation: 1308, latitude: -71.3657149, longitude: 44.2268471)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357731135", name: "Mount Field", elevation: 1301, latitude: -71.4345219, longitude: 44.1961768)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730474", name: "North Kinsman", elevation: 1300, latitude: -71.7368148, longitude: 44.1333547)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730899", name: "The Cliffs", elevation: 1300, latitude: -71.5409195, longitude: 44.1405773)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357731065", name: "Mount Willey", elevation: 1293, latitude: -71.4214658, longitude: 44.1836771)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730211", name: "Mount Jim", elevation: 1270, latitude: -71.8070279, longitude: 44.0247889)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357729942", name: "East Peak", elevation: 1260, latitude: -71.520585, longitude: 44.0061049)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357718717", name: "Mount Cabot", elevation: 1258, latitude: -71.4145418, longitude: 44.5060653)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730477", name: "North Peak", elevation: 1253, latitude: -71.4431306, longitude: 43.9734028)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357731027", name: "West Peak", elevation: 1248, latitude: -71.5472997, longitude: 44.0067349)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357731219", name: "Cannon Mountain", elevation: 1244, latitude: -71.6984172, longitude: 44.1564536)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730783", name: "South Peak", elevation: 1237, latitude: -71.4411861, longitude: 43.9603476)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730096", name: "Mount Hale", elevation: 1234, latitude: -71.5120241, longitude: 44.2217314)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730949", name: "Mount Tom", elevation: 1234, latitude: -71.4459112, longitude: 44.2103432)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730531", name: "Mount Passaconaway", elevation: 1225, latitude: -71.3814626, longitude: 43.9547927)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357731142", name: "Galehead Mountain", elevation: 1221, latitude: -71.5736921, longitude: 44.1853427)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730389", name: "Middle Peak", elevation: 1220, latitude: -71.4397972, longitude: 43.9653475)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730186", name: "Mount Isolation", elevation: 1220, latitude: -71.30926, longitude: 44.2148285)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730887", name: "Mount Tecumseh", elevation: 1220, latitude: -71.556498, longitude: 43.9666992)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357728727", name: "Mount Waumbek", elevation: 1218, latitude: -71.4170244, longitude: 44.4328372)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357731046", name: "Mount Whiteface", elevation: 1217, latitude: -71.4059074, longitude: 43.9339596)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730728", name: "Sandwich Mountain", elevation: 1215, latitude: -71.4981311, longitude: 43.9000705)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730423", name: "Mount Moriah", elevation: 1213, latitude: -71.1314634, longitude: 44.3403408)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357730193", name: "Mount Jackson", elevation: 1211, latitude: -71.3755571, longitude: 44.2033153)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
# @summit = Summit.create(osm_id: "357731159", name: "Sandwich Dome", elevation: 1206, latitude: -71.4981311, longitude: 43.9006261)
# @summit_id = @summit.id
# SummitInList.create(summit_id: @summit_id, summit_list_id: @list_id)
