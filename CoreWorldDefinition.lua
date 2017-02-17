_G.log("CoreWorldDefinition initialized")

core:module("CoreWorldDefinition")
core:import("CoreTable")

if not WorldDefinition.orig then
    WorldDefinition.orig = CoreTable.clone(WorldDefinition)
end

-- 一个\n对应一个回车
local TranslationTable = {
    ["txt_upper_level_1_food_cart"] = '\n\n\n\n\n\n                                   餐车',
    ["txt_main_room_food_cart"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        餐车\n',
    ["txt_main_room_101"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        101房间\n',
    ["txt_upper_level_01"] = '\n\n\n\n\n                                   上层楼01:',
    ["txt_main_lifeboat"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        救生船\n',
    ["txt_numbers_01"] = '\n\n\n\n\n  0xAD22 BLK_BEGIN_FILE.\n  0xE249\n  0x4B54 ..<[..}........%.\n  0xD299\n  0xa11F\n  0x2E14\n  0xFB30 ..)...)>.......$.\n  0x54DA >./...[:.{..%../(\n  0x51AA .........(.....>.\n  0xEA21\n  0x658L\n  0xC12u\n  0xFD9c\n  0x460y\n  0xFD92',
    ["txt_upper_level_02"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                   上层楼02:\n',
    ["txt_color_white"] = '  \n  \n  \n  \n  \n  \n                  .白',
    ["txt_color_red"] = '  \n  \n  \n  \n  \n  \n                   .红',
    ["txt_upper_level_2_bookshelf_OFF"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                   ..>(*..:.!.....&&.\n',
    ["txt_upper_level_2_Food_cart"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                   餐车\n',
    ["txt_scramble_03"] = '\n\n\n\n\n  0x3c4c .)....<>.<]>:.{.%   0x6V3a $....[:.{..]..!..\n  0x4fc5 .{$...{<:...$....   0xEA21 .).{....$/....]./\n  0x2fca [*]:$...!....<<..   0xD299 $..<}..//..*.$.$.\n  0x3117 .)...<.>.<]>:.{.%   0x4B54 ..<[..}........%.\n  0xa3c4 ...{...*){..<.).}   0xa11F ....)}.........}|\n  0x4139 ...{...*){..<.).}   0xFB30 ..)...)>.......$.\n  0xd94b ....)}..{.}......   0x54DA >./...[:.{..%../(\n  0xc95f .>)$<.:..$....}%.   0xFD92 .$^&..^$..&#...{}\n  0x4101 >./...[:.{..%../(   0xFD9c ....)}.........}|\n  0x4ca0 .)....<>.<]>:.{.%   0xC12u .)....>.<]>:.{.%.\n  0x9783 .*...{....<}$....   0x658L .>)$.:..$....}%.$\n  0x4054 .....]..!..<..]..   0x460y .).{....$/....]./\n  0x65c8 [*]<:$}%.!....<..   0xVivi %..$<:}|..!..$>%.\n  0x901e .....]..!..<..]..   0x51AA .........(.....>.\n  0x11de ....<...(.).<...%   0x2E14 ...{...*){...).*$',
    ["txt_color_blue"] = '  \n  \n  \n  \n  \n  \n                   .蓝',
    ["txt_header"] = 'B41N 已阻止紧急启动\nC:> 管理员权限\nC:>运行 内存扫描.exe -c..输出内存范围 0xA000-0xFFFF\n扫描: "安全信息数据库";',
    ["txt_numbers_02"] = '\n\n\n\n\n                             0x3117\n                             0x2fca\n                             0xa3c4\n                             0x11dF .......(.)..<.....\n                             0x413r ...{...*){.*..>)..\n                             0xd94A ....)}...........*\n                             0x901s .....]..!........>\n                             0x4fcs .{$...<:........./\n                             0x978E .*.......<}.......\n                             0x4ca0\n                             0x4101\n                             0x4054\n                             0xc95f .>)$.:............\n                             0x3c4c .)....>.<>:/.{..%.\n                             0x65c8 [*]:}%.!.....<...:',
    ["txt_lower_deck_fridge"] = '\n\n\n\n\n\n\n\n\n        冰箱',
    ["txt_main_room_aquarium_OFF"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        ..}.....<..]%..:$\n',
    ["txt_lower_deck"] = '\n\n\n\n\n\n\n\n        下层甲板:',
    ["txt_main_room_OFF"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        ..:(/.].]<*:!..)*\n',
    ["txt_upper_level_1_aquarium_OFF"] = '\n\n\n\n\n\n\n                                   ....>....]!.>....!',
    ["txt_main_cigar"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        雪茄和酒\n',
    ["txt_main_room_102"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        102房间\n',
    ["txt_main_deck"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n        主甲板:\n',
    ["txt_upper_level_1_aquarium"] = '\n\n\n\n\n\n\n                                   水族箱',
    ["txt_lower_deck_cabinet"] = '\n\n\n\n\n\n\n\n\n\n        柜子',
    ["txt_color_green"] = '  \n  \n  \n  \n  \n  \n                   .绿',
    ["txt_main_room_103"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        103房间\n',
    ["txt_main_cigar_OFF"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        .......)./....../\n',
    ["txt_color"] = '  \n  \n  \n  \n  \n\n         颜色:\n',
    ["txt_upper_level_2_Food_cart_OFF"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                   ...]..:.).....).).\n',
    ["txt_color_yellow"] = '\n\n  \n  \n  \n  \n                  .黄',
    ["txt_main_room_aquarium"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        水族箱\n',
    ["txt_main_lifeboat_OFF"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        .....!.{....(..[.\n',
    ["txt_lower_deck_cabinet_OFF"] = '\n\n\n\n\n\n\n\n\n\n        ..>/............{',
    ["txt_main_room_104"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        104房间\n',
    ["txt_lower_deck_fridge_OFF"] = '\n\n\n\n\n\n\n\n\n        ]......<.....(}.[',
    ["txt_scramble_02"] = '\n\n\n\n\n  0xa11F ....)}.........}|   0xa3c4 ...{...*){..<.).}\n  0x6V3a $....[:.{..]..!..   0x3c4c .)....<>.<]>:.{.%\n  0xEA21 .).{....$/....]./   0x4fc5 .{$...{<:...$....\n  0xFB30 ..)...)>.......$.   0x4139 ...{...*){..<.).}\n  0xD299 $..<}..//..*.$.$.   0x2fca [*]:$...!....<<..\n  0x4B54 ..<[..}........%.   0x3117 .)...<.>.<]>:.{.%\n  0xFD9c ....)}.........}|   0x4101 >./...[:.{..%../(\n  0xFD92 .$^&..^$..&#...{}   0xc95f .>)$<.:..$....}%.\n  0x54DA >./...[:.{..%../(   0xd94b ....)}..{.}......\n  0x658L .>)$.:..$....}%.$   0x9783 .*...{....<}$....\n  0xC12u .)....>.<]>:.{.%.   0x4ca0 .)....<>.<]>:.{.%\n  0x460y .).{....$/....]./   0x4054 .....]..!..<..]..\n  0x51AA .........(.....>.   0x901e .....]..!..<..]..\n  0xVivi %..$<:}|..!..$>%.   0x65c8 [*]<:$}%.!....<..\n  0x2E14 ...{...*){...).*$   0x11de ....<...(.).<...%',
    ["txt_upper_level_1_food_cart_OFF"] = '\n\n\n\n\n\n                                   )..[..].*.(..%..{.',
    ["txt_scramble_01"] = '\n\n\n\n\n  0xVivi %..$<:}|..!..$>%.   0x65c8 [*]<:$}%.!....<..\n  0x6V3a $....[:.{..]..!..   0x3c4c .)....<>.<]>:.{.%\n  0x4B54 ..<[..}........%.   0x3117 .)...<.>.<]>:.{.%\n  0xD299 $..<}..//..*.$.$.   0x2fca [*]:$...!....<<..\n  0xa11F ....)}.........}|   0xa3c4 ...{...*){..<.).}\n  0x2E14 ...{...*){...).*$   0x11de ....<...(.).<...%\n  0xFB30 ..)...)>.......$.   0x4139 ...{...*){..<.).}\n  0x54DA >./...[:.{..%../(   0xd94b ....)}..{.}......\n  0x51AA .........(.....>.   0x901e .....]..!..<..]..\n  0xEA21 .).{....$/....]./   0x4fc5 .{$...{<:...$....\n  0x658L .>)$.:..$....}%.$   0x9783 .*...{....<}$....\n  0xC12u .)....>.<]>:.{.%.   0x4ca0 .)....<>.<]>:.{.%\n  0xFD9c ....)}.........}|   0x4101 >./...[:.{..%../(\n  0x460y .).{....$/....]./   0x4054 .....]..!..<..]..\n  0xFD92 .$^&..^$..&#...{}   0xc95f .>)$<.:..$....}%.',
    ["txt_upper_level_2_bookshelf"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                   书架\n',
    ["txt_main_room_food_cart_OFF"] = '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n        .).{....$/....]./\n'
}

function WorldDefinition._setup_editable_gui(this, unit, data)
    if TranslationTable[data.name_id] then
        data.editable_gui.text = TranslationTable[data.name_id]
        data.editable_gui.font_size = "0.45"                                          -- 字体大小， 0 -- 1可调
        data.editable_gui.font = "fonts/font_small_mf"
    end
    this.orig._setup_editable_gui(this, unit, data)
end
