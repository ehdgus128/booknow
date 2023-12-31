<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="mb-1 ">
    <div class="row">
        <div class="col-sm-6">
            <input type="text" class="form-control " placeholder="Email" aria-label="Email"
                   id="username">
        </div>
        <div class="col-sm-6 ms-0">
            <select class="form-select" aria-label="Default select example" id="freefix">
                <option selected>이메일 선택</option>
                <option value="@naver.com">@naver.com</option>
                <option value="@daum.net">@daum.net</option>
                <option value="@gmail.com">@gmail.com</option>
                <option value="@hamail.com">@hamail.com</option>
                <option value="@yahoo.com">@yahoo.com</option>
            </select>
        </div>
        <div class="col-sm-7 mt-3 me-3">
            <input class="form-control mail-check-input" placeholder="인증번호 "
                   disabled="disabled" maxlength="7" onkeyup="checkAuthNumFn()">
        </div>
        <div class="col-sm-3 mt-3 ">
            <input type="button" class="btn btn-primary" id="mail-Check-btn" value="메일인증">
        </div>
        <span id="mail-check-warn" class="mb-2"></span>
    </div>
</div>
		 
	
	
	
	
	
	</form>
	
	<script>

function checkAuthNumFn() {
    const mailCheckInput = document.querySelector('.mail-check-input').value;
    const mailCheckWarn = document.getElementById('mail-check-warn');
 
    console.log(mailCheckInput);
    console.log(mailCheckWarn);
    console.log(authNum);
 
    if (mailCheckInput != authNum) {
        mailCheckWarn.textContent = "  인증번호가 다릅니다.";
        mailCheckWarn.style.color = 'red';
        return;
    } else {
        mailCheckWarn.textContent = "  인증되었습니다.";
        mailCheckWarn.style.color = 'blue';
        authResult = true;
        return;
    }
}
const mailCheck = document.querySelector('#mail-Check-btn');

mailCheck.addEventListener("click", () => {
 
    const name = document.querySelector('#username').value;
    const freeFix = document.querySelector('#freefix').value;
 
    const email = name + freeFix;
    const user = {
        username: email
    }
 
    const url = "api/mailcheck";
    
    fetch(url, {
        method: "POST",
        body: JSON.stringify(user),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then((response) => response.json())
        .then((json) => {
 
            if (json !== null) {
                alert("인증메일이 전송 되었습니다.");
                authNum = json;
                console.log(authNum);
                document.querySelector('.mail-check-input').removeAttribute('disabled');
            } else {
                alert("인증메일 전송에 실패 하였습니다.");
            }
        });
});


</script>
</body>
</html>