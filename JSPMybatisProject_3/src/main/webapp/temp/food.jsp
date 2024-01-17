<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="http://unpkg.com/vue@3"></script>
    <script src="http://unpkg.com/axious/dist/axious.min.js"></script>
  </head>
  <body>
    <!-- <div class="app">
      <!--위의 msg값과 아래 msg값이 동시에 수정됨
      {{msg}}
      <br />
      <input type="text" size="20" v-model="msg" />
    </div> -->

    <!-- <div class="app">
        <table border="1" bordercolor="black">
            <thead>
                <tr>
                    <td>이름</td>
                    <td>나이</td>
                    <td>주소</td>
                </tr
            </thead>
            <tbody>
                <tr v-for="vo in msg"> <!--v-for=for each문
                    <td>{{vo.name}}</td>
                    <td>{{vo.age}}</td>
                    <td>{{vo.addr}}</td>
                </tr>
            </tbody>
        </table>
    </div> -->

    <div class="app">
        
    </div>
     
    <script>
      //Json 클래스 객체 생성
      const App = {
        data() {
          return {
            // msg: "Hello Vue CDN",
            // msg: [
            //   { name: "홍길동1", age: 20, addr: "서울" },
            //   { name: "홍길동2", age: 20, addr: "서울" },
            //   { name: "홍길동3", age: 20, addr: "서울" },
            //   { name: "홍길동4", age: 20, addr: "서울" },
            //   { name: "홍길동5", age: 20, addr: "서울" },
            // ],
            msg:[]
          };
        },
        mounted(){
            axios.get('../food/list.do').then(Response=>{
                this.msg=response.data
            })//get(실행).then(결과값받아오기:success와같은역할)
        }//mounted
      };
      Vue.createApp(App).mount(".app"); //클래스이름가져와서제어
      //가상 메모리에 올리기 = mount
    </script>
  </body>
</html>
