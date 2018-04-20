package com.hstravel.community.vo;

import java.io.File;
import java.io.IOException;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import com.hstravel.member.vo.MemberVO;

public class CommunityVO {

	private int id;
	
	@NotEmpty(message="제목은 필수 입력입니다.")
	private String title;
	@NotEmpty(message="내용은 필수 입력입니다.")
	private String body;
	private int userId;
	private String writeDate;
	
	private int viewCount;
	private int recommendCount;
	private String requestIp;
	private MultipartFile file;
	private String displayFilename;
	
	private MemberVO memberVO;
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTransportation() {
		return transportation;
	}

	public void setTransportation(String transportation) {
		this.transportation = transportation;
	}

	public String getExpense() {
		return expense;
	}

	public void setExpense(String expense) {
		this.expense = expense;
	}

	public String getAccommodations() {
		return accommodations;
	}

	public void setAccommodations(String accommodations) {
		this.accommodations = accommodations;
	}

	public String getLuggage() {
		return luggage;
	}

	public void setLuggage(String luggage) {
		this.luggage = luggage;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}
	private String category;
	@NotEmpty(message="장소를 입력해주세요.")
	private String location;
	@NotEmpty(message="교통을 입력해주세요.")
	private String transportation;
	@NotEmpty(message="경비를 입력해주세요.")
	private String expense;
	//여행 숙소
	@NotEmpty(message="숙소를 입력해주세요.")
	private String accommodations;
	//여행 준비물
	@NotEmpty(message="준비물을 입력해주세요.")
	private String luggage;
	@NotEmpty(message="여행경로를 입력해주세요.")
	private String route;
	
	
	
	
	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getDisplayFilename() {
		if( displayFilename == null ) {
			displayFilename = "";
		}
		return displayFilename;
	}

	public void setDisplayFilename(String displayFilename) {
		this.displayFilename = displayFilename;
	}

	public MultipartFile getFile() {
		return file;
	}
	
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String save() {
		
		if( file != null && !file.isEmpty() ) {
			
			displayFilename = file.getOriginalFilename();
			
			File newFile = new File("d:/uploadFiles/"+file.getOriginalFilename());
			
				try {
					file.transferTo(newFile);
					return newFile.getAbsolutePath();
				} catch (IllegalStateException e) {
					throw new RuntimeException(e.getMessage(),e);
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(),e);
				}
			
		}
		return null;
	}
	
	public String getRequestIp() {
		return requestIp;
	}
	public void setRequestIp(String requestIp) {
		this.requestIp = requestIp;
	}
	public int getRecommendCount() {
		return recommendCount;
	}
	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setBody(String body) {
		this.body = body;
	}


	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String wirteDate) {
		this.writeDate = wirteDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	
	
}
