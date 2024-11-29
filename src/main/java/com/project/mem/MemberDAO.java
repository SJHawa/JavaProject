package com.project.mem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class MemberDAO {

	//회원가입 기능  
	public boolean memberInsert(MemberDTO mDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isSuccess = false; // 기본값 실패로 가정  
		try {
			conn = JDBCUtil.getConnection(); // 데이터베이스 연결 
			
			String strQuery = "insert into joinMem values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, mDTO.getName());     // DTO에서 가져온 name
			pstmt.setString(2, mDTO.getId());
			pstmt.setString(3, mDTO.getPassword());
			pstmt.setString(4, mDTO.getPhoneNum());
			pstmt.setString(5, mDTO.getEmail());
			pstmt.setString(6, mDTO.getBirth());
			pstmt.setString(7, mDTO.getSex());
			
			// count는 영향을 받은 행의 개수
			// 성공 시 1행(1명의 회원 정보가 1행에 저장), 실패시 0
			int count = pstmt.executeUpdate();  //sql쿼리문 실행
			System.out.println(count + "줄이 추가되었습니다.");
			
			//정상적으로 실행됐을 때 count == 1 
		    if (count==1) {
		    	return isSuccess=true;     // 성공적으로 한 행이 추가되면 true
		    } else {
		    	return isSuccess=false;
		    }
			
		} catch (Exception ex) {
			System.out.println("Exception"+ex);
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return isSuccess;     // 회원가입 성공 여부 반환
	}
	
	// ID 중복 확인 기능을 위해 메서드 추가
	public boolean isIdDuplicate(String id) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    boolean isDuplicate = false;

	    try {
	        conn = JDBCUtil.getConnection();
	        String query = "SELECT id FROM joinMem WHERE id = ?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            isDuplicate = true; // 중복 ID 존재
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, pstmt, conn);
	    }

	    return isDuplicate;
	}

	//로그인 기능 
	public boolean login(String userId, String userPassword) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isValid = false;  //"유효한가?"의 결과를 담음 (=isSuccess)
		
		try {
			conn = JDBCUtil.getConnection();
			String strQuery = "SELECT id, password FROM joinMem WHERE id = ? AND password = ?";
			
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPassword);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
			     isValid = true;  // 로그인 성공
			     System.out.println("로그인 성공: " + userId);
			} else {
			      System.out.println("로그인 실패: 사용자 정보 없음");
			}

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, pstmt, conn);
	    }
		return isValid;
	}
	
	
	
	// 회원정보 수정, 비밀번호 변경 관련된 메서
	//----------------------------------------------------------
	
    // 회원 정보 가져오는 메서드 
	public MemberDTO getMemberInfo(String id) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    MemberDTO member = null; // 회원 정보를 저장할 DTO 객체

	    try {
	        conn = JDBCUtil.getConnection(); // 데이터베이스 연결
	        String query = "SELECT id,name, email, phoneNum, sex, birth FROM joinMem WHERE id = ?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            member = new MemberDTO(); // 새로운 DTO 객체 생성
	            member.setId(rs.getString("id"));
	            member.setName(rs.getString("name")); // 이름 추가 (MemberInfoController에서 사용)
	            member.setEmail(rs.getString("email"));
	            member.setPhoneNum(rs.getString("phoneNum"));
	            member.setSex(rs.getString("sex"));
	            member.setBirth(rs.getString("birth"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, pstmt, conn); // 리소스 해제
	    }

	    return member; // 조회된 회원 정보 반환
	}

	
	// 회원 정보 수정하는 메서드
	public boolean updateMemberInfo(MemberDTO mDto) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isUpdated = false;

	    try {
	        conn = JDBCUtil.getConnection(); // DB 연결

	        // SQL 쿼리: 사용자 정보 업데이트
	        String query = "UPDATE joinMem SET password = ?, email = ?, phoneNum = ?, sex = ? WHERE id = ?";
	        pstmt = conn.prepareStatement(query);

	        // 비밀번호 처리: 비어 있으면 기존 비밀번호 유지
	        if (mDto.getNewPassword() == null || mDto.getNewPassword().trim().isEmpty()) {
	            pstmt.setString(1, getCurrentPassword(mDto.getId(), conn)); // 기존 비밀번호 유지
	        } else {
	            pstmt.setString(1, mDto.getNewPassword()); // 새로운 비밀번호
	        }

	        pstmt.setString(2, mDto.getEmail());
	        pstmt.setString(3, mDto.getPhoneNum());
	        pstmt.setString(4, mDto.getSex());
	        pstmt.setString(5, mDto.getId());

	        int rows = pstmt.executeUpdate(); // SQL 실행
	        if (rows > 0) {
	            isUpdated = true; // 업데이트 성공 여부 확인
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(pstmt, conn); // 리소스 해제
	    }

	    return isUpdated;
	}

	
	// 현재 비밀번호를 가져오는 메서드
	private String getCurrentPassword(String userId, Connection conn) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String currentPassword = null;

	    try {
	        // SQL 쿼리: 사용자 ID로 비밀번호 조회
	        String query = "SELECT password FROM joinMem WHERE id = ?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, userId);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            currentPassword = rs.getString("password"); // 현재 비밀번호 가져오기
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, pstmt, null); // 리소스 해제
	    }

	    return currentPassword; // 현재 비밀번호 반환
	}

	
	//비밀번호 확인
	public boolean validatePassword(String userId, String currentPassword) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    boolean isValid = false;

	    try {
	        conn = JDBCUtil.getConnection();
	        String query = "SELECT password FROM joinMem WHERE id = ? AND password = ?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, userId);
	        pstmt.setString(2, currentPassword);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            isValid = true; // 비밀번호가 일치하면 true 반환
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, pstmt, conn); // 리소스 해제
	    }

	    return isValid;
	}
	
	//비밀번호 변경
	public boolean updatePassword(String userId, String newPassword) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isUpdated = false;

	    try {
	        conn = JDBCUtil.getConnection();
	        String query = "UPDATE joinMem SET password = ? WHERE id = ?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, newPassword); // 새 비밀번호
	        pstmt.setString(2, userId); // 사용자 ID

	        int rows = pstmt.executeUpdate(); // SQL 실행
	        if (rows > 0) {
	            isUpdated = true; // 업데이트 성공 여부 확인
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(pstmt, conn); // 리소스 해제
	    }

	    return isUpdated;
	}
	
	//----------------------------------------------------------
	
	
	
	// 관리자 페이지 관련 메소드 
	//----------------------------------------------------------
	
	// 모든 회원 정보를 조회하는 메서드 추가
	public List<MemberDTO> getAllMembers() {
	    List<MemberDTO> memberList = new ArrayList<>(); // 빈 리스트 생성
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        conn = JDBCUtil.getConnection(); // 데이터베이스 연결
	        String query = "SELECT id, name, birth, sex, phoneNum FROM joinMem"; // SQL 쿼리
	        pstmt = conn.prepareStatement(query);
	        rs = pstmt.executeQuery();

	        while (rs.next()) { // 결과 집합에서 데이터를 반복 처리
	            MemberDTO member = new MemberDTO(); // 각 행 데이터를 저장할 DTO 객체 생성
	            member.setId(rs.getString("id"));
	            member.setName(rs.getString("name"));
	            member.setBirth(rs.getString("birth"));
	            member.setSex(rs.getString("sex"));
	            member.setPhoneNum(rs.getString("phoneNum"));

	            memberList.add(member); // 리스트에 DTO 객체 추가
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, pstmt, conn); // 자원 해제
	    }

	    return memberList; // 리스트 반환
	}
	
	// 회원 삭제 기능
	public boolean deleteMember(String memberId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isDeleted = false;

	    try {
	        conn = JDBCUtil.getConnection();
	        String query = "DELETE FROM joinMem WHERE id = ?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, memberId);

	        int rows = pstmt.executeUpdate();
	        if (rows > 0) {
	            isDeleted = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(pstmt, conn);
	    }
	    return isDeleted;
	}
}
