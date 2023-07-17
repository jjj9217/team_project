package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import common.DBConnectionPool;
import vo.AllBoardReplyVo;
import vo.AllBoardVo;
import vo.FreeBoardVo;
import vo.ReviewBoardReplyVo;

@Repository
public class AllBoardDao extends DBConnectionPool {
	
	//검색 조건에 맞는 게시물 수를 반환하는 메소드
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;//총 게시물 수 반환값
		
		String searchWord, searchField, searchTotal, sql;
		searchWord = searchField = searchTotal = sql = null;
		
		try {
			
			if(map.size() != 0) {				
				searchTotal = (String)map.get("searchTotal");
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchTotal != null) {
					sql = "select count(*) as row_count "
							+ "from ( "
							+ "select * from free_board "
							+ "where board_idx IN (  "
							+ "select board_idx from free_board_reply "
							+ "where content like '%'||?||'%') "
							+ "or title like '%'||?||'%' "
							+ "OR content LIKE '%' ||?|| '%' "
							+ "OR member_nickname LIKE '%' ||?|| '%' "
							+ "UNION "
							+ "select * from oneline_board "
							+ "where board_idx IN (  "
							+ "select board_idx from oneline_board_reply "
							+ "where content like '%'||?||'%') "
							+ "or title like '%'||?||'%' "
							+ "OR content LIKE '%' ||?|| '%' "
							+ "OR member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from review_board "
							+ "where board_idx IN (  "
							+ "select board_idx from review_board_reply "
							+ "where content like '%'||?||'%') "
							+ "or title like '%'||?||'%' "
							+ "OR content LIKE '%' ||?|| '%' "
							+ "OR member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from question_board "
							+ "where board_idx IN (  "
							+ "select board_idx from question_board_reply "
							+ "where content like '%'||?||'%') "
							+ "or title like '%'||?||'%' "
							+ "OR content LIKE '%' ||?|| '%' "
							+ "OR member_nickname LIKE '%' ||?|| '%')";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<17; i++) {
						pstmt.setString(i, searchTotal);						
					}					
				} else if(searchField.equals("content")){
					sql = "select count(*) as row_count "
							+ "from ( "
							+ "select * from free_board "
							+ "where content LIKE '%' ||?|| '%' "
							+ "UNION "
							+ "select * from oneline_board "
							+ "where content LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from review_board "
							+ "where content LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from question_board "
							+ "where content LIKE '%' ||?|| '%' )";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);						
					}				
				}else if(searchField.equals("title")) {
					sql = "select count(*) as row_count "
							+ "from ( "
							+ "select * from free_board "
							+ "where title LIKE '%' ||?|| '%' "
							+ "UNION "
							+ "select * from oneline_board "
							+ "where title LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from review_board "
							+ "where title LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from question_board "
							+ "where title LIKE '%' ||?|| '%' )";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);						
					}		
				}else if(searchField.equals("nickname")) {
					sql = "select count(*) as row_count "
							+ "from ( "
							+ "select * from free_board "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "UNION "
							+ "select * from oneline_board "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from review_board "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from question_board "
							+ "where member_nickname LIKE '%' ||?|| '%' )";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);						
					}		
				}else if(searchField.equals("reply")){
					sql = "select count(*) as row_count "
							+ "from ( "
							+ "select * from free_board "
							+ "where board_idx IN ( "
							+ "select board_idx from free_board_reply "
							+ "where content like '%'||?||'%') "
							+ "UNION "
							+ "select * from oneline_board "
							+ "where board_idx IN ( "
							+ "select board_idx from oneline_board_reply "
							+ "where content like '%'||?||'%') "
							+ "union "
							+ "select * from review_board "
							+ "where board_idx IN ( "
							+ "select board_idx from review_board_reply "
							+ "where content like '%'||?||'%') "
							+ "union "
							+ "select * from question_board "
							+ "where board_idx IN ( "
							+ "select board_idx from question_board_reply "
							+ "where content like '%'||?||'%') )";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);						
					}		
				}
								
			} else {				
				sql = "select count(*) as row_count "
						+ "from ( "
						+ "select * from free_board "
						+ "UNION "
						+ "select * from oneline_board "
						+ "union "
						+ "select * from review_board "
						+ "union "
						+ "select * from question_board)";
				pstmt = conn.prepareStatement(sql);
			}		
				
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}
	
	//검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<AllBoardVo> selectList(Map<String, Object> map) {
		List<AllBoardVo> boardList = new ArrayList<AllBoardVo>();
		
		String searchWord, searchField, searchTotal, sql;
		searchWord = searchField = searchTotal = sql = null;
		
		try {
			
			if(map.size() != 0) {
				searchTotal = (String)map.get("searchTotal");
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchTotal != null) {
					sql = "select * from ( select * from free_board "
							+ "where board_idx IN (  "
							+ "select board_idx from free_board_reply "
							+ "where content like '%'||?||'%') "
							+ "or title like '%'||?||'%' "
							+ "OR content LIKE '%' ||?|| '%' "
							+ "OR member_nickname LIKE '%' ||?|| '%' "
							+ "UNION "
							+ "select * from oneline_board "
							+ "where board_idx IN (  "
							+ "select board_idx from oneline_board_reply "
							+ "where content like '%'||?||'%') "
							+ "or title like '%'||?||'%' "
							+ "OR content LIKE '%' ||?|| '%' "
							+ "OR member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from review_board "
							+ "where board_idx IN (  "
							+ "select board_idx from review_board_reply "
							+ "where content like '%'||?||'%') "
							+ "or title like '%'||?||'%' "
							+ "OR content LIKE '%' ||?|| '%' "
							+ "OR member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from question_board "
							+ "where board_idx IN (  "
							+ "select board_idx from question_board_reply "
							+ "where content like '%'||?||'%') "
							+ "or title like '%'||?||'%' "
							+ "OR content LIKE '%' ||?|| '%' "
							+ "OR member_nickname LIKE '%' ||?|| '%'"
							+ ") ORDER BY all_board_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<17; i++) {
						pstmt.setString(i, searchTotal);						
					}							
				} else if(searchField.equals("content")){
					sql = "select * from ( select * from free_board "
							+ "where content LIKE '%' ||?|| '%' "
							+ "UNION "
							+ "select * from oneline_board "
							+ "where content LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from review_board "
							+ "where content LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from question_board "
							+ "where content LIKE '%' ||?|| '%' "
							+ ") ORDER BY all_board_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);						
					}		
				}else if(searchField.equals("title")) {
					sql = "select * from ( select * from free_board "
							+ "where title LIKE '%' ||?|| '%' "
							+ "UNION "
							+ "select * from oneline_board "
							+ "where title LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from review_board "
							+ "where title LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from question_board "
							+ "where title LIKE '%' ||?|| '%' "
							+ ") ORDER BY all_board_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);						
					}		
				}else if(searchField.equals("nickname")) {
					sql = "select * from ( select * from free_board "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "UNION "
							+ "select * from oneline_board "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from review_board "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from question_board "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ ") ORDER BY all_board_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);						
					}		
				}else {
					sql = "select * from ( select * from free_board "
							+ "where board_idx IN ( "
							+ "select board_idx from free_board_reply "
							+ "where content like '%'||?||'%') "
							+ "UNION "
							+ "select * from oneline_board "
							+ "where board_idx IN ( "
							+ "select board_idx from oneline_board_reply "
							+ "where content like '%'||?||'%') "
							+ "union "
							+ "select * from review_board "
							+ "where board_idx IN ( "
							+ "select board_idx from review_board_reply "
							+ "where content like '%'||?||'%') "
							+ "union "
							+ "select * from question_board "
							+ "where board_idx IN ( "
							+ "select board_idx from question_board_reply "
							+ "where content like '%'||?||'%') "
							+ ") ORDER BY all_board_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);						
					}		
				}
				
			}else {
				sql = "select * from (select * from free_board "
						+ "UNION "
						+ "select * from oneline_board "
						+ "union "
						+ "select * from review_board "
						+ "union "
						+ "select * from question_board"
						+ ") ORDER BY all_board_number desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			//PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
			//--MySQL sql문에서는 like ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로
			//  작성함
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AllBoardVo vo = new AllBoardVo();
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setAll_board_number(rs.getInt("all_board_number"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				
				if(rs.getString("originfile") != null) {
				vo.setOriginFile(rs.getString("originfile"));//원본파일명
				vo.setSaveFile(rs.getString("savefile"));//저장파일명
				}
				
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setMember_nickname(rs.getString("member_nickname"));
				vo.setRecommendation_count(rs.getInt("recommendation_count"));
				vo.setReply_count(rs.getInt("reply_count"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setBoard_initial(rs.getString("board_initial"));
				
				boardList.add(vo);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return boardList;
	}
	
	public int selectMycontentCount(Map<String, Object> map) {
		int totalCount = 0;//총 게시물 수 반환값
		
		String searchWord, searchField, memberNickname, sql;
		memberNickname = searchWord = searchField = sql = null;
		
		try {
			
			if(map.size() != 0) {				
				memberNickname = (String)map.get("memberNickname");
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField == null) {
					sql = "select count(*) as row_count\r\n"
							+ "from ( \r\n"
							+ "select * from free_board \r\n"
							+ "where member_nickname = ?\r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board \r\n"
							+ "where member_nickname = ?\r\n"
							+ "union \r\n"
							+ "select * from review_board \r\n"
							+ "where member_nickname = ?\r\n"
							+ "union \r\n"
							+ "select * from question_board\r\n"
							+ "where member_nickname = ?)";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, memberNickname);	
					}	
				}else if(searchField.equals("content")){
					sql = "select count(*) as row_count\r\n"
							+ "from ( \r\n"
							+ "select * from free_board\r\n"
							+ "where content LIKE '%' ||?|| '%' \r\n"
							+ "and member_nickname = ?\r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board \r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from review_board\r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from question_board\r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?)";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<9; i++) {
						if(i%2 != 0) {
							pstmt.setString(i, searchWord);								
						}else {
							pstmt.setString(i, memberNickname);								
						}
					}				
				}else if(searchField.equals("title")) {
					sql = "select count(*) as row_count\r\n"
							+ "from ( \r\n"
							+ "select * from free_board \r\n"
							+ "where title LIKE '%' ||?|| '%' \r\n"
							+ "and member_nickname = ?\r\n"
							+ "UNION\r\n"
							+ "select * from oneline_board\r\n"
							+ "where title LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?\r\n"
							+ "union \r\n"
							+ "select * from review_board \r\n"
							+ "where title LIKE '%' ||?|| '%' \r\n"
							+ "and member_nickname = ?\r\n"
							+ "union \r\n"
							+ "select * from question_board \r\n"
							+ "where title LIKE '%' ||?|| '%' \r\n"
							+ "and member_nickname = ?)";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<9; i++) {
						if(i%2 != 0) {
							pstmt.setString(i, searchWord);								
						}else {
							pstmt.setString(i, memberNickname);								
						}
					}				
				}else if(searchField.equals("reply")){
					sql = "select count(*) as row_count\r\n"
							+ "from ( \r\n"
							+ "select * from free_board \r\n"
							+ "where board_idx IN ( \r\n"
							+ "select board_idx from free_board_reply \r\n"
							+ "where content like '%'||?||'%' \r\n"
							+ "and member_nickname = ?) \r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board \r\n"
							+ "where board_idx IN ( \r\n"
							+ "select board_idx from oneline_board_reply \r\n"
							+ "where content like '%'||?||'%' \r\n"
							+ "and member_nickname = ?) \r\n"
							+ "union \r\n"
							+ "select * from review_board\r\n"
							+ "where board_idx IN ( \r\n"
							+ "select board_idx from review_board_reply \r\n"
							+ "where content like '%'||?||'%' \r\n"
							+ "and member_nickname = ?) \r\n"
							+ "union \r\n"
							+ "select * from question_board \r\n"
							+ "where board_idx IN ( \r\n"
							+ "select board_idx from question_board_reply \r\n"
							+ "where content like '%'||?||'%' \r\n"
							+ "and member_nickname = ?) )";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<9; i++) {
						if(i%2 != 0) {
							pstmt.setString(i, searchWord);								
						}else {
							pstmt.setString(i, memberNickname);								
						}
					}		
				}
								
			} 
				
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생1");
			e.printStackTrace();
		}

		return totalCount;
	}
	
	public List<AllBoardVo> selectMycontentList(Map<String, Object> map) {
		List<AllBoardVo> boardList = new ArrayList<AllBoardVo>();
		
		String searchWord, searchField, memberNickname, sql;
		searchWord = searchField = memberNickname = sql = null;
		
		try {
			
			if(map.size() != 0) {
				memberNickname = (String)map.get("memberNickname");
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField == null) {
					sql = "select * from ( select * from free_board\r\n"
							+ "where member_nickname = ? \r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board\r\n"
							+ "where member_nickname = ? \r\n"
							+ "union \r\n"
							+ "select * from review_board\r\n"
							+ "where member_nickname = ? \r\n"
							+ "union \r\n"
							+ "select * from question_board\r\n"
							+ "where member_nickname = ? "
							+ ") ORDER BY all_board_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, memberNickname);	
					}
				} else if(searchField.equals("content")){
					sql = "select * from ( select * from free_board \r\n"
							+ "where content LIKE '%' ||?|| '%' \r\n"
							+ "and member_nickname = ?\r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board\r\n"
							+ "where content LIKE '%' ||?|| '%' \r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from review_board\r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from question_board\r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?"
							+ ") ORDER BY all_board_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<9; i++) {
						if(i%2 != 0) {
							pstmt.setString(i, searchWord);								
						}else {
							pstmt.setString(i, memberNickname);								
						}
					}		
				}else if(searchField.equals("title")) {
					sql = "select * from ( select * from free_board\r\n"
							+ "where title LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from oneline_board\r\n"
							+ "where title LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from review_board\r\n"
							+ "where title LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from question_board\r\n"
							+ "where title LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?"
							+ ") ORDER BY all_board_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<9; i++) {
						if(i%2 != 0) {
							pstmt.setString(i, searchWord);								
						}else {
							pstmt.setString(i, memberNickname);								
						}
					}		
				}else if(searchField.equals("reply")){
					sql = "select * from ( select * from free_board\r\n"
							+ "where board_idx IN ( \r\n"
							+ "select board_idx from free_board_reply \r\n"
							+ "where content like '%'||?||'%'\r\n"
							+ "and member_nickname = ?) \r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board \r\n"
							+ "where board_idx IN ( \r\n"
							+ "select board_idx from oneline_board_reply \r\n"
							+ "where content like '%'||?||'%' \r\n"
							+ "and member_nickname = ?) \r\n"
							+ "union \r\n"
							+ "select * from review_board \r\n"
							+ "where board_idx IN ( \r\n"
							+ "select board_idx from review_board_reply \r\n"
							+ "where content like '%'||?||'%' \r\n"
							+ "and member_nickname = ?) \r\n"
							+ "union \r\n"
							+ "select * from question_board \r\n"
							+ "where board_idx IN ( \r\n"
							+ "select board_idx from question_board_reply \r\n"
							+ "where content like '%'||?||'%' \r\n"
							+ "and member_nickname = ?) "
							+ ") ORDER BY all_board_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<9; i++) {
						if(i%2 != 0) {
							pstmt.setString(i, searchWord);								
						}else {
							pstmt.setString(i, memberNickname);								
						}
					}			
				} 
				
			}
			
			//PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
			//--MySQL sql문에서는 like ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로
			//  작성함
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AllBoardVo vo = new AllBoardVo();
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setAll_board_number(rs.getInt("all_board_number"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				
				if(rs.getString("originfile") != null) {
				vo.setOriginFile(rs.getString("originfile"));//원본파일명
				vo.setSaveFile(rs.getString("savefile"));//저장파일명
				}
				
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setMember_nickname(rs.getString("member_nickname"));
				vo.setRecommendation_count(rs.getInt("recommendation_count"));
				vo.setReply_count(rs.getInt("reply_count"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setBoard_initial(rs.getString("board_initial"));
				
				boardList.add(vo);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생2");
			e.printStackTrace();
		}

		return boardList;
	}
	
	//작성댓글보기 카운트
	public int selectMyreplyCount(Map<String, Object> map) {
		int totalCount = 0;//총 게시물 수 반환값
		
		String searchWord, searchField, memberNickname, sql;
		memberNickname = searchWord = searchField = sql = null;
		
		try {
			
			if(map.size() != 0) {				
				memberNickname = (String)map.get("memberNickname");
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField == null) {
					sql = "select count(*) as row_count\r\n"
							+ "from ( \r\n"
							+ "select * from free_board_reply \r\n"
							+ "where member_nickname = ?\r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board_reply \r\n"
							+ "where member_nickname = ?\r\n"
							+ "union \r\n"
							+ "select * from review_board_reply \r\n"
							+ "where member_nickname = ?\r\n"
							+ "union \r\n"
							+ "select * from question_board_reply\r\n"
							+ "where member_nickname = ?)";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, memberNickname);	
					}	
				}else if(searchField.equals("content")){
					sql = "select count(*) as row_count\r\n"
							+ "from ( \r\n"
							+ "select * from free_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%' \r\n"
							+ "and member_nickname = ?\r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board_reply \r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from review_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from question_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?)";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<9; i++) {
						if(i%2 != 0) {
							pstmt.setString(i, searchWord);								
						}else {
							pstmt.setString(i, memberNickname);								
						}
					}				
				}								
			} 
				
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생1");
			e.printStackTrace();
		}

		return totalCount;
	}
	
	//작성댓글보기리스트
	public List<AllBoardReplyVo> selectMyreplyList(Map<String, Object> map) {
		List<AllBoardReplyVo> boardList = new ArrayList<AllBoardReplyVo>();
		
		String searchWord, searchField, memberNickname, sql;
		searchWord = searchField = memberNickname = sql = null;
		
		try {
			
			if(map.size() != 0) {
				memberNickname = (String)map.get("memberNickname");
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField == null) {
					sql = "select * from ( select * from free_board_reply\r\n"
							+ "where member_nickname = ? \r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board_reply\r\n"
							+ "where member_nickname = ? \r\n"
							+ "union \r\n"
							+ "select * from review_board_reply\r\n"
							+ "where member_nickname = ? \r\n"
							+ "union \r\n"
							+ "select * from question_board_reply\r\n"
							+ "where member_nickname = ? "
							+ ") ORDER BY all_reply_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, memberNickname);	
					}
				} else if(searchField.equals("content")){
					sql = "select * from ( select * from free_board_reply \r\n"
							+ "where content LIKE '%' ||?|| '%' \r\n"
							+ "and member_nickname = ?\r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%' \r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from review_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?\r\n"
							+ "union\r\n"
							+ "select * from question_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "and member_nickname = ?"
							+ ") ORDER BY all_reply_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<9; i++) {
						if(i%2 != 0) {
							pstmt.setString(i, searchWord);								
						}else {
							pstmt.setString(i, memberNickname);								
						}
					}		
				}				
			}
			
			//PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
			//--MySQL sql문에서는 like ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로
			//  작성함
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AllBoardReplyVo vo = new AllBoardReplyVo();
				vo.setReply_idx(rs.getInt("reply_idx"));
				vo.setAll_reply_number(rs.getInt("all_reply_number"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setMember_nickname(rs.getString("member_nickname"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setBoard_initial(rs.getString("board_initial"));
				
				boardList.add(vo);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생2");
			e.printStackTrace();
		}

		return boardList;
	}
	
	//모든댓글보기 카운트
	public int selectReplyCount(Map<String, Object> map) {
		int totalCount = 0;//총 게시물 수 반환값
		
		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		
		try {
			
			if(map.size() != 0) {				
				
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField.equals("content")){
					sql = "select count(*) as row_count\r\n"
							+ "from ( \r\n"
							+ "select * from free_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%' \r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board_reply \r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "union\r\n"
							+ "select * from review_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "union\r\n"
							+ "select * from question_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%' )";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);								
					}				
				} else if(searchField.equals("nickname")) {
					sql = "select count(*) as row_count "
							+ "from ( "
							+ "select * from free_board_reply "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "UNION "
							+ "select * from oneline_board_reply "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from review_board_reply "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from question_board_reply "
							+ "where member_nickname LIKE '%' ||?|| '%' )";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);						
					}		
				}
			} else {
				sql = "select count(*) as row_count\r\n"
						+ "from ( \r\n"
						+ "select * from free_board_reply\r\n"
						+ "UNION \r\n"
						+ "select * from oneline_board_reply \r\n"
						+ "union\r\n"
						+ "select * from review_board_reply\r\n"
						+ "union\r\n"
						+ "select * from question_board_reply )";
				pstmt = conn.prepareStatement(sql);
			}
				
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생1");
			e.printStackTrace();
		}

		return totalCount;
	}
	
	//모든댓글보기리스트
	public List<AllBoardReplyVo> selectReplyList(Map<String, Object> map) {
		List<AllBoardReplyVo> boardList = new ArrayList<AllBoardReplyVo>();
		
		String searchWord, searchField, sql;
		searchWord = searchField = sql = null;
		
		try {
			
			if(map.size() != 0) {
				searchWord = (String)map.get("searchWord");
				searchField = (String)map.get("searchField");
				
				if(searchField.equals("content")){
					sql = "select * from ( select * from free_board_reply \r\n"
							+ "where content LIKE '%' ||?|| '%' \r\n"
							+ "UNION \r\n"
							+ "select * from oneline_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%' \r\n"
							+ "union\r\n"
							+ "select * from review_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%'\r\n"
							+ "union\r\n"
							+ "select * from question_board_reply\r\n"
							+ "where content LIKE '%' ||?|| '%'"
							+ ") ORDER BY all_reply_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);								
						
					}		
				} else if(searchField.equals("nickname")) {
					sql = "select * from ( select * from free_board_reply "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "UNION "
							+ "select * from oneline_board_reply "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from review_board_reply "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ "union "
							+ "select * from question_board_reply "
							+ "where member_nickname LIKE '%' ||?|| '%' "
							+ ") ORDER BY all_reply_number desc";
					pstmt = conn.prepareStatement(sql);
					for(int i=1; i<5; i++) {
						pstmt.setString(i, searchWord);						
					}		
				}
			} else {
				sql = "select * from ( select * from free_board_reply \r\n"
						+ "UNION \r\n"
						+ "select * from oneline_board_reply\r\n"
						+ "union\r\n"
						+ "select * from review_board_reply\r\n"
						+ "union\r\n"
						+ "select * from question_board_reply"
						+ ") ORDER BY all_reply_number desc";
				pstmt = conn.prepareStatement(sql);
			}
			
			//PreparedStatement like를 이용한 검색시 %와 ? 바인딩 방법
			//--MySQL sql문에서는 like ?로 쓰고 pstmt.setString(1, "%"+searchWord+"%");로
			//  작성함
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AllBoardReplyVo vo = new AllBoardReplyVo();
				vo.setReply_idx(rs.getInt("reply_idx"));
				vo.setAll_reply_number(rs.getInt("all_reply_number"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setMember_nickname(rs.getString("member_nickname"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setBoard_initial(rs.getString("board_initial"));
				
				boardList.add(vo);
			}
			
		}catch(Exception e) {
			System.out.println("게시물 수 구하는 중 예외 발생2");
			e.printStackTrace();
		}

		return boardList;
	}
	
	
	
	//삭제전 지정한 게시물을 찾아 내용을 반환하는 메소드
	public AllBoardVo selectView(int all_board_number) {
		AllBoardVo vo = new AllBoardVo();
		
		String sql = "select * from free_board where all_board_number = ?\r\n"
				+ "union\r\n"
				+ "select * from oneline_board where all_board_number = ?\r\n"
				+ "union\r\n"
				+ "select * from question_board where all_board_number = ?\r\n"
				+ "union\r\n"
				+ "select * from review_board where all_board_number = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=1; i<5; i++) {
				pstmt.setInt(i, all_board_number);				
			}
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setAll_board_number(rs.getInt("all_board_number"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setMember_nickname(rs.getString("member_nickname"));
				vo.setRead_count(rs.getInt("read_count"));
				vo.setReply_count(rs.getInt("reply_count"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setBoard_initial(rs.getString("board_initial"));
				if(rs.getString("originfile") != null) {
					vo.setOriginFile(rs.getString("originfile"));//원본파일명
					vo.setSaveFile(rs.getString("savefile"));//저장파일명
				}
				
			}
			
		}catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return vo;
	}
		
	//검색리스트에서 바로 삭제시킬 메소드
	public int deletePost(AllBoardVo vo) {
		int result = 0;//게시물 삭제 실패시 반환값
		
		try {
			String sql = "delete from free_board where all_board_number=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, vo.getAll_board_number());
			int result1 = pstmt.executeUpdate();
			sql = "delete from question_board where all_board_number=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, vo.getAll_board_number());
			int result2 = pstmt.executeUpdate();		
			sql = "delete from review_board where all_board_number=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, vo.getAll_board_number());
			int result3 = pstmt.executeUpdate();
			sql = "delete from oneline_board where all_board_number=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, vo.getAll_board_number());
			int result4 = pstmt.executeUpdate();
			
			result = result1 + result2 + result3 + result4;
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void updateReplyCount(int board_idx) {
		try {
			String sql= "update review_board "
					+ "set reply_count = ( "
					+ "select count(*) "
					+ "from review_board_reply "
					+ "where review_board_reply.board_idx = review_board.board_idx) "
					+ "where board_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			pstmt.executeUpdate();
			sql= "update free_board "
					+ "set reply_count = ( "
					+ "select count(*) "
					+ "from free_board_reply "
					+ "where free_board_reply.board_idx = free_board.board_idx) "
					+ "where board_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			pstmt.executeUpdate();
			sql= "update oneline_board "
					+ "set reply_count = ( "
					+ "select count(*) "
					+ "from oneline_board_reply "
					+ "where oneline_board_reply.board_idx = oneline_board.board_idx) "
					+ "where board_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			pstmt.executeUpdate();
			sql= "update question_board "
					+ "set reply_count = ( "
					+ "select count(*) "
					+ "from question_board_reply "
					+ "where question_board_reply.board_idx = question_board.board_idx) "
					+ "where board_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("댓글수 증가 중 예외 발생");
			e.printStackTrace();
		}
		
	}
	
	//지정댓글
	public AllBoardReplyVo selectReplyView(int all_reply_number) {
		AllBoardReplyVo vo = new AllBoardReplyVo();
		
		String sql = "select * from free_board_reply where all_reply_number = ?\r\n"
				+ "union\r\n"
				+ "select * from oneline_board_reply where all_reply_number = ?\r\n"
				+ "union\r\n"
				+ "select * from question_board_reply where all_reply_number = ?\r\n"
				+ "union\r\n"
				+ "select * from review_board_reply where all_reply_number = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=1; i<5; i++) {
				pstmt.setInt(i, all_reply_number);				
			}
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setReply_idx(rs.getInt("reply_idx"));
				vo.setAll_reply_number(rs.getInt("all_reply_number"));
				vo.setContent(rs.getString("content"));
				vo.setPost_date(rs.getDate("post_date"));
				vo.setMember_idx(rs.getInt("member_idx"));
				vo.setBoard_idx(rs.getInt("board_idx"));
				vo.setMember_nickname(rs.getString("member_nickname"));
				vo.setDel_or_not(rs.getInt("del_or_not"));
				vo.setBoard_initial(rs.getString("board_initial"));
				
			}
			
		}catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return vo;
	}
	
	//댓글삭제
	public int deleteReply(AllBoardReplyVo vo) {
		int result = 0;//게시물 삭제 실패시 반환값
		
		try {
			String sql = "delete from review_board_reply where all_reply_number=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getAll_reply_number());			
			int result1 = pstmt.executeUpdate();
			
			sql = "delete from oneline_board_reply where all_reply_number=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getAll_reply_number());			
			int result2 = pstmt.executeUpdate();
			
			sql = "delete from free_board_reply where all_reply_number=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getAll_reply_number());			
			int result3 = pstmt.executeUpdate();
			
			sql = "delete from question_board_reply where all_reply_number=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getAll_reply_number());			
			int result4 = pstmt.executeUpdate();
			
			result = result1 + result2 + result3 + result4;
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
}
