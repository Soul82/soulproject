<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<header>
<div id="reg" align="center">
   <img src="/img/4.png" style="width: 130px; padding-bottom: 20px;" />

   <form id="reg_form" style="width: 700px; border: black solid 1px; border-radius: 1em" action="/member/memUp">
      <h2 align="left">ȸ�� ���� ����</h2>
      <div align="left">
         <p>
            <label>����</label> <input type="text" id="img" name="img" placeholder="������ü" required />
         </p>
         <p>
            <label>���̵�</label>&nbsp;&nbsp;<b>${data.ID}</b>
            <span id="rst"></span>                                              
         </p>
         <p>
            <label>��й�ȣ</label> 
            <input type="password" id="pass" name="pass" placeholder="��й�ȣ" required /> 
            <input type="password" id="pass2" placeholder="��й�ȣȮ��" disabled="disabled" required />
         </p>
         <span id="rst2"></span>
         <p>
            <label>�̸�</label> &nbsp;&nbsp;<b>${data.NAME}</b>
              </p>
         <p>
            <label>����</label> &nbsp;&nbsp;<b>${data.GENDER}</b>
            
         </p>
         <p>
            <label>�������</label>&nbsp;&nbsp;<b>${data.BIRTH}</b>
           
         <p>
            <label>�̸���</label>
            <input type="email" id="mail" name="mail" placeholder="E-mail�Է�" required />
         </p>
         <!-- 
         <p id="accept">
         <input id="accept_terms" name="accept_terms" type="checkbox" />
         <label for="accept_terms">
            <strong>
            <a href="#" rel="external" target="_blank">���� �̿� ���</a>, 
            <a href="#" rel="external" target="_blank">���� ���� ���� �̿�</a>�� ����</strong>�մϴ�.
         </label>
         </p>
         -->          
      </div>
      <p>
         <button id="reg_new" type="submit">�����ϱ�</button>
      </p>
   </form>

</div>
</header>