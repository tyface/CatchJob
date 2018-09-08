package com.CatchJob.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
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
            		resourceLoader.getResource(filePath).getInputStream(), "UTF-8"));
            
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
        result = result.replace("hostTemp", Constants.Config.HOST);
        result = result.replace("oauthIdTemp", mamberDao.selectById(email).getOauthId());
        return result;
	}

}
