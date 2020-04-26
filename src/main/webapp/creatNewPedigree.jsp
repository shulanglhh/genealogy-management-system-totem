<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>新建族谱</title>

<jsp:include page="inc.jsp"></jsp:include>
	<script type="text/javascript">	
		
	$(function() {
		$('#navbar').accordion('select', '族谱制作');
		var username="<%=session.getAttribute("usercode")%>";
		var userid="<%=session.getAttribute("userid")%>";
		$('#creatnewpedigree_form').form(
				{
					url : '${pageContext.request.contextPath}/genealogyAction!creatthenewPedigree.action',					
					onSubmit : function() {
						if(!$("#creatnewpedigree_form").form('validate')){
							return false;
							}
						else{
						$('#uid').val(userid);
						$('#username').val(username);
						
						}
					},
					success : function(data) {
						var dataj = jQuery.parseJSON(data);
						if(dataj.success==true){
							$.messager.show({
								title : '提示',
								msg : dataj.msg
							});
							checkthesave();
						}
						else{
							$.messager.show({
								title : '提示',
								msg : dataj.msg
							});
						}
					}
				});
	});
	function checkthesave(){
		location.href='<%=path%>/'+'MangeGenealogy.jsp';
		}
	</script>
</head>

<body class="easyui-layout" data-options="fit:true">
	 <div data-options="region:'north'" style="height:50px;overflow:hidden;">
		<div align=right>
		<span>
			<jsp:include page="./header.jsp"></jsp:include>
		</span>
		</div>
	</div>
	<div data-options="region:'south'" style="height:20px"></div>
	<div data-options="region:'west',title:'菜单',split:true"
		style="width:200px">
		<jsp:include page="newnav.jsp"></jsp:include>

	</div>
	<div data-options="region:'center'" id="centerLayout">
<div class="easyui-layout" id="layoutdialog" data-options="fit:true">
	<div data-options="region:'center'" style="height:600px">
	
	<div id="creatnewpedigree_Dialog" style="width: 700px;height:400px;" class="easyui-dialog" data-options="title:'新建族谱(带*号的为必填)',iconCls:'icon-save',resizable:true,closed:false,modal:false,buttons:[
				{
				text:'新建族谱',
				iconCls:'icon-save',
				handler:function(){
					$('#creatnewpedigree_form').submit();
				}
			},{text:'重置',
				iconCls:'icon-remove',
				handler:function(){
					$('#creatnewpedigree_form')[0].reset();
				}
			}]">
	<form id="creatnewpedigree_form" method="post">
		<table style="margin-top:10px" cellpadding="10px" align="center">
			<tr>
				<td>族谱名称</td>
				<td><input class="easyui-validatebox" data-options="required:true,missingMessage:'族谱名称必填'" name="gname" id="gname"/></td>
				<td style="color:red">*</td>
				<td>姓氏</td>
				<td><input class="easyui-validatebox" data-options="required:true,missingMessage:'族谱名称必填'" name="familyname" id="familyname"/></td>
				<td style="color:red">*</td>
			</tr>
		
			<tr>
			<td>族谱描述</td>
			<td><input type="text" name="description" id="description"></td>
			<td></td>
			<td>堂号</td>
			<td><input type="text" name="tangname" id="tangname"></td>
			</tr>
<!-- 			<tr> -->
<!-- 			<td><a title="例如：中华刘氏统谱" class="easyui-tooltip">双世系前缀信息</a> </td> -->
<!-- 				<td><input type="text" name="doublegenprefix" id="doublegenprefix"></td> -->
<!-- 				<td></td> -->
<!-- 				<td><a title="例如：只填写数字" class="easyui-tooltip">双世系起始世代</a></td> -->
<!-- 				<td><input type="text" class="easyui-numberbox" data-options="min:1" name="doublegen" id="doublegen"></td> -->
<!-- 			</tr> -->
			<tr>
			
			<td>族谱所属省份</td>
			<td><select name="locationplace" id="locationplace" style="width:155px"  onchange="changecity()">
			<option selected value=""></option>
                <option value="江苏省">江苏省</option>
                <option value="北京">北京</option>
                <option value="天津">天津</option>
                <option value="上海">上海</option>
                <option value="重庆">重庆</option>
                <option value="广东省">广东省</option>
                <option value="浙江省">浙江省</option>
                <option value="福建省">福建省</option>
                <option value="湖南省">湖南省</option>
                <option value="湖北省">湖北省</option>
                <option value="山东省">山东省</option>
                <option value="辽宁省">辽宁省</option>
                <option value="吉林省">吉林省</option>
                <option value="云南省">云南省</option>
                <option value="四川省">四川省</option>
                <option value="安徽省">安徽省</option>
                <option value="江西省">江西省</option>
                <option value="黑龙江省">黑龙江省</option>
                <option value="河北省">河北省</option>
                <option value="陕西省">陕西省</option>
                <option value="海南省">海南省</option>
                <option value="河南省">河南省</option>
                <option value="山西省">山西省</option>
                <option value="内蒙古">内蒙古</option>
                <option value="广西">广西</option>
                <option value="贵州省">贵州省</option>
                <option value="宁夏">宁夏</option>
                <option value="青海省">青海省</option>
                <option value="新疆">新疆</option>
                <option value="西藏">西藏</option>
                <option value="甘肃省">甘肃省</option>
                <option value="台湾省">台湾省</option>
                <option value="香港">香港</option>
                <option value="澳门">澳门</option>
                <option value="国外">国外</option>
              </select></td>
			<td></td>
			<td>族谱所属城市</td>
			<td><select name="city" id="city" style="width:80">
               </select></td>
			</tr>
<!-- 			<tr> -->
<!-- 			<td>修谱年代</td> -->
<!-- 			<td><input type="text" name="source" id="source"></td> -->
<!-- 			</tr> -->
<!-- 			<tr style="display:none"> -->
<!-- 				<td>主责任人</td> -->
<!-- 				<td><input class="test423" data-options="required:true,missingMessage:'主负责人必填'" name="mainresponsible" id="mainresponsible" value = "wearefamily"/></td> -->
<!-- 				<td style="color:red">*</td> -->
<!-- 				<td>其他责任人</td> -->
<!-- 				<td><input type="text" name="otherresponsible" id="otherresponsible"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>联系方式</td> -->
<!-- 				<td><input type="text" name="contact" id="contact"></td> -->
<!-- 				<td></td> -->
<!-- 				<td>联系人</td> -->
<!-- 				<td><input type="text" name="contactperson" id="contactperson"></td> -->
<!-- 			</tr>   -->
		</table>
		<input type="hidden" name="uid" id="uid">
		<input type="hidden" name="username" id="username">
	</form>
</div>
</div>
</div>
</div>
</body>
<script type="text/javascript">
function changecity(){
	 index = creatnewpedigree_form.locationplace.options.selectedIndex-1;
	 creatnewpedigree_form.city.length = city[index].length;
	 for(var i = 0;i<city[index].length;i++)
	  {
	   var text = city[index][i].split("-");
	   creatnewpedigree_form.city.options[i].text = text[0];
	   creatnewpedigree_form.city.options[i].value =text[1];
	  }
	}
	
	var city = new Array(   
	   new Array(
	      //"江苏省(全部地区）-江苏省(全部地区）",
	      "江阴市-江阴市",
	      "无锡市-无锡市",
	      "宜兴市-宜兴市",
	      "常州市-常州市",
	      "南京市-南京市",
	      "溧水县-溧水县",
	      "高淳县-高淳县",
	      "苏州市-苏州市",
	      "常熟市-常熟市",
	      "张家港市-张家港市",
	      "昆山市-昆山市",
	      "吴江市-吴江市",
	      "太仓市-太仓市",
	      "溧阳市-溧阳市",
	      "金坛市-金坛市",
	      "南通市-南通市",
	      "海安县-海安县",
	      "如东县-如东县",
	      "启东市-启东市",
	      "如皋市-如皋市",
	      "通州市-通州市",
	      "海门市-海门市",
	      "镇江市-镇江市",
	      "丹阳市-丹阳市",
	      "扬中市-扬中市",
	      "句容市-句容市",
	      "徐州市-徐州市",
	      "丰县-丰县",
	      "沛县-沛县",
	      "铜山县-铜山县",
	      "睢宁县-睢宁县",
	      "新沂市-新沂市",
	      "邳州市-邳州市",
	      "连云港市-连云港市",
	      "赣榆县-赣榆县",
	      "东海县-东海县",
	      "灌云县-灌云县",
	      "淮安市-淮安市",
	      "涟水县-涟水县",
	      "洪泽县-洪泽县",
	      "盱眙县-盱眙县",
	      "金湖县-金湖县",
	      "盐城市-盐城市",
	      "响水县-响水县",
	      "滨海县-滨海县",
	      "阜宁县-阜宁县",
	      "射阳县-射阳县",
	      "建湖县-建湖县",
	      "盐都县-盐都县",
	      "东台县-东台县",
	      "大丰市-大丰市",
	      "扬州市-扬州市",
	      "宝应县-宝应县",
	      "仪征县-仪征县",
	      "高邮市-高邮市",
	      "江都市-江都市",
	      "宿迁市-宿迁市",
	      "宿豫县-宿豫县",
	      "沭阳县-沭阳县",
	      "泗阳县-泗阳县",
	      "泗洪县-泗洪县",
	      "泰州市-泰州市",
	      "兴化市-兴化市",
	      "靖江市-靖江市",
	      "泰兴市-泰兴市",
	      "姜堰市-姜堰市"),
	    new Array("北京-北京"),
	    new Array("天津-天津"),
	    new Array("上海-上海"),
	    new Array("重庆-重庆"),
	    new Array(
	      //"广东省 (全部地区）-广东省 (全部地区）",
	      "广州-广州",
	      "深圳-深圳",
	      "东莞-东莞",
	      "中山-中山",
	      "佛山-佛山",
	      "珠海-珠海",
	      "惠州-惠州",
	      "汕头-汕头",
	      "湛江-湛江",
	      "潮州-潮州",
	      "潮阳-潮阳",
	      "江门-江门",
	      "汕尾-汕尾",
	      "茂名-茂名",
	      "阳江-阳江",
	      "肇庆-肇庆",
	      "梅州-梅州",
	      "云浮-云浮",
	      "清远-清远",
	      "韶关-韶关",
	      "河源-河源",
	      "揭阳-揭阳",
	      "其他-其他"),
	    
	    new Array(
	      //"浙江省(全部地区）-浙江省(全部地区）",
	      "杭州-杭州",
	      "宁波-宁波",
	      "温州-温州",
	      "金华-金华",
	      "义乌-义乌",
	      "绍兴-绍兴",
	      "湖州-湖州",
	      "余姚-余姚",
	      "临海-临海",
	      "萧山-萧山",
	      "临安-临安",
	      "诸暨-诸暨",
	      "嵊泗-嵊泗",
	      "兰溪-兰溪",
	      "嘉兴-嘉兴",
	      "海宁-海宁",
	      "桐乡-桐乡",
	      "衢州-衢州",
	      "上虞-上虞",
	      "嵊州-嵊州",
	      "慈溪-慈溪",
	      "丽水-丽水",
	      "瓯海-瓯海",
	      "黄岩-黄岩",
	      "椒江-椒江",
	      "其他-其他"),
	    new Array(
	      //"福建省(全部地区）-福建省(全部地区）",
	      "福州-福州",
	      "厦门-厦门",
	      "泉州-泉州",
	      "漳州-漳州",
	      "石狮-石狮",
	      "三明-三明",
	      "南平-南平",
	      "莆田-莆田",
	      "永安-永安",
	      "邵武-邵武",
	      "龙岩-龙岩",
	      "其他-其他"),
	    new Array(
	      //"湖南省(全部地区）-湖南省(全部地区）",
	      "长沙 -长沙",
	      "湘潭-湘潭",
	      "岳阳 -岳阳",
	      "株洲-株洲",
	      "张家界-张家界",
	      "衡阳-衡阳",
	      "郴州-郴州",
	      "湘乡-湘乡",
	      "汨罗-汨罗",
	      "常德-常德",
	      "津市-津市",
	      "吉首-吉首",
	      "娄底-娄底",
	      "涟源-涟源",
	      "冷水江-冷水江",
	      "怀化-怀化",
	      "洪江-洪江",
	      "益阳 -益阳",
	      "耒阳-耒阳",
	      "邵阳-邵阳",
	      "永州-永州",
	      "冷水滩-冷水滩",
	      "其他-其他"),
	    new Array(
	      //"湖北省(全部地区）-湖北省(全部地区）",
	      "武汉-武汉",
	      "宜昌-宜昌",
	      "孝感-孝感",
	      "荆州-荆州",
	      "襄樊-襄樊",
	      "老河口-老河口",
	      "枝城-枝城",
	      "枣阳-枣阳",
	      "荆门-荆门",
	      "宜城-宜城",
	      "黄石-黄石",
	      "鄂州-鄂州",
	      "黄冈-黄冈",
	      "咸宁-咸宁",
	      "武穴-武穴",
	      "蒲昕-蒲昕",
	      "麻城-麻城",
	      "十堰-十堰",
	      "恩施-恩施",
	      "丹江口-丹江口",
	      "利川-利川",
	      "天门-天门",
	      "汉川-汉川",
	      "洪湖-洪湖",
	      "应城-应城",
	      "潜江-潜江",
	      "安陆-安陆",
	      "仙桃-仙桃",
	      "随州-随州",
	      "石首-石首",
	      "其他-其他"),
	    new Array(
	      //"山东省(全部地区）-山东省(全部地区）",
	      "济南-济南",
	      "青岛-青岛",
	      "烟台-烟台",
	      "淄博-淄博",
	      "潍坊 -潍坊",
	      "临沂-临沂",
	      "莱芜-莱芜",
	      "济宁-济宁",
	      "荷泽-荷泽",
	      "日照-日照",
	      "藤州-藤州",
	      "聊城-聊城",
	      "德州-德州",
	      "滨州-滨州",
	      "临清-临清",
	      "青州 -青州",
	      "威海-威海",
	      "泰安-泰安",
	      "新泰-新泰",
	      "曲阜-曲阜",
	      "东营-东营",
	      "诸城-诸城",
	      "枣庄-枣庄",
	      "其他-其他"),
	    new Array(
	      //"辽宁省(全部地区）-辽宁省(全部地区）",
	      "沈阳-沈阳",
	      "铁岭-铁岭",
	      "抚顺-抚顺",
	      "大连-大连",
	      "本溪-本溪",
	      "营口-营口",
	      "锦州-锦州",
	      "兴城-兴城",
	      "北票-北票",
	      "盘锦-盘锦",
	      "辽阳-辽阳",
	      "铁法 -铁法",
	      "鞍山-鞍山",
	      "瓦房店-瓦房店",
	      "丹东-丹东",
	      "锦西-锦西",
	      "朝阳-朝阳",
	      "阜新-阜新",
	      "海城-海城",
	      "其他-其他"),
	    new Array(
	      //"吉林省 (全部地区）-吉林省 (全部地区）",
	      "长春-长春",
	      "吉林-吉林",
	      "通化-通化",
	      "扶余-扶余",
	      "桦甸-桦甸",
	      "延吉-延吉",
	      "图门-图门",
	      "龙井-龙井",
	      "敦化-敦化",
	      "集安-集安",
	      "浑江-浑江",
	      "梅河口-梅河口",
	      "四平-四平",
	      "公主岭-公主岭",
	      "辽源-辽源",
	      "白城-白城",
	      "洮南-洮南",
	      "九台-九台",
	      "其他-其他"),
	    new Array(
	      //"云南省(全部地区）-云南省(全部地区）",
	      "昆明-昆明",
	      "曲靖-曲靖",
	      "大理-大理",
	      "玉溪-玉溪",
	      "丽江-丽江",
	      "楚雄-楚雄",
	      "开远-开远",
	      "迪庆-迪庆",
	      "东川-东川",
	      "照通-照通",
	      "个旧-个旧",
	      "保山-保山",
	      "文山-文山"),
	    new Array(
	      //"四川省(全部地区）-四川省(全部地区）",
	      "成都-成都",
	      "宜宾-宜宾",
	      "泸州-泸州",
	      "内江-内江",
	      "攀枝花-攀枝花",
	      "西昌-西昌",
	      "德阳-德阳",
	      "雅安-雅安",
	      "遂宁-遂宁",
	      "南充-南充",
	      "绵阳-绵阳",
	      "广元 -广元",
	      "马尔康-马尔康",
	      "达县-达县",
	      "华鉴-华鉴",
	      "自贡-自贡",
	      "乐山-乐山",
	      "其他-其他"),
	    new Array(
	      //"安徽省(全部地区）-安徽省(全部地区）",
	      "合肥-合肥",
	      "芜湖-芜湖",
	      "马鞍山-马鞍山",
	      "蚌埠-蚌埠",
	      "铜陵-铜陵",
	      "淮北-淮北",
	      "淮南-淮南",
	      "亳州-亳州",
	      "巢湖-巢湖",
	      "黄山-黄山",
	      "歙县-歙县",
	      "宿州-宿州",
	      "阜阳-阜阳",
	      "六安-六安",
	      "滁州-滁州",
	      "宣州-宣州",
	      "黄山-黄山",
	      "安庆-安庆",
	      "其他-其他"),
	    new Array(
	      //"江西省(全部地区）-江西省(全部地区）",
	      "南昌-南昌",
	      "德镇-德镇",
	      "九江-九江",
	      "鹰潭-鹰潭",
	      "宜春-宜春",
	      "新余-新余",
	      "萍乡-萍乡",
	      "赣州-赣州",
	      "吉安-吉安",
	      "井冈山-井冈山",
	      "抚州-抚州",
	      "临川-临川",
	      "上饶-上饶",
	      "其他-其他"),
	    new Array(
	      //"黑龙江省(全部地区）-黑龙江省(全部地区）",
	      "哈尔滨-哈尔滨",
	      "佳木斯-佳木斯",
	      "牡丹江-牡丹江",
	      "大庆-大庆",
	      "齐齐哈尔-齐齐哈尔",
	      "阿城-阿城",
	      "肇东-肇东",
	      "绥化-绥化",
	      "伊春-伊春",
	      "鹤岗-鹤岗",
	      "七台河-七台河",
	      "双鸭-双鸭",
	      "同江-同江",
	      "绥汾河-绥汾河",
	      "鸡西-鸡西",
	      "北安-北安",
	      "黑河-黑河",
	      "五大连池-五大连池"),
	    new Array(
	      //"河北省(全部地区）-河北省(全部地区）",
	      "石家庄-石家庄",
	      "邯郸-邯郸",
	      "保定-保定",
	      "张家口-张家口",
	      "秦皇岛-秦皇岛",
	      "辛集-辛集",
	      "邢台-邢台",
	      "泊头-泊头",
	      "唐山-唐山",
	      "北戴河-北戴河",
	      "廊坊-廊坊",
	      "定州-定州",
	      "南宫-南宫",
	      "衡水-衡水",
	      "沙河-沙河",
	      "沧州-沧州",
	      "任丘-任丘",
	      "承德-承德",
	      "涿州-涿州",
	      "其他-其他"),
	    new Array(
	      //"陕西省(全部地区）-陕西省(全部地区）",
	      "西安-西安",
	      "咸阳-咸阳",
	      "宝鸡-宝鸡",
	      "铜川-铜川",
	      "渭南-渭南",
	      "延安-延安",
	      "汉中 -汉中",
	      "韩城-韩城",
	      "其他-其他"),
	    new Array(
	      //"海南省(全部地区）-海南省(全部地区）",
	      "海口-海口",
	      "三亚-三亚",
	      "琼海-琼海",
	      "通什-通什",
	      "其他-其他"),
	    new Array(
	      //"河南省(全部地区）-河南省(全部地区）",
	      "郑州-郑州",
	      "洛阳-洛阳",
	      "开封-开封",
	      "鹤壁-鹤壁",
	      "焦作-焦作",
	      "许昌-许昌",
	      "驻马店-驻马店",
	      "周口-周口",
	      "新乡-新乡",
	      "安阳-安阳",
	      "濮阳-濮阳",
	      "漯河-漯河",
	      "信阳-信阳",
	      "平顶山-平顶山",
	      "三门峡-三门峡",
	      "南阳-南阳",
	      "商丘-商丘",
	      "义马 -义马",
	      "其他-其他"),
	    new Array(
	      //"山西省(全部地区）-山西省(全部地区）",
	      "太原-太原",
	      "大同-大同",
	      "忻州-忻州",
	      "临汾-临汾",
	      "运城-运城",
	      "长治-长治",
	      "榆次-榆次",
	      "侯马-侯马",
	      "阳泉-阳泉",
	      "晋城-晋城",
	      "其他-其他"),
	    new Array(
	      //"内蒙古自治区（全部地区）-内蒙古自治区（全部地区）",
	      "呼和浩特-呼和浩特",
	      "赤峰-赤峰",
	      "包头-包头",
	      "二连浩特-二连浩特",
	      "临河-临河",
	      "东胜-东胜",
	      "洲里-洲里",
	      "乌兰浩特-乌兰浩特",
	      "霍林郭勒-霍林郭勒",
	      "集宁-集宁",
	      "乌海-乌海",
	      "海拉尔-海拉尔",
	      "牙克石-牙克石",
	      "锡林浩特-锡林浩特",
	      "通辽-通辽",
	      "扎兰屯-扎兰屯",
	      "其他-其他"),
	    new Array(
	      //"广西壮族自治区（全部地区）-广西壮族自治区（全部地区）",
	      "南宁-南宁",
	      "桂林 -桂林",
	      "北海-北海",
	      "柳州-柳州",
	      "玉林-玉林",
	      "百色-百色",
	      "河池-河池",
	      "凭祥-凭祥",
	      "钦州-钦州",
	      "梧州-梧州",
	      "合山-合山",
	      "其他-其他"),
	    new Array(
	      //"贵州省（全部地区）-贵州省（全部地区）",
	      "贵阳-贵阳",
	      "遵义-遵义",
	      "铜仁-铜仁",
	      "都匀-都匀",
	      "兴义 -兴义",
	      "赤水-赤水",
	      "六盘水-六盘水",
	      "凯里-凯里",
	      "安顺-安顺",
	      "其他-其他"),
	    new Array(
	      //"宁夏回族自治区（全部地区）-宁夏回族自治区（全部地区）",
	      "银川-银川",
	      "青铜峡-青铜峡",
	      "吴忠-吴忠",
	      "石嘴山-石嘴山",
	      "其他-其他"),
	    new Array(
	      //"青海省（全部地区）-青海省（全部地区）",
	      "西宁-西宁",
	      "格尔木-格尔木",
	      "共和-共和",
	      "德令哈-德令哈",
	      "其他-其他"),
	    new Array(
	      //"疆维吾尔自治区（全部地区）-疆维吾尔自治区（全部地区）",
	      "乌鲁木齐-乌鲁木齐",
	      "石河子-石河子",
	      "拉玛依-拉玛依",
	      "博乐-博乐",
	      "塔城-塔城",
	      "阿勒泰-阿勒泰",
	      "哈密-哈密",
	      "阿克苏-阿克苏",
	      "阿图什-阿图什",
	      "昌吉-昌吉",
	      "奎屯-奎屯",
	      "伊宁-伊宁",
	      "吐鲁番-吐鲁番",
	      "库尔勒-库尔勒",
	      "喀什-喀什",
	      "和田-和田",
	      "其他-其他"),
	    new Array(
	      //"西藏自治区（全部地区）-西藏自治区（全部地区）",
	      "拉萨-拉萨",
	      "日喀则-日喀则",
	      "其他-其他"),
	    new Array(
	      //"甘肃省（全部地区）-甘肃省（全部地区）",
	      "兰州-兰州",
	      "酒泉-酒泉",
	      "临夏-临夏",
	      "张掖-张掖",
	      "峪关-峪关",
	      "金昌-金昌",
	      "平凉-平凉",
	      "白银-白银",
	      "武威-武威",
	      "玉门-玉门",
	      "天水-天水",
	      "西峰-西峰",
	      "其他-其他"),
	    new Array(
	      //"台湾省（全部地区）-台湾省（全部地区）",
	      "台北-台北",
	      "台中-台中",
	      "基隆-基隆",
	      "台南-台南",
	      "其他-其他"),
	    new Array("香港特别行政区-香港特别行政区"),
	    new Array("澳门特别行政区-澳门特别行政区"),
	    new Array("国外-国外")
	    );
</script>
</html>
