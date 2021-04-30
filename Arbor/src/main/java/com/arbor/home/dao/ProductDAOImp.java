package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.MainCateVO;
import com.arbor.home.vo.OptionVO;
import com.arbor.home.vo.ProductVO;
import com.arbor.home.vo.SubCateVO;

public interface ProductDAOImp {
	/* 관리자, 사용자 공통 */
	
	// 대분류 불러오기 (여기저기서 씀)
	public List<MainCateVO> mainCateList();
	// 중분류 불러오기 (여기저기서 씀)
	public List<SubCateVO> subCateList(int mainno);
	
	
	/* 사용자 */
	
	//상품목록 불러오기
	public List<ProductVO> productListClient(int subno);
	
	
	/* 관리자 */
	
	// 중분류 불러오기 전체 (관리자 - 카테고리관리)
	public List<SubCateVO> subCateListAll();
	// 상품등록
	public int productInsert(ProductVO vo);
	// 옵션테이블 등록 (상품등록하면서 옵션테이블 같이 등록)
	public int optionInsert(OptionVO vo);
	// option 등록 위한 pno구해오기
	public int pnoSelect(int subno, String pname);
	// 상품 전체 목록 불러오기 (관리자 - 상품관리)
	public List<ProductVO> productList();
	// 상품 수정 위한 pno에 따른 1개 정보 구해오기 (관리자 - 상품수정)
	public ProductVO productSelect(int pno);
	// optionList불러오기 (상품수정 위해 기존 List 뽑아오기)
	public List<OptionVO> optionSelect(int pno);
	// 상품 수정시 pvo 업데이트
	public int productUpdate(ProductVO pvo);
	// optionTbl 삭제 (optionNo로 한 줄 삭제) - 관리자 상품수정시 삭제된 옵션 delete
	public int optionDelete(int optno);
	// optiontbl 수정 (상품수정시 기존 option 수정분 update)
	public int optionUpdate(OptionVO vo);
	// 상품번호로 해당상품 삭제 (관리자 - 상품관리/ 삭제)
	public int productDelete(int pno);
	// 옵션테이블에 해당 상품번호에 해당하는 옵션 모두 삭제 (상품 삭제시 관련 옵션도 지워야 함 - 관리자/상품관리/삭제)
	public int optionAllDelete(int pno);
}