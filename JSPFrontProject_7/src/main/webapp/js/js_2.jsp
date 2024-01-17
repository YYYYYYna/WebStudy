<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row {
    margin: 0px auto;
    width: 450px
}
</style>
<script type="text/javascript">
window.onload=function(){
    let btn=document.getElementById("calcBtn");
    btn.addEventListener('click',function(){
        // 1. 유효성 검사: 반드시 입력을 하도록
        let kor=document.getElementById("kor");
        if(kor.value.trim()==="") {
            kor.focus();
            return;
        }
        let eng=document.getElementById("eng");
        if(eng.value.trim()==="") {
            eng.focus();
            return;
        }
        let math=document.getElementById("math");
        if(math.value.trim()==="") {
            math.focus();
            return;
        }
        // 2. 총점 및 평균 계산
        let total = Number(kor.value) + Number(eng.value) + Number(math.value);
        let avg = total / 3;
        // 3. 결과 표시
        document.querySelector('#total').value = total;
        document.querySelector('#avg').value = avg.toFixed(2);
    });
}
</script>
</head>
<body>
    <div class="container">
        <div class="row">
            <h1>성적 계산</h1>
            <table class="table">
                <tr>
                    <td class="text-center" width="30%">국어</td>
                    <td width="70%">
                       <input type="text" id="kor" size=15 class="input-sm">
                    </td>
                </tr>
                
                <tr>
                    <td class="text-center" width="30%">영어</td>
                    <td width="70%">
                       <input type="text" id="eng" size=15 class="input-sm">
                    </td>
                </tr>
                
                <tr>
                    <td class="text-center" width="30%">수학</td>
                    <td width="70%">
                       <input type="text" id="math" size=15 class="input-sm">
                    </td>
                </tr>
                
                <tr>
                    <td class="text-center" width="30%">총점</td>
                    <td width="70%">
                       <input type="text" id="total" size=15 class="input-sm" readonly="readonly">
                    </td>
                </tr>
                
                <tr>
                    <td class="text-center" width="30%">평균</td>
                    <td width="70%">
                       <input type="text" id="avg" size=15 class="input-sm" readonly="readonly">
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2">
                       <input type="button" value="계산" class="btn-sm btn-primary text-center" id="calcBtn">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
