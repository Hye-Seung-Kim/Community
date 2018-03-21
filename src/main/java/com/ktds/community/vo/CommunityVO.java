package com.ktds.community.vo;

import java.io.File;
import java.io.IOException;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import com.ktds.member.vo.MemberVO;

public class CommunityVO {

	private int id;
	
	@NotEmpty(message="제목은 필수 입력입니다.")
	private String title;
	@NotEmpty(message="내용은 필수 입력입니다.")
	private String body;
/*	@NotEmpty(message="로그인이 필요합니다.")*/
	private int userId;
/*	@NotEmpty(message="작성일을 선택해 주세요.")*/
	private String writeDate;
	
	private int viewCount;
	private int recommendCount;
	private String requestIp;
	private MultipartFile file; //이 파일은 디스크 저장 파일은 아님. 만들어지는 건X
	private String displayFilename;
	
	private MemberVO memberVO;
	
	
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
	
	
	//위에 만들고 Source내 getters setters 해버림.
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
