package com.CatchJob.service;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class ImageProxyService {
	
	public void imageProxy(HttpServletRequest req,HttpServletResponse repo) {
		try {
	        String url = req.getParameter("url");
	        HttpClient httpClient = new DefaultHttpClient();
	        HttpGet httpGet = new HttpGet(url);
	        HttpResponse httpResponse = httpClient.execute(httpGet);
	        HttpEntity httpEntity = httpResponse.getEntity();
	        InputStream inputStream = httpEntity.getContent();
	        repo.setContentType("image/jpeg");
	        IOUtils.copy(inputStream, repo.getOutputStream());
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
}
