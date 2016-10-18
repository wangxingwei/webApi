var DataSourceTree = function(options) {
	this._data 	= options.data;
	this._delay = options.delay;
}

DataSourceTree.prototype.data = function(options, callback) {
	var self = this;
	var $data = null;
	if(!("name" in options) && !("type" in options)){
		$data = this._data;//the root tree
		callback({ data: $data });
		return;
	}
	else if("type" in options && options.type == "folder") {
		if("additionalParameters" in options && "children" in options.additionalParameters)
			$data = options.additionalParameters.children;
		else $data = {}//no data
	}
	
	if($data != null)//this setTimeout is only for mimicking some random delay
		setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);

	//we have used static data here
	//but you can retrieve your data dynamically from a server using ajax call
	//checkout examples/treeview.html and examples/treeview.js for more info
};
var tree_data = {
	'for-sale' : {name: 'For Sale', type: 'folder'}	,
	'vehicles' : {name: 'Vehicles', type: 'folder'}	,
	'rentals' : {name: 'Rentals', type: 'folder'}	,
	'real-estate' : {name: 'Real Estate', type: 'folder'}	,
	'pets' : {name: 'Pets', type: 'folder'}
}
tree_data['for-sale']['additionalParameters'] = {
	'children' : {
		'appliances' : {name: 'Appliances', type: 'folder'},
		'arts-crafts' : {name: 'Arts & Crafts', type: 'folder'},
		'clothing' : {name: 'Clothing', type: 'folder'},
		'computers' : {name: 'Computers',type: 'folder'},
		'jewelry' : {name: 'Jewelry', type: 'folder'}
	}
}
tree_data['vehicles']['additionalParameters'] = {
	'children' : {
		'cars' : {name: 'Cars', type: 'folder'},
		'motorcycles' : {name: 'Motorcycles', type: 'item'},
		'boats' : {name: 'Boats', type: 'item'}
	}
}
tree_data['vehicles']['additionalParameters']['children']['cars']['additionalParameters'] = {
	'children' : {
		'classics' : {name: 'Classics', type: 'item'},
		'convertibles' : {name: 'Convertibles', type: 'item'},
		'coupes' : {name: 'Coupes', type: 'item'},
		'hatchbacks' : {name: 'Hatchbacks', type: 'item'},
		'hybrids' : {name: 'Hybrids', type: 'item'},
		'suvs' : {name: 'SUVs', type: 'item'},
		'sedans' : {name: 'Sedans', type: 'item'},
		'trucks' : {name: 'Trucks', type: 'item'}
	}
}

tree_data['rentals']['additionalParameters'] = {
	'children' : {
		'apartments-rentals' : {name: 'Apartments', type: 'item'},
		'office-space-rentals' : {name: 'Office Space', type: 'item'},
		'vacation-rentals' : {name: 'Vacation Rentals', type: 'item'}
	}
}
tree_data['real-estate']['additionalParameters'] = {
	'children' : {
		'apartments' : {name: 'Apartments', type: 'item'},
		'villas' : {name: 'Villas', type: 'item'},
		'plots' : {name: 'Plots', type: 'item'}
	}
}
tree_data['pets']['additionalParameters'] = {
	'children': {
		'cats': {name: 'Cats', type: 'item'},
		'dogs': {name: 'Dogs', type: 'item'},
		'horses': {name: 'Horses', type: 'item'},
		'reptiles': {name: 'Reptiles', type: 'item'}

	}
}

var abc =
{
	"1": {
		"name": "酒水",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"14": {
					"name": "果酒/预调酒",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"98": {"name": "国产干红葡萄酒", "type": "item"},
							"99": {"name": "国产干白葡萄酒", "type": "item"},
							"100": {"name": "国产红葡萄酒", "type": "item"},
							"101": {"name": "国产其他果酒", "type": "item"},
							"102": {"name": "进口果酒", "type": "item"},
							"103": {"name": "起泡酒", "type": "item"},
							"104": {"name": "预调酒", "type": "item"},
							"105": {"name": "果酒礼盒", "type": "item"}
						}
					}
				},
				"15": {
					"name": "烈酒",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"106": {"name": "简装烈酒", "type": "item"},
							"107": {"name": "精装烈酒", "type": "item"},
							"108": {"name": "国产名酒", "type": "item"},
							"109": {"name": "黄酒", "type": "item"},
							"110": {"name": "滋补酒", "type": "item"},
							"111": {"name": "洋酒", "type": "item"},
							"112": {"name": "烈酒礼盒", "type": "item"}
						}
					}
				},
				"16": {
					"name": "啤酒",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"113": {"name": "国产听啤", "type": "item"},
							"114": {"name": "国产瓶啤", "type": "item"},
							"115": {"name": "进口啤酒", "type": "item"},
							"116": {"name": "啤酒组合装", "type": "item"}
						}
					}
				}
			}
		}
	},
	"2": {
		"name": "饮料",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"17": {
					"name": "果汁饮料",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"117": {"name": "100%果汁", "type": "item"},
							"118": {"name": "橙汁果汁饮料", "type": "item"},
							"119": {"name": "桃汁果汁饮料", "type": "item"},
							"120": {"name": "苹果果汁饮料", "type": "item"},
							"121": {"name": "其它口味果蔬汁", "type": "item"},
							"122": {"name": "进口饮料", "type": "item"}
						}
					}
				},
				"18": {
					"name": "碳酸饮料",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"123": {"name": "可乐", "type": "item"},
							"124": {"name": "橙味汽水", "type": "item"},
							"125": {"name": "柠檬味汽水", "type": "item"},
							"126": {"name": "其它口味汽水", "type": "item"}
						}
					}
				},
				"19": {
					"name": "茶饮料",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"127": {"name": "绿茶", "type": "item"},
							"128": {"name": "红茶", "type": "item"},
							"129": {"name": "花茶", "type": "item"},
							"130": {"name": "乌龙茶", "type": "item"},
							"131": {"name": "凉茶", "type": "item"},
							"132": {"name": "奶茶", "type": "item"},
							"133": {"name": "其它口味茶", "type": "item"}
						}
					}
				},
				"20": {
					"name": "水功能饮料",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"134": {"name": "功能饮料", "type": "item"},
							"135": {"name": "即饮咖啡", "type": "item"},
							"136": {"name": "乳制品、乳酸饮料", "type": "item"},
							"137": {"name": "植物蛋白饮料", "type": "item"},
							"138": {"name": "饮用水", "type": "item"},
							"139": {"name": "苏打水", "type": "item"}
						}
					}
				}
			}
		}
	},
	"3": {
		"name": "休食",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"21": {
					"name": "饼干威化",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"140": {"name": "咸饼干", "type": "item"},
							"141": {"name": "甜饼干", "type": "item"},
							"142": {"name": "蛋卷", "type": "item"},
							"143": {"name": "威化", "type": "item"},
							"144": {"name": "进口饼干", "type": "item"}
						}
					}
				},
				"22": {
					"name": "干果蜜饯",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"145": {"name": "瓜子花生", "type": "item"},
							"146": {"name": "其它干果", "type": "item"},
							"147": {"name": "梅类", "type": "item"},
							"148": {"name": "山楂糕卷片", "type": "item"},
							"149": {"name": "枣类", "type": "item"},
							"150": {"name": "其它蜜饯", "type": "item"},
							"151": {"name": "豆、面筋制品", "type": "item"},
							"152": {"name": "肉、禽类零食", "type": "item"},
							"153": {"name": "水产品零食", "type": "item"},
							"154": {"name": "进口干果蜜饯", "type": "item"}
						}
					}
				},
				"23": {
					"name": "糕点",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"155": {"name": "蛋糕", "type": "item"},
							"156": {"name": "派", "type": "item"},
							"157": {"name": "沙琪玛", "type": "item"},
							"158": {"name": "小面包", "type": "item"},
							"159": {"name": "其他点心", "type": "item"},
							"160": {"name": "进口糕点", "type": "item"}
						}
					}
				},
				"24": {
					"name": "膨化食品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"161": {"name": "薯片", "type": "item"},
							"162": {"name": "虾条", "type": "item"},
							"163": {"name": "其它膨化食品", "type": "item"},
							"164": {"name": "锅巴/馍干", "type": "item"},
							"165": {"name": "米饼/米通", "type": "item"}
						}
					}
				},
				"25": {
					"name": "糖巧果冻",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"166": {"name": "口香糖", "type": "item"},
							"167": {"name": "软糖", "type": "item"},
							"168": {"name": "硬糖", "type": "item"},
							"169": {"name": "巧克力", "type": "item"},
							"170": {"name": "果冻", "type": "item"},
							"171": {"name": "进口糖巧", "type": "item"}
						}
					}
				}
			}
		}
	},
	"4": {
		"name": "方便",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"26": {
					"name": "方便面/粉",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"172": {"name": "袋装方便面", "type": "item"},
							"173": {"name": "容器方便面", "type": "item"},
							"174": {"name": "方便粉丝", "type": "item"},
							"175": {"name": "其他方便食品", "type": "item"},
							"176": {"name": "进口方便面", "type": "item"}
						}
					}
				},
				"27": {
					"name": "方便速食",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"177": {"name": "火腿肠", "type": "item"},
							"178": {"name": "八宝粥、方便米饭", "type": "item"},
							"179": {"name": "方便汤", "type": "item"},
							"180": {"name": "其它速食", "type": "item"},
							"181": {"name": "鱼、肉罐头", "type": "item"},
							"182": {"name": "蔬、果罐头", "type": "item"},
							"183": {"name": "龟苓膏", "type": "item"},
							"184": {"name": "进口速食", "type": "item"}
						}
					}
				},
				"28": {
					"name": "常温乳品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"185": {"name": "纯牛奶", "type": "item"},
							"186": {"name": "常温酸奶", "type": "item"},
							"187": {"name": "加味奶", "type": "item"}
						}
					}
				},
				"29": {
					"name": "麦片/冲调粉",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"188": {"name": "成人奶粉", "type": "item"},
							"189": {"name": "麦片", "type": "item"},
							"190": {"name": "芝麻糊", "type": "item"},
							"191": {"name": "冲泡奶茶", "type": "item"},
							"192": {"name": "其它冲饮粉", "type": "item"},
							"193": {"name": "进口冲饮粉", "type": "item"},
							"194": {"name": "袋泡茶", "type": "item"},
							"195": {"name": "即溶咖啡", "type": "item"},
							"196": {"name": "蜜制饮品", "type": "item"},
							"197": {"name": "茶叶", "type": "item"}
						}
					}
				}
			}
		}
	},
	"5": {
		"name": "粮油",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"30": {
					"name": "食用油",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"198": {"name": "大豆油", "type": "item"},
							"199": {"name": "花生油", "type": "item"},
							"200": {"name": "玉米油", "type": "item"},
							"201": {"name": "调和油", "type": "item"},
							"202": {"name": "橄榄油", "type": "item"},
							"203": {"name": "其它食用油", "type": "item"}
						}
					}
				},
				"31": {
					"name": "米",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"204": {"name": "国产大米", "type": "item"},
							"205": {"name": "进口大米", "type": "item"},
							"206": {"name": "健康杂粮", "type": "item"}
						}
					}
				},
				"32": {
					"name": "面",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"207": {"name": "挂面", "type": "item"},
							"208": {"name": "精白粉", "type": "item"},
							"209": {"name": "饺子粉", "type": "item"},
							"210": {"name": "标准粉", "type": "item"},
							"211": {"name": "自发粉", "type": "item"},
							"212": {"name": "进口面粉", "type": "item"}
						}
					}
				},
				"33": {
					"name": "干货",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"213": {"name": "农产干货", "type": "item"},
							"214": {"name": "水产干货", "type": "item"}
						}
					}
				}
			}
		}
	},
	"6": {
		"name": "调料",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"34": {
					"name": "调味酱",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"215": {"name": "豆豉豆瓣酱", "type": "item"},
							"216": {"name": "辣椒酱/油辣椒", "type": "item"},
							"217": {"name": "腐乳酱豆腐", "type": "item"},
							"218": {"name": "麻酱", "type": "item"},
							"219": {"name": "果酱沙拉酱", "type": "item"},
							"220": {"name": "豆沙", "type": "item"},
							"221": {"name": "番茄酱", "type": "item"},
							"222": {"name": "芥末酱", "type": "item"},
							"223": {"name": "酱菜", "type": "item"},
							"224": {"name": "甜面酱", "type": "item"},
							"225": {"name": "火锅蘸料", "type": "item"},
							"226": {"name": "其它调味酱", "type": "item"}
						}
					}
				},
				"35": {
					"name": "调味料",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"227": {"name": "淀粉碱面", "type": "item"},
							"228": {"name": "糖", "type": "item"},
							"229": {"name": "盐", "type": "item"},
							"230": {"name": "调料", "type": "item"},
							"231": {"name": "烹饪配料", "type": "item"},
							"232": {"name": "调鲜品", "type": "item"},
							"233": {"name": "火锅底料", "type": "item"}
						}
					}
				},
				"36": {
					"name": "调味汁",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"234": {"name": "醋", "type": "item"},
							"235": {"name": "酱油", "type": "item"},
							"236": {"name": "料酒", "type": "item"},
							"237": {"name": "其它调味汁", "type": "item"},
							"238": {"name": "香油", "type": "item"}
						}
					}
				}
			}
		}
	},
	"7": {
		"name": "纸品日化",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"37": {
					"name": "护理美妆",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"239": {"name": "面部护理", "type": "item"},
							"240": {"name": "美容美妆", "type": "item"},
							"241": {"name": "身体保养", "type": "item"}
						}
					}
				},
				"38": {
					"name": "个人清洁",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"242": {"name": "沐浴露", "type": "item"},
							"243": {"name": "洗面乳", "type": "item"},
							"244": {"name": "洗手液", "type": "item"},
							"245": {"name": "香皂", "type": "item"},
							"246": {"name": "个人护理液", "type": "item"}
						}
					}
				},
				"39": {
					"name": "计生用品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"247": {"name": "避孕套", "type": "item"},
							"248": {"name": "情趣用品", "type": "item"}
						}
					}
				},
				"40": {
					"name": "特殊护理",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"249": {"name": "暖冰貼", "type": "item"},
							"250": {"name": "口罩", "type": "item"},
							"251": {"name": "创可贴", "type": "item"}
						}
					}
				},
				"41": {
					"name": "口腔剃须",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"252": {"name": "剃须用品", "type": "item"},
							"253": {"name": "牙膏", "type": "item"},
							"254": {"name": "牙刷", "type": "item"}
						}
					}
				},
				"42": {
					"name": "卫品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"255": {"name": "护垫", "type": "item"},
							"256": {"name": "日用卫生巾", "type": "item"},
							"257": {"name": "夜用卫生巾", "type": "item"},
							"258": {"name": "组合装卫生巾", "type": "item"},
							"259": {"name": "内置式卫生棉条", "type": "item"},
							"260": {"name": "成人护理垫", "type": "item"},
							"261": {"name": "成人纸尿裤", "type": "item"}
						}
					}
				},
				"43": {
					"name": "染发造型",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"262": {"name": "发用定型", "type": "item"},
							"263": {"name": "染发", "type": "item"}
						}
					}
				},
				"44": {
					"name": "洗护发",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"264": {"name": "护发素", "type": "item"},
							"265": {"name": "洗发露", "type": "item"}
						}
					}
				},
				"45": {
					"name": "家居清洁",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"266": {"name": "杀虫驱蚊", "type": "item"},
							"267": {"name": "洁厕", "type": "item"},
							"268": {"name": "去污", "type": "item"},
							"269": {"name": "洗洁精", "type": "item"},
							"270": {"name": "消毒杀菌", "type": "item"},
							"271": {"name": "芳香除味", "type": "item"},
							"272": {"name": "家用护理", "type": "item"}
						}
					}
				},
				"46": {
					"name": "家洗用品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"273": {"name": "领洁净", "type": "item"},
							"274": {"name": "漂渍液", "type": "item"},
							"275": {"name": "柔顺剂", "type": "item"},
							"276": {"name": "洗衣皂粉液", "type": "item"}
						}
					}
				},
				"47": {
					"name": "纸品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"277": {"name": "抽取式面巾纸", "type": "item"},
							"278": {"name": "厨房用纸", "type": "item"},
							"279": {"name": "湿纸巾", "type": "item"},
							"280": {"name": "手帕纸", "type": "item"},
							"281": {"name": "卫生纸", "type": "item"}
						}
					}
				},
				"48": {
					"name": "进口洗护",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"282": {"name": "进口护理美妆", "type": "item"},
							"283": {"name": "进口个人清洁", "type": "item"},
							"284": {"name": "进口急救计生", "type": "item"},
							"285": {"name": "进口口腔剃须", "type": "item"},
							"286": {"name": "进口洗涤家居", "type": "item"},
							"287": {"name": "进口纸品", "type": "item"}
						}
					}
				}
			}
		}
	},
	"8": {
		"name": "百货",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"49": {
					"name": "餐具水具酒具",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"288": {"name": "水杯", "type": "item"},
							"289": {"name": "水壶暖瓶", "type": "item"},
							"290": {"name": "餐具", "type": "item"},
							"291": {"name": "酒具", "type": "item"}
						}
					}
				},
				"50": {
					"name": "厨房工具",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"292": {"name": "厨用工具", "type": "item"},
							"293": {"name": "厨用容器", "type": "item"},
							"294": {"name": "盆类", "type": "item"},
							"295": {"name": "桶类", "type": "item"},
							"296": {"name": "炒锅", "type": "item"},
							"297": {"name": "压力锅", "type": "item"},
							"298": {"name": "套装锅", "type": "item"},
							"299": {"name": "其它锅具", "type": "item"}
						}
					}
				},
				"51": {
					"name": "汽车用品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"300": {"name": "车载充电设备", "type": "item"},
							"301": {"name": "车用清洁", "type": "item"},
							"302": {"name": "车用摆件", "type": "item"}
						}
					}
				},
				"52": {
					"name": "清洁工具",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"303": {"name": "衣物除尘", "type": "item"},
							"304": {"name": "清扫工具", "type": "item"},
							"305": {"name": "乳胶手套", "type": "item"},
							"306": {"name": "抹布钢丝球", "type": "item"},
							"307": {"name": "疏通工具", "type": "item"},
							"308": {"name": "纸篓垃圾桶", "type": "item"}
						}
					}
				},
				"53": {
					"name": "收纳卫浴用品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"309": {"name": "收纳用品", "type": "item"},
							"310": {"name": "卫浴用品", "type": "item"},
							"311": {"name": "衣架及配件", "type": "item"},
							"312": {"name": "粘钩", "type": "item"}
						}
					}
				},
				"54": {
					"name": "五金工具",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"313": {"name": "插座", "type": "item"},
							"314": {"name": "电池", "type": "item"},
							"315": {"name": "工具类", "type": "item"},
							"316": {"name": "锁", "type": "item"},
							"317": {"name": "照明", "type": "item"}
						}
					}
				},
				"55": {
					"name": "一次性用品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"318": {"name": "保鲜膜袋", "type": "item"},
							"319": {"name": "垃圾袋", "type": "item"},
							"320": {"name": "一次性餐具", "type": "item"},
							"321": {"name": "一次性用品", "type": "item"},
							"322": {"name": "一次性纸杯", "type": "item"}
						}
					}
				},
				"56": {
					"name": "文体娱乐",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"323": {"name": "其它运动", "type": "item"},
							"324": {"name": "球类运动", "type": "item"},
							"325": {"name": "棋牌类", "type": "item"}
						}
					}
				},
				"57": {
					"name": "毛巾浴巾",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"326": {"name": "毛巾", "type": "item"},
							"327": {"name": "小方巾", "type": "item"},
							"328": {"name": "浴巾", "type": "item"}
						}
					}
				},
				"58": {
					"name": "床上用品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"329": {"name": "夏凉", "type": "item"},
							"330": {"name": "被子", "type": "item"},
							"331": {"name": "床单被罩", "type": "item"},
							"332": {"name": "枕头", "type": "item"},
							"333": {"name": "毯类", "type": "item"},
							"334": {"name": "热水袋", "type": "item"}
						}
					}
				},
				"59": {
					"name": "内衣",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"335": {"name": "内衣", "type": "item"},
							"336": {"name": "内裤", "type": "item"},
							"337": {"name": "睡衣", "type": "item"},
							"338": {"name": "棉袜", "type": "item"},
							"339": {"name": "丝袜", "type": "item"},
							"340": {"name": "连裤袜", "type": "item"},
							"341": {"name": "其它服饰", "type": "item"},
							"342": {"name": "进口服饰", "type": "item"}
						}
					}
				},
				"60": {
					"name": "鞋类",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"343": {"name": "拖鞋", "type": "item"},
							"344": {"name": "鞋垫", "type": "item"},
							"345": {"name": "其它鞋类", "type": "item"}
						}
					}
				},
				"61": {
					"name": "雨具",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"346": {"name": "雨披雨鞋", "type": "item"},
							"347": {"name": "雨伞", "type": "item"}
						}
					}
				},
				"62": {
					"name": "文具",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"348": {"name": "书写类", "type": "item"},
							"349": {"name": "纸本类", "type": "item"},
							"350": {"name": "桌面文具", "type": "item"},
							"351": {"name": "其它文具", "type": "item"}
						}
					}
				},
				"63": {
					"name": "进口百货",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"352": {"name": "进口日杂", "type": "item"},
							"353": {"name": "进口纺织", "type": "item"}
						}
					}
				}
			}
		}
	},
	"9": {
		"name": "冷冻冷藏",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"64": {
					"name": "冰激凌",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"354": {"name": "棒冰", "type": "item"},
							"355": {"name": "袋装冰激凌", "type": "item"},
							"356": {"name": "盒装冰淇淋", "type": "item"},
							"357": {"name": "桶装冰淇淋", "type": "item"},
							"358": {"name": "冰激凌月饼", "type": "item"}
						}
					}
				},
				"65": {
					"name": "冷冻副食",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"359": {"name": "冷冻畜肉", "type": "item"},
							"360": {"name": "冷冻水产", "type": "item"},
							"361": {"name": "冷冻禽肉", "type": "item"},
							"362": {"name": "冷冻炸煮类", "type": "item"},
							"363": {"name": "火锅食材", "type": "item"}
						}
					}
				},
				"66": {
					"name": "低温乳品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"364": {"name": "低温纯奶", "type": "item"},
							"365": {"name": "低温酸奶", "type": "item"},
							"366": {"name": "低温果汁", "type": "item"},
							"367": {"name": "干奶乳制品", "type": "item"}
						}
					}
				},
				"67": {
					"name": "加工半成品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"368": {"name": "米酒醪糟", "type": "item"},
							"369": {"name": "冷藏菜类", "type": "item"},
							"370": {"name": "豆腐豆浆", "type": "item"}
						}
					}
				},
				"68": {
					"name": "冷冻面点",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"371": {"name": "汤圆", "type": "item"},
							"372": {"name": "水饺", "type": "item"},
							"373": {"name": "混沌", "type": "item"},
							"374": {"name": "中式面点", "type": "item"},
							"375": {"name": "西式面点", "type": "item"},
							"376": {"name": "粽子", "type": "item"}
						}
					}
				},
				"69": {
					"name": "低温熟食",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"377": {"name": "火腿", "type": "item"},
							"378": {"name": "培根", "type": "item"},
							"379": {"name": "香肠", "type": "item"},
							"380": {"name": "烤肉", "type": "item"},
							"381": {"name": "其它熟食", "type": "item"}
						}
					}
				}
			}
		}
	},
	"10": {
		"name": "蔬果",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"70": {
					"name": "蔬菜类",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"382": {"name": "叶菜类", "type": "item"},
							"383": {"name": "根茎类", "type": "item"},
							"384": {"name": "食果类", "type": "item"},
							"385": {"name": "荚豆类", "type": "item"},
							"386": {"name": "菇菌类", "type": "item"},
							"387": {"name": "定制蔬菜", "type": "item"}
						}
					}
				},
				"71": {
					"name": "水果",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"388": {"name": "苹果梨类", "type": "item"},
							"389": {"name": "柑橘柚子类", "type": "item"},
							"390": {"name": "瓜类", "type": "item"},
							"391": {"name": "热带水果类", "type": "item"},
							"392": {"name": "桃李类", "type": "item"},
							"393": {"name": "浆果类", "type": "item"},
							"394": {"name": "水果礼盒", "type": "item"},
							"395": {"name": "耗材", "type": "item"}
						}
					}
				},
				"72": {
					"name": "蛋品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"396": {"name": "散装蛋品", "type": "item"},
							"397": {"name": "盒装蛋品", "type": "item"},
							"398": {"name": "蛋制品", "type": "item"}
						}
					}
				},
				"73": {
					"name": "主食",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"399": {"name": "馒头花卷", "type": "item"},
							"400": {"name": "面条烙饼", "type": "item"},
							"401": {"name": "加工食品", "type": "item"},
							"402": {"name": "面包", "type": "item"},
							"403": {"name": "糕点", "type": "item"}
						}
					}
				},
				"74": {
					"name": "常温熟食",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"404": {"name": "烤鸭", "type": "item"},
							"405": {"name": "肉类熟食", "type": "item"},
							"406": {"name": "禽类熟食", "type": "item"}
						}
					}
				}
			}
		}
	},
	"11": {
		"name": "妇婴用品",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"75": {
					"name": "孕产用品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"407": {"name": "妈咪裤", "type": "item"},
							"408": {"name": "孕产洗护", "type": "item"},
							"409": {"name": "孕产营养品", "type": "item"}
						}
					}
				},
				"76": {
					"name": "婴童用品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"410": {"name": "婴童餐具", "type": "item"},
							"411": {"name": "婴童餐具套装", "type": "item"},
							"412": {"name": "婴童水具", "type": "item"},
							"413": {"name": "婴童奶瓶", "type": "item"}
						}
					}
				},
				"77": {
					"name": "婴童玩具",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"414": {"name": "塑形DIY玩具", "type": "item"},
							"415": {"name": "涂色DIY玩具", "type": "item"},
							"416": {"name": "充气球", "type": "item"},
							"417": {"name": "男孩玩具", "type": "item"},
							"418": {"name": "女孩玩具", "type": "item"},
							"419": {"name": "益智玩具", "type": "item"}
						}
					}
				},
				"78": {
					"name": "婴童家庭清洁",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"420": {"name": "婴童洗漱", "type": "item"},
							"421": {"name": "婴童口腔", "type": "item"},
							"422": {"name": "婴童洗衣", "type": "item"},
							"423": {"name": "奶瓶清洗剂", "type": "item"},
							"424": {"name": "玩具清洁剂", "type": "item"}
						}
					}
				},
				"79": {
					"name": "婴童家庭护理",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"425": {"name": "婴童驱虫", "type": "item"},
							"426": {"name": "婴童花露水", "type": "item"},
							"427": {"name": "儿童浴衣", "type": "item"},
							"428": {"name": "婴童护理", "type": "item"},
							"429": {"name": "婴童湿巾", "type": "item"}
						}
					}
				},
				"80": {
					"name": "婴童纸尿裤",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"430": {"name": "初生纸尿裤", "type": "item"},
							"431": {"name": "小号纸尿裤", "type": "item"},
							"432": {"name": "中号纸尿裤", "type": "item"},
							"433": {"name": "大号纸尿裤", "type": "item"},
							"434": {"name": "成长拉拉裤", "type": "item"}
						}
					}
				},
				"81": {
					"name": "婴童奶粉",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"435": {"name": "初生奶粉", "type": "item"},
							"436": {"name": "一段奶粉", "type": "item"},
							"437": {"name": "二段奶粉", "type": "item"},
							"438": {"name": "三段奶粉", "type": "item"},
							"439": {"name": "四段奶粉", "type": "item"},
							"440": {"name": "米粉辅食", "type": "item"}
						}
					}
				},
				"82": {
					"name": "保健品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"441": {"name": "美容减肥产品", "type": "item"},
							"442": {"name": "儿童保健品", "type": "item"},
							"443": {"name": "男性保健品", "type": "item"},
							"444": {"name": "传统滋补品", "type": "item"},
							"445": {"name": "营养品", "type": "item"},
							"446": {"name": "进口保健品", "type": "item"}
						}
					}
				}
			}
		}
	},
	"12": {
		"name": "惠民特色",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"83": {
					"name": "节日装饰",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"447": {"name": "串灯彩带", "type": "item"},
							"448": {"name": "灯笼", "type": "item"},
							"449": {"name": "新年剪纸", "type": "item"},
							"450": {"name": "春联", "type": "item"},
							"451": {"name": "圣诞帽", "type": "item"},
							"452": {"name": "圣诞树", "type": "item"},
							"453": {"name": "圣诞贴纸挂件", "type": "item"},
							"454": {"name": "情人节饰品", "type": "item"},
							"455": {"name": "复活节饰品", "type": "item"},
							"456": {"name": "万圣节饰品", "type": "item"}
						}
					}
				},
				"84": {
					"name": "设备辅料",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"457": {"name": "关东煮辅料", "type": "item"},
							"458": {"name": "冲饮辅料", "type": "item"},
							"459": {"name": "小吃辅料", "type": "item"},
							"460": {"name": "设备投放", "type": "item"}
						}
					}
				},
				"85": {
					"name": "烘焙微波",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"461": {"name": "特色甜点", "type": "item"},
							"462": {"name": "面制微波", "type": "item"},
							"463": {"name": "米制微波", "type": "item"},
							"464": {"name": "小吃微波", "type": "item"},
							"465": {"name": "花式面包", "type": "item"},
							"466": {"name": "起酥类", "type": "item"},
							"467": {"name": "汉堡包", "type": "item"},
							"468": {"name": "三明治", "type": "item"},
							"469": {"name": "卷饼类", "type": "item"},
							"470": {"name": "切片类", "type": "item"}
						}
					}
				},
				"86": {
					"name": "便利鲜饮 ",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"471": {"name": "鲜制饮品", "type": "item"},
							"472": {"name": "现调冷饮", "type": "item"},
							"473": {"name": "现调热饮", "type": "item"},
							"474": {"name": "冲调饮品", "type": "item"}
						}
					}
				},
				"87": {
					"name": "便利热食",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"475": {"name": "半成品盒饭", "type": "item"},
							"476": {"name": "关东煮", "type": "item"},
							"477": {"name": "玉米", "type": "item"},
							"478": {"name": "烤肠", "type": "item"},
							"479": {"name": "粽子", "type": "item"},
							"480": {"name": "茶叶蛋", "type": "item"},
							"481": {"name": "风味小吃", "type": "item"},
							"482": {"name": "爆米花", "type": "item"},
							"483": {"name": "包子", "type": "item"}
						}
					}
				},
				"88": {
					"name": "便利冷食",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"484": {"name": "面食", "type": "item"},
							"485": {"name": "饭团", "type": "item"},
							"486": {"name": "沙拉", "type": "item"},
							"487": {"name": "加工果蔬", "type": "item"},
							"488": {"name": "寿司", "type": "item"},
							"489": {"name": "腌制菜类", "type": "item"},
							"490": {"name": "意大利面．通心粉", "type": "item"},
							"491": {"name": "奶制品", "type": "item"},
							"492": {"name": "冰淇林", "type": "item"}
						}
					}
				},
				"89": {
					"name": "便利快餐",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"493": {"name": "主食厨房午餐", "type": "item"},
							"494": {"name": "主食厨房晚餐", "type": "item"},
							"495": {"name": "外卖厨房午餐", "type": "item"},
							"496": {"name": "外卖厨房晚餐", "type": "item"}
						}
					}
				},
				"90": {
					"name": "鲜花礼品",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"497": {"name": "鲜花", "type": "item"},
							"498": {"name": "干花", "type": "item"},
							"499": {"name": "绿植", "type": "item"},
							"500": {"name": "种子花盆", "type": "item"},
							"501": {"name": "肥料", "type": "item"},
							"502": {"name": "礼品", "type": "item"},
							"503": {"name": "包装", "type": "item"},
							"504": {"name": "配送", "type": "item"}
						}
					}
				}
			}
		}
	},
	"13": {
		"name": "超值",
		"type": "folder",
		"additionalParameters": {
			"children": {
				"91": {
					"name": "理财",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"505": {"name": "基金", "type": "item"},
							"506": {"name": "固定收益理财", "type": "item"},
							"507": {"name": "股票", "type": "item"},
							"508": {"name": "期货", "type": "item"}
						}
					}
				},
				"92": {
					"name": "充值",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"509": {"name": "手机充值", "type": "item"},
							"510": {"name": "流量充值", "type": "item"},
							"511": {"name": "手游充值", "type": "item"},
							"512": {"name": "端游充值", "type": "item"}
						}
					}
				},
				"93": {
					"name": "保险",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"513": {"name": "意外险", "type": "item"},
							"514": {"name": "车险", "type": "item"},
							"515": {"name": "健康险", "type": "item"},
							"516": {"name": "旅行险", "type": "item"}
						}
					}
				},
				"94": {
					"name": "票务旅行",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"517": {"name": "车票", "type": "item"},
							"518": {"name": "机票", "type": "item"},
							"519": {"name": "酒店", "type": "item"},
							"520": {"name": "旅游套餐", "type": "item"},
							"521": {"name": "演唱会", "type": "item"},
							"522": {"name": "音乐会", "type": "item"},
							"523": {"name": "体育赛事", "type": "item"}
						}
					}
				},
				"95": {
					"name": "教育培训",
					"type": "folder",
					"additionalParameters": {
						"children": {
							"524": {"name": "早教", "type": "item"},
							"525": {"name": "中小学辅导", "type": "item"},
							"526": {"name": "高中辅导", "type": "item"},
							"527": {"name": "学历教育", "type": "item"},
							"528": {"name": "技能培训", "type": "item"}
						}
					}
				},
				"96": {
					"name": "折扣卷",
					"type": "folder",
					"additionalParameters": {"children": {"529": {"name": "折扣劵", "type": "item"}}}
				},
				"97": {
					"name": "彩票",
					"type": "folder",
					"additionalParameters": {"children": {"530": {"name": "彩票", "type": "item"}}}
				}
			}
		}
	}
}

/*var treeDataSource = new DataSourceTree({data: format_tree});*/
