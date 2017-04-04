package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.CommentsDTO;
import com.entity.CommonPageDTO;
import com.entity.HashTagDTO;
import com.entity.PostDTO;
import com.entity.RecommendPageDTO;
import com.entity.UserInfoDTO;
import com.entity.UserStyleDTO;

public class Service {

	String namespace = "com.styleFollow.SqlMapper.";

	//중복 아이디 확인
	public int idCheck(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		int count = 0;
		
		try{
			count = session.selectOne(namespace+"idCheck", userid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return count;
	}
	
	//신규 회원 입력
	public void memberReg(UserInfoDTO userInfoDTO){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved userInfo: " + userInfoDTO.toString());
		
		try{
			session.insert(namespace+"memberReg", userInfoDTO);
			session.commit();
			System.out.println("memberReg complete\n");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	//회원 스타일 입력
	public void styleReg(UserStyleDTO userStyleDto){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved userStyle: " + userStyleDto.toString());
		
		try{
			session.insert(namespace+"styleReg", userStyleDto);
			session.commit();
			System.out.println("styleReg complete\n");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	//로그인
	public UserInfoDTO login(HashMap<String, String> map){
		SqlSession session = MySqlSessionFactory.openSession();
		UserInfoDTO userInfo = null;
		
		try{
			userInfo = session.selectOne(namespace+"login", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return userInfo;
	}
	
	public List<String> selectStyle(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		List<String> styleList = null;
		
		try{
			styleList = session.selectList(namespace+"selectStyle", userid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return styleList;
	}
	
	//사용자 포스팅
	public List<PostDTO> posts(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		
		try{
			postList = session.selectList(namespace+"posts", userid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postList;
	}
	
	//최근 올린 글의 인덱스
	public List<Integer> recentPostIdx(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		List<Integer> idxList = null;
		
		try {
			idxList = session.selectList(namespace+"recentPostIdx", userid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return idxList;
	}
	
	//DB에 저장된 모든 포스팅
	public List<PostDTO> allPosts(){
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		
		try{
			postList = session.selectList(namespace+"allPosts");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postList;
	}
	
	//새글 입력
	public void upload(PostDTO postDTO){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved post: " + postDTO.toString());
		
		try{
			session.insert(namespace+"upload", postDTO);
			session.commit();
			System.out.println("post upload complete\n");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	//포스팅별 댓글
	public List<CommentsDTO> comments(int postIdx){
		SqlSession session = MySqlSessionFactory.openSession();
		List<CommentsDTO> commentList = null;
		
		try{
			commentList = session.selectList(namespace+"comments", postIdx);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return commentList;
	}
	
	//댓글 입력
	public void uploadComment(CommentsDTO commentsDTO){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved comment: " + commentsDTO.toString());
		
		try{
			session.insert(namespace+"uploadComment", commentsDTO);
			session.commit();
			System.out.println("comment upload complete\n");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	//입력한 댓글 확인
	public List<CommentsDTO> selectPostedComment(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		List<CommentsDTO> commentList = null;
		
		try{
			commentList = session.selectList(namespace+"selectPostedComment", userid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return commentList;
	}
	
	//댓글이 달린 포스팅의 인덱스
	public int selectPostIdxByCmnt(int cmntIdx){
		SqlSession session = MySqlSessionFactory.openSession();
		int postIdx = 0;
		
		try{
			postIdx = session.selectOne(namespace+"selectPostIdxByCmnt", cmntIdx);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postIdx;
	}
	
	//댓글 수정
	public void modifyComment(CommentsDTO commentsDTO){
		System.out.println("comment will change to " + commentsDTO);
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.update(namespace+"modifyComment", commentsDTO);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	//수정한 댓글 확인
	public CommentsDTO selectModifiedComment(int cmntIdx){
		SqlSession session = MySqlSessionFactory.openSession();
		CommentsDTO commentsDTO = null;
		
		try{
			commentsDTO = session.selectOne(namespace+"selectModifiedComment", cmntIdx);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return commentsDTO;
	}
	
	//댓글삭제
	public void deleteComment(int cmntIdx){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.delete(namespace+"deleteComment", cmntIdx);
			session.commit();
		}catch(Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	//글 수정
	public void modifyContent(PostDTO postDTO){
		System.out.println("post will change to " + postDTO.toString());
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.update(namespace+"modifyContent", postDTO);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	//수정한 글 확인
	public PostDTO selectModifiedContent(int idx){
		SqlSession session = MySqlSessionFactory.openSession();
		PostDTO postDTO = null;
		
		try{
			postDTO = session.selectOne(namespace+"selectModifiedContent", idx);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postDTO;
	}
	
	//글삭제
	public void deleteContent(int idx){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.delete(namespace+"deleteContent", idx);
			session.commit();
		}catch(Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	//좋아요 개수 추출
	public int countLikes(int idx){
		SqlSession session = MySqlSessionFactory.openSession();
		int likes = 0;
		
		try {
			likes = session.selectOne(namespace+"countLikes", idx);
		}catch(Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
		return likes;
	}
	
	//좋아요 중복 체크
	public int checkLikes(HashMap<String, Object> map){
		SqlSession session = MySqlSessionFactory.openSession();
		int likes = 0;
		
		try {
			likes = session.selectOne(namespace+"checkLikes", map);
		}catch(Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
		return likes;
	}
	
	//좋아요 입력
	public void uploadLike(HashMap<String, Object> map){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.insert(namespace+"uploadLike", map);
			session.commit();
		}catch(Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	//해시태그 저장
	public void insertHashTag(HashTagDTO hashTagDTO){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.insert(namespace+"insertHashTag", hashTagDTO);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	//해시태그 저장
		public void insertHashTagByCmnt(HashTagDTO hashTagDTO){
			SqlSession session = MySqlSessionFactory.openSession();
			
			try {
				session.insert(namespace+"insertHashTagByCmnt", hashTagDTO);
				session.commit();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				session.close();
			}
		}
	
	//해시태그 삭제
	public void deleteHashTag(int idx){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.delete(namespace+"deleteHashTag", idx);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
	}
	
	//댓글에 적용된 해시태그 삭제
	public void deleteHashTagByCmnt(int cmntidx){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.delete(namespace+"deleteHashTagByCmnt", cmntidx);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
	}
	
	//해시태그로 검색
	public List<PostDTO> searchByHashTag(String hashtag){
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		
		try{
			postList = session.selectList(namespace+"searchByHashTag", hashtag);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postList;
	}
	
	public List<PostDTO> searchByGenderHashTag(HashMap<String, String> map){
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		
		try{
			postList = session.selectList(namespace+"searchByGenderHashTag", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postList;
	}
	
	//스타일로 검색
	public List<PostDTO> searchByStyle(String style){
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		
		try{
			postList = session.selectList(namespace+"searchByStyle", style);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postList;
	}
	
	public List<PostDTO> searchByGenderStyle(HashMap<String, String> map){
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		
		try{
			postList = session.selectList(namespace+"searchByGenderStyle", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postList;
	}
	
	public List<HashMap<String, Object>> recommendPosting(HashMap<String, Object> map){
		SqlSession session = MySqlSessionFactory.openSession();
		List<HashMap<String, Object>> resultList = null;
		
		try{
			resultList = session.selectList(namespace+"recommendPosting", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return resultList;
	}
	
	//사용자 포스팅 해시태그 검색
	public List<PostDTO> searchByHashTagForUser(HashMap<String, String> searchMap){
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		
		try{
			postList = session.selectList(namespace+"searchByHashTagForUser", searchMap);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postList;
	}
	
	//사용자 포스팅 스타일 검색
	public List<PostDTO> searchByStyleForUser(HashMap<String, String> searchMap){
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		
		try{
			postList = session.selectList(namespace+"searchByStyleForUser", searchMap);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postList;
	}
	
	/*
	 * Paging Service Method
	 */
	public CommonPageDTO postPage(int curPageNum){
		CommonPageDTO commonPageDTO = new CommonPageDTO();
		
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> list = null;
		int skip = (curPageNum-1) * commonPageDTO.getPerPage();
		
		try {
			list = session.selectList(namespace+"allPosts", null, new RowBounds(skip, commonPageDTO.getPerPage()));
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		
		commonPageDTO.setList(list);
		
		return commonPageDTO;
	}
	
	//전체 포스트 페이징처리
	public CommonPageDTO postsPaging(HashMap<String, Object> pagingMap){
		CommonPageDTO commonPageDTO = new CommonPageDTO();
		
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		String userid = (String)pagingMap.get("userid");
		String curPageNum = (String)pagingMap.get("curPageNum");
		int skip = (Integer.parseInt(curPageNum) -1 ) * commonPageDTO.getPerPage();
		
		try{
			postList = session.selectList(namespace+"posts", userid, new RowBounds(skip, commonPageDTO.getPerPage()));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		commonPageDTO.setList(postList);
		
		return commonPageDTO;
	}
	
	//추천페이지 페이징처리
	public RecommendPageDTO recommendPaging(HashMap<String, Object> pagingMap){
		RecommendPageDTO recommendPageDTO = new RecommendPageDTO();
		
		SqlSession session = MySqlSessionFactory.openSession();
		
		List<HashMap<String, Object>> resultList = null;
		HashMap<String, Object> map = (HashMap<String, Object>) pagingMap.get("map"); 
		String curPageNum = (String)pagingMap.get("curPageNum");
		int skip = (Integer.parseInt(curPageNum) - 1) * recommendPageDTO.getPerPage();
		
		try{
			resultList = session.selectList(namespace+"recommendPosting", map, new RowBounds(skip, recommendPageDTO.getPerPage()));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		recommendPageDTO.setResultList(resultList);
		
		return recommendPageDTO;
	}
	
	//검색창 스타일 검색 페이징 처리
	public CommonPageDTO searchByGenderStylePaging(HashMap<String, Object> pagingMap){
		CommonPageDTO commonPageDTO = new CommonPageDTO();
		
		SqlSession session = MySqlSessionFactory.openSession();
		
		List<PostDTO> postList = null;
		
		HashMap<String, String> searchMap = (HashMap<String, String>)pagingMap.get("searchMap");
		String curPageNum = (String)pagingMap.get("curPageNum");
		int skip = (Integer.parseInt(curPageNum) - 1) * commonPageDTO.getPerPage();
		
		try{
			postList = session.selectList(namespace+"searchByGenderStyle", searchMap, new RowBounds(skip, commonPageDTO.getPerPage()));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		commonPageDTO.setList(postList);
		
		return commonPageDTO;
	}
	
	//검색창 해시태그 검색 페이징 처리
	public CommonPageDTO searchByGenderHashTagPaging(HashMap<String, Object> pagingMap){
		CommonPageDTO commonPageDTO = new CommonPageDTO();
		
		SqlSession session = MySqlSessionFactory.openSession();
		
		List<PostDTO> postList = null;
		
		HashMap<String, String> searchMap = (HashMap<String, String>)pagingMap.get("searchMap");
		String curPageNum = (String)pagingMap.get("curPageNum");
		int skip = (Integer.parseInt(curPageNum) - 1) * commonPageDTO.getPerPage();
		
		try{
			postList = session.selectList(namespace+"searchByGenderHashTag", searchMap, new RowBounds(skip, commonPageDTO.getPerPage()));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		commonPageDTO.setList(postList);
		
		return commonPageDTO;
	}
	
	//해시태그 클릭 페이징 처리
	public CommonPageDTO searchByHashTagPaging(HashMap<String, String> pagingMap){
		CommonPageDTO commonPageDTO = new CommonPageDTO();
		
		SqlSession session = MySqlSessionFactory.openSession();
		
		List<PostDTO> postList = null;
		
		String hashtag = pagingMap.get("searchFor");
		String curPageNum = pagingMap.get("curPageNum");
		int skip = (Integer.parseInt(curPageNum) - 1) * commonPageDTO.getPerPage();
		
		try{
			postList = session.selectList(namespace+"searchByHashTag", hashtag, new RowBounds(skip, commonPageDTO.getPerPage()));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		commonPageDTO.setList(postList);
		
		return commonPageDTO;
	}
	
	//스타일 클릭 페이징 처리
	public CommonPageDTO searchByStylePaging(HashMap<String, String> pagingMap){
		CommonPageDTO commonPageDTO = new CommonPageDTO();
		
		SqlSession session = MySqlSessionFactory.openSession();
		
		List<PostDTO> postList = null;
		
		String style = pagingMap.get("searchFor");
		String curPageNum = pagingMap.get("curPageNum");
		int skip = (Integer.parseInt(curPageNum) - 1) * commonPageDTO.getPerPage();
		
		try{
			postList = session.selectList(namespace+"searchByStyle", style, new RowBounds(skip, commonPageDTO.getPerPage()));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		commonPageDTO.setList(postList);
		
		return commonPageDTO;
	}
	
	//사용자 페이지 해시태그 검색 페이징 처리
	public CommonPageDTO searchByHashTagForUserPaging(HashMap<String, Object> pagingMap){
		CommonPageDTO commonPageDTO = new CommonPageDTO();
		
		SqlSession session = MySqlSessionFactory.openSession();
		
		List<PostDTO> postList = null;
		
		HashMap<String, String> searchMap = (HashMap<String, String>)pagingMap.get("searchMap");
		String curPageNum = (String)pagingMap.get("curPageNum");
		int skip = (Integer.parseInt(curPageNum) - 1) * commonPageDTO.getPerPage();
		
		try{
			postList = session.selectList(namespace+"searchByHashTagForUser", searchMap, new RowBounds(skip, commonPageDTO.getPerPage()));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		commonPageDTO.setList(postList);
		
		return commonPageDTO;
	}
	
	//사용자 페이지 스타일 검색 페이징 처리
	public CommonPageDTO searchByStyleForUserPaging(HashMap<String, Object> pagingMap){
		CommonPageDTO commonPageDTO = new CommonPageDTO();
		
		SqlSession session = MySqlSessionFactory.openSession();
		
		List<PostDTO> postList = null;
		
		HashMap<String, String> searchMap = (HashMap<String, String>)pagingMap.get("searchMap");
		String curPageNum = (String)pagingMap.get("curPageNum");
		int skip = (Integer.parseInt(curPageNum) - 1) * commonPageDTO.getPerPage();
		
		try{
			postList = session.selectList(namespace+"searchByStyleForUser", searchMap, new RowBounds(skip, commonPageDTO.getPerPage()));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		commonPageDTO.setList(postList);
		
		return commonPageDTO;
	}
	
	//사용자 정보 수정을 위한 사용자 스타일 삭제
	public void styleDelete(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.delete(namespace+"styleDelete", userid);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	//페이스키를 가진 사용자가 있는지 확인
	public int isFbRegistered(String fbKey){
		SqlSession session = MySqlSessionFactory.openSession();
		
		int fbUserCount = 0;
		try {
			fbUserCount = session.selectOne(namespace+"isFbRegistered", fbKey);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		
		return fbUserCount;
	}
	
	//페이스북 로그인 신규 회원 입력
	public void fbMemberReg(UserInfoDTO userInfoDTO){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved userInfo: " + userInfoDTO.toString());
		
		try{
			session.insert(namespace+"fbMemberReg", userInfoDTO);
			session.commit();
			System.out.println("FB memberReg complete\n");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	//페이스북 로그인
	public UserInfoDTO fbLogin(String fbKey){
		SqlSession session = MySqlSessionFactory.openSession();
		UserInfoDTO userInfo = null;
			
		System.out.println(fbKey);
		try{
			userInfo = session.selectOne(namespace+"fbLogin", fbKey);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return userInfo;
	}
	
	//회원탈퇴
	public void memberDerag(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try{
			session.delete(namespace+"memberDerag", userid);
			session.commit();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
}
