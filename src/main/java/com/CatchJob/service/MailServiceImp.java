package com.CatchJob.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.MemberDao;

@Service
public class MailServiceImp implements MailService{

	@Autowired 
	private ResourceLoader resourceLoader;
	@Autowired
	private MemberDao mamberDao;
	
	@Override
	public String getMailTemplate(String email, String filePath){
        InputStream inputStream = null;
        String result = "";
        try {
        	String temp="";
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(
            		resourceLoader.getResource(filePath).getInputStream()));
            
            while((temp=bufferedReader.readLine())!=null) {
            	result +=temp;
            }
        } catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
	            if (inputStream != null) {
					inputStream.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
            }
        }
        result = result.replace("memberIdTemp", email);
        result = result.replace("oauthIdTemp", mamberDao.selectById(email).getOauthId());
        return result;
	}

//    public void regist(Member vo) throws Exception {
//        
//        System.out.println("서비스레지스");
//
//        String encPassword = passwordEncoder.encode(vo.getMemberPassword());
//        vo.setMemberPassword(encPassword);
//        //System.out.println("암호화된 비밀번호 : "+user.getUserPassword());
//
//        dao.insertUser(vo);
//        System.out.println(vo);
//        System.out.println("///////////////////////  찍히");
//        String key = new TempKey().getKey(50,false);  // 인증키 생성
//
//        dao.createAuthKey(vo.getMemberEmail(),key); //인증키 db 저장
//        //메일 전송
//        MailHandler sendMail = new MailHandler(mailSender);
//        sendMail.setSubject("FAINT  서비스 이메일 인증]");
//        sendMail.setText(
//                new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/user/emailConfirm?userEmail=").
//append(vo.getMemberEmail()).
//append("&memberAuthKey=").append(key).
//append("' target='_blank'>이메일 인증 확인</a>").toString());
//        sendMail.setFrom("sososososo@gmail.com", "서어비스센터 ");
//
//
//        sendMail.setTo(vo.getMemberEmail());
//        sendMail.send();
//    }
//
//    //이메일 인증 키 검증
//    public Member userAuth(Member user) throws Exception {
//        Member vo =new Member();
//        System.out.println(user+"user");
////        vo=dao.chkAuth(user);
//   
//        if(vo!=null){
//            try{
//                System.out.println(vo+"vo");
////                dao.userAuth(user);
////                dao.successAuth(vo);
//            }catch (Exception e) {
//                e.printStackTrace();
//            }}
//        return vo;
//    }
}
