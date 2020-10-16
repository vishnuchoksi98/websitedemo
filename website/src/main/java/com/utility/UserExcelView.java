package com.utility;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.bean.userbean;


public class UserExcelView extends AbstractXlsView  {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
        response.setHeader("Content-Disposition", "attachment; filename=\"UserList.xlsx\"");
		Sheet excelSheet = workbook.createSheet("userlist");
		UserExcelView c=new UserExcelView();
		c.setExcelHeader(excelSheet);
		List<userbean> list = (List<userbean>) model.get("animalList");
		//List animalList = (List) model.get("animalList");
		c.setExcelRows(excelSheet, list);
	}	

	public void setExcelHeader(Sheet excelSheet) {
		Row excelHeader = excelSheet.createRow(0);
		excelHeader.createCell(0).setCellValue("customerid");
		excelHeader.createCell(1).setCellValue("Name");
		excelHeader.createCell(2).setCellValue("email");
		excelHeader.createCell(3).setCellValue("Phoneno");
		excelHeader.createCell(4).setCellValue("status");
	}

	public void setExcelRows(Sheet excelSheet, List<userbean> list) {
		int record = 1;
		for (userbean animal : list) {
			Row excelRow = excelSheet.createRow(record++);
			excelRow.createCell(0).setCellValue(animal.getCustomerid());
			excelRow.createCell(1).setCellValue(animal.getFullname());
			excelRow.createCell(2).setCellValue(animal.getEmail());
			excelRow.createCell(3).setCellValue(animal.getPhoneno());
			excelRow.createCell(4).setCellValue(animal.getStatus());
		}
	}


}
