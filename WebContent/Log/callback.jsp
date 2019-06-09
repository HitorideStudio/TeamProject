<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="kr">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
</head>

<body>

	callback ó�����Դϴ�. �� ������������ callback�� ó���ϰ� �ٷ� main���� redirect�ϱ⶧���� �� �޽����� ���̸� �ȵ˴ϴ�.

	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


	<!-- (2) LoginWithNaverId Javscript ���� ���� �� �ʱ�ȭ -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "{trNOw1JZKuh2hg645_zG}",
				callbackUrl: "{http://localhost:8080/TeamProject/Log/callback.jsp}",
				isPopup: false,
				callbackHandle: true
				/* callback �������� �и��Ǿ��� ��쿡 callback ������������ callbackó���� ���ټ� �ֵ��� �����մϴ�. */
			}
		);

		/* (3) �׾Ʒ� �α��� ������ �ʱ�ȭ�ϱ� ���Ͽ� init�� ȣ�� */
		naverLogin.init();

		/* (4) Callback�� ó��. ���������� Callback ó���� �Ϸ�� ��� main page�� redirect(�Ǵ� Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) �ʼ������� �޾ƾ��ϴ� ������ ������ �ִٸ� callbackó�� ������ üũ */
					var email = naverLogin.user.getEmail();
					if( email == undefined || email == null) {
						alert("�̸����� �ʼ������Դϴ�. ���������� �������ּ���.");
						/* (5-1) ����� ���� �絿�Ǹ� ���Ͽ� �ٽ� �׾Ʒ� ������������ �̵��� */
						naverLogin.reprompt();
						return;
					}
					alert(email);

					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/TeamProject/Log/loginForm.jsp");
				} else {
					console.log("callback ó���� �����Ͽ����ϴ�.");
				}
			});
		});
	</script>
</body>

</html>