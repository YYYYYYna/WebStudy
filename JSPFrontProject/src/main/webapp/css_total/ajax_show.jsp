<%-- 선택한 input에 따라 하위 input이 다르게 나오는 코드 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

function typeFn() {

$("#resv_program").attr("disabled",true);
 
if($("select[name=resv_program_type] > option:selected").val() == "2"){
$("#programTr").show();
$("#resv_program > option").remove();
$("#resv_program").attr("disabled",true);
$("#resv_program").append("<option value=\"\">--선택--</option>");
 
var type = $("#resv_program_type").val();
 
var submitObj = new Object();
submitObj.prgm_type= type;
 
$.ajax({ 
      url: path+"/gnb03/lnb02/select_ajax.do", 
      type: "POST", 
      contentType: "application/json;charset=UTF-8",
      data:JSON.stringify(submitObj),
      dataType : "json",
      progress: true
     }) 
     .done(function(data) {

$('#resv_program').children('option:not(:first)').remove();
        
        var laborOption = "";
        for(var k in data.programList){
          var obj = data.programList[k];
          var prgm_name = obj.prgm_name;
          var prgm_idx = obj.prgm_idx;
          
          laborOption = "<option value='" + prgm_idx + "'>" + prgm_name + "</option>";
          $("#resv_program").append(laborOption);
      }

$("#resv_program").attr("disabled",false);

        
     }) 
     .fail(function(e) {  
         alert("FAIL - "+e);
     }) 
     .always(function() { 
      $("#resv_program").attr("disabled",false);
     }); 
}
}

</script>
<script type="text/javascript">

@RequestMapping(value = "/gnb03/lnb02/select_ajax.do")
@ResponseBody
public String select_ajax(
        @RequestBody String filterJSON,
        HttpServletResponse response,
    ModelMap model ) throws Exception {
 
JSONObject obj = new JSONObject();
List<tbl_programVO> programList  = null;
response.setContentType("text/html; charset=UTF-8");
PrintWriter out = response.getWriter();
 
try{            
    ObjectMapper mapper = new ObjectMapper();
    tbl_programVO searchVO = (tbl_programVO)mapper.readValue(filterJSON,new TypeReference<tbl_programVO>(){ });
    
    programList = programService.getSelectList(searchVO);
    
    obj.put("programList", programList);
    
}catch(Exception e){
    System.out.println(e.toString());
    obj.put("res", "error");
    
    }
 
out.print(obj);
return null;
}

</script>
</head>
<body>
	<table>

		<tr>
			<th class="active" style="text-align: right"><label
				class="control-label" for=""> <span class="ftcdanger">*</span>관람
					선택
			</label></th>
			<td><select name="resv_program_type" id="resv_program_type"
				class="form-control" style="width: 500px" onchange="typeFn();"/>
					<option value="">--선택--</option>
					<option value="1">전시관</option>
					<option value="2">프로그램</option>
			</select></td>
		</tr>
		<tr id="programTr" style="display: none;">
			<th class="active" style="text-align: right"><label
				class="control-label" for=""><span class="ftcdanger">*</span>프로그램
					선택</label></th>
			<td><select name="resv_program" id="resv_program"
				class="form-control" style="width: 500px" /> </select></td>
		</tr>
	</table>
</body>
</html>