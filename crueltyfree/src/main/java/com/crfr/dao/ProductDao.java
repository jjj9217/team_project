package com.crfr.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.crfr.vo.ExploreVo;
import com.crfr.vo.FileVo;
import com.crfr.vo.ProductVo;

@Repository
public class ProductDao {
	public static final String MAPPER = "com.crfr.ProductMapper";
	private SqlSession sqlSession;
	
	public ProductDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//전체?개의 상품에 사용할 것 -> 검색 조건에 맞는 게시물 수를 반환하는 메소드
							//Mapper.xml의 resultType에는 메소드의 반환형으로 여기선 int이다. 따라서 resultType에서는 int형식을 받는 _int이다. 
	public int selectCount(ExploreVo vo) {
				return sqlSession.selectOne(MAPPER+".selectCount", vo);
	}																//맨끝에 오는 vo가 Mapper.xml에서 사용할 때 parameterType이다. 다만, 해당 vo객체를 parameterType에서 사용할 때는 config의 config.xml에 무엇으로 쓸지 정의해놓은 별칭으로 사용한다. Explorevo객체 vo같은 경우는 별칭을 해당 config.xml에 ExploreVo로 정의해놨기때문에 parameterType의 이름은 ExploreVo를 사용해야 한다
																	//헷갈리지 말아야할 껀 이번경우에는 매개변수가 맨 끝에서 vo로 사용되었지만, 해당 return값 안에서 vo를 활용해서 map형식으로 값을 선언할 수도 있다. 그럴 경우에는 parametertype은 map이 된다.
	
	//검색 조건에 맞는 게시물 목록을 반환하는 메소드
	public List<ProductVo> selectList(ExploreVo vo) {	
		return sqlSession.selectList(MAPPER+".selectList", vo);
	}
	
	
	//검색 조건에 맞는 게시물사진 목록을 반환하는 메소드
	public List<FileVo> selectListimg(ExploreVo vo) {	
		return sqlSession.selectList(MAPPER+".selectListimg", vo);
	}
	
	//지정한 게시물을 찾아 내용을 반환하는 메소드
	public ProductVo selectView(int board_idx) {		
		return sqlSession.selectOne(MAPPER+".selectView", board_idx);
	}
	
	

	
	
	/*
	 * //검색 조건에 맞는 게시물 목록을 반환하는 메소드 public List<ProductVo>
	 * selectList_saleCount(ExploreVo vo) { return
	 * sqlSession.selectList(MAPPER+".selectList_saleCount", vo); }
	 * 
	 * //검색 조건에 맞는 게시물사진 목록을 반환하는 메소드 public List<FileVo>
	 * selectListimg_saleCount(ExploreVo vo) { return
	 * sqlSession.selectList(MAPPER+".selectListimg_saleCount", vo); }
	 */

	
	
	
	
}