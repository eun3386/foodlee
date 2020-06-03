package com.fdl.foodlee.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fdl.foodlee.model.dao.inf.IOrderDAO;
import com.fdl.foodlee.model.vo.OrderVO;
import com.fdl.foodlee.service.inf.IOrderSVC;

@Service
public class OrderSVCImpl implements IOrderSVC {

	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	public static final String KEY = "0128503560659101";
	public static final String SECRET = "1qJGsdUsp7kVdDuUFbvzjvIYY4DZ6ES84BOxPJZfRka4XFZDQud90V8Y0MX6qQfvs42hN2xEmHJkmIXd";

	@Autowired
	private IOrderDAO orderDao;

	@Override
	public boolean memberNewOrder(OrderVO order) {
		return orderDao.memberNewOrder(order);
	}

	@Override
	public boolean memberOrderCancel(int orderId, String login) {
		return orderDao.memberOrderCancel(orderId, login);
	}

	@Override
	public List<OrderVO> memberOrderList(String login) {
		return orderDao.memberOrderList(login);
	}

	@Override
	public boolean sellerOrderReceipt(int orderId, int orderState) {
		return orderDao.sellerOrderReceipt(orderId, orderState);
	}

	@Override
	public boolean sellerOrderRejectionCancel(int orderId, int sellerId, int orderState, String reason) {
		return orderDao.sellerOrderRejectionCancel(orderId, sellerId, orderState, reason);
	}

	@Override
	public List<OrderVO> sellerOrderList(int sellerId) {
		return orderDao.sellerOrderList(sellerId);
	}

	@Override
	public OrderVO showOneOrder(int orderId) {
		return orderDao.showOneOrder(orderId);
	}
	
	@Override
	public String showOneMid(int orderId) {
		return orderDao.showOneMid(orderId);
	}

	// 아임포트 인증(토큰)을 받아주는 함수
	@Override
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	private List<NameValuePair> convertParameter(Map<String, String> paramMap) {
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for (Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}

	// 결제취소
	@Override
	public int cancelPayment(String token, String mid) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", mid);
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (asd.equals("null")) {
			System.err.println("환불실패");
			return -1;
		} else {
			System.err.println("환불성공");
			return 1;
		}
	}

	// 아임포트 결제정보를 조회해서 결제금액을 뽑아주는 함수
	public String getAmount(String token, String mId) {
		String amount = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + mId + "/paid");
		get.setHeader("Authorization", token);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode);
			JsonNode resNode = rootNode.get("response");
			amount = resNode.get("amount").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return amount;
	}

	// 아임포트 결제금액 변조를 방지하는 함수
	public String setHackCheck(String amount, String mId, String token) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
		Map<String, String> m = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		m.put("amount", amount);
		m.put("merchant_uid", mId);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode);
			return rootNode.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
