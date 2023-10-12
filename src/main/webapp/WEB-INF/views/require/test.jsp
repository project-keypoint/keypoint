<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <table id="myTable" border="1">
    <tr>
        <th>Header 1</th>
        <th>Header 2</th>
        <th>Header 3</th>
    </tr>
</table>

<button onclick="addRow()">Add Row</button>
<button onclick="mergeCells(0)">Merge Cells</button>
<script type="text/javascript">
function addRow() {
    var table = document.getElementById("myTable");
    var row = table.insertRow(-1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    cell1.innerHTML = "Row Data 1";
    cell2.innerHTML = "Row Data 2";
    cell3.innerHTML = "Row Data 3";
}

function mergeCells(rowIdx) {
    var table = document.getElementById("myTable");
    var rows = table.rows;
    var cols = rows[rowIdx].cells.length;

    for (var colIdx = 0; colIdx < cols; colIdx++) {
        if (colIdx === 0) {
            rows[rowIdx].cells[colIdx].rowSpan = rows.length;
        } else {
            rows[rowIdx].deleteCell(colIdx);
        }
    }
}

</script> -->

		<table id="vendortable" class="table table-striped tbtr">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">
					<th><input type="checkbox" id="allCheck" onclick="allChecking();"></th>
					<th> </th>
					<th>완제품코드</th>
					<th>품목명</th>
					
					<th>원자재코드</th>
					<th>품목명</th>
					<th>소요량</th>
					<th>단위</th>
					
					<th>등록일</th>
					<th>수정일</th>
					<th></th>
				</tr>
			</thead>
			
			<c:choose>
			<c:when test="${not empty rprList}">
			
			<c:set var="count" value="-1"></c:set>
			
				<c:forEach var="inRprList" items="${rprList }" varStatus="outSts"> 				
			  		<tbody>
			  		<c:forEach var="dto" items="${inRprList }" varStatus="inSts">
			  			
			  			<tr>
				  		<c:if test="${inSts.index == '0'}">		 
				  		<c:set var="count" value="${count+1 }" /> 					
		        			<td rowspan="${pageDTO.rowcolsTd.get(outSts.index) }"><input type="checkbox" name="rowCheck" value="${dto.cproduct_cd_name }"></td>
		    				<td rowspan="${pageDTO.rowcolsTd.get(outSts.index) }">${pageDTO.startRow+1+count }</td>
		    				<td rowspan="${pageDTO.rowcolsTd.get(outSts.index) }">${dto.cproduct_cd_name}</td>
		    				<td rowspan="${pageDTO.rowcolsTd.get(outSts.index) }">${dto.cproduct_name}</td>		
		    			</c:if>
		    			
			    			<td>${dto.rproduct_cd_name}</td>
			    			<td>${dto.rproduct_name}</td>
			    			<td>${dto.consumption}</td>
			    			<td>${dto.consumption_unit}</td> 
			    			
			    		<c:if test="${inSts.index == '0'}">
			    			<td rowspan="${pageDTO.rowcolsTd.get(outSts.index) }"><fmt:formatDate value="${dto.insert_date}" pattern="yyyy-MM-dd" /></td>
			    			<td rowspan="${pageDTO.rowcolsTd.get(outSts.index) }"><fmt:formatDate value="${dto.update_date}" pattern="yyyy-MM-dd" /></td>
			    			<td rowspan="${pageDTO.rowcolsTd.get(outSts.index)}"><button class="button2" id="updateBtn" onclick="updateFn('${dto.cproduct_cd_name}')">수정</button></td>
			    		</c:if>
			    		</tr>
			    		
			    	</c:forEach>
	  				</tbody>	
				</c:forEach>				
				
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="11" style="text-align: center;">등록된 데이터가 없습니다.</td>
				</tr>
			</c:otherwise>
			</c:choose>
		</table>



</body>
</html>