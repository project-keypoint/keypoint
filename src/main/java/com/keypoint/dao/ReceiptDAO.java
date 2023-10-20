package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.PurchaseDTO;
import com.keypoint.dto.ReceiptDTO;

@Repository
public class ReceiptDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mappers.receiptMapper";

	// ----------------------------------------------------------------------------------

	public void insertReceipt(ReceiptDTO receiptDTO) {
		System.out.println("ReceiptDAO insertReceipt()");

		sqlSession.insert(namespace + ".insertReceipt", receiptDTO);
	} // insertReceipt

	public List<ReceiptDTO> getReceiptList(PageDTO pageDTO) {
		System.out.println("ReceiptDAO getReceiptList()");

		return sqlSession.selectList(namespace + ".getReceiptList", pageDTO);
	} // getReceiptList

	public int getReceiptCount(PageDTO pageDTO) {
		System.out.println("ReceiptDAO getReceiptCount()");

		return sqlSession.selectOne(namespace + ".getReceiptCount", pageDTO);
	} // getReceiptCount

	public ReceiptDTO getReceiptDetails(String grCode) {
		System.out.println("ReceiptDAO getReceiptDetails()");

		return sqlSession.selectOne(namespace + ".getReceiptDetails", grCode);
	}// getReceiptDetails() [입고상세]

	public void updateReceipt(ReceiptDTO receiptDTO) {
		System.out.println("ReceiptPurchaseDAO updateReceipt()");
		System.out.println(receiptDTO);

		sqlSession.update(namespace + ".updateReceipt", receiptDTO);
	}// updateReceipt() [입고수정]

	// ------------------------------------------------------------------------------

	public ReceiptDTO getReceiptDetails2(String grCode) {
		System.out.println("ReceiptDAO getReceiptDetails2()");

		return sqlSession.selectOne(namespace + ".getReceiptDetails2", grCode);
	}// getReceiptDetails2() [입고완료상세]

	public void updateReceipt2(ReceiptDTO receiptDTO) {
		System.out.println("ReceiptPurchaseDAO updateReceipt2()");
		System.out.println(receiptDTO);

		sqlSession.update(namespace + ".updateReceipt2", receiptDTO);
	}// updateReceipt2() [입고완료수정]

	// ----------------------------------------------------------------------------------

	// GoodsReceipt 삭제
	public void deleteGoodsReceipt(String grCode) {
		sqlSession.update(namespace + ".deleteGoodsReceipt", grCode);
	} // deleteGoodsReceipt

	// GoodsReceipt와 연관된 PurchaseOrder 코드 가져오기
	public String getRelatedPurchaseOrderCode(String grCode) {
		return sqlSession.selectOne(namespace + ".getRelatedPurchaseOrderCode", grCode);
	} // getRelatedPurchaseOrderCode

	// PurchaseOrder 삭제
	public void deletePurchaseOrder(String poCode) {
		sqlSession.update(namespace + ".deletePurchaseOrder", poCode);
	} // deletePurchaseOrder

	// -------------------------------------------------------------------------------

	// ReceiptDAO.java
	public void updateMaterialCount(ReceiptDTO receiptDTO) {
		sqlSession.update(namespace + ".updateMaterialCount", receiptDTO);
	}

} // class
