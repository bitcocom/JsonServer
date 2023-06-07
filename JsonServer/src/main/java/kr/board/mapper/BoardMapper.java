package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;
import kr.board.entity.Criteria;
import kr.board.entity.Customer;
// BoardMapper interface <----> SQL Mapper XML file
import kr.board.entity.Member;
public interface BoardMapper {
  
	// 전체 게시물을 가져오는 메서드 정의
	public List<Board> getLists(Criteria cri); // 추상메서드
    // 게시물을 저장하는 메서드 정의
	public void insert(Board vo);
	//선택한 번호에 해당하는 게시물정보 한개만 가져오는 메서드 정의
    public Board get(int num);
    public void remove(int num);
	// 선택한 번호에 해당하는 게시물의 제목,내용을 수정하는 메서드 정의
    @Update("update reply set title=#{title}, content=#{content} where num=#{num}")
    public void update(Board vo);
    // 선택한 게시물의 조회수를 누적
    @Update("update reply set count=count+1 where num=#{num}")
    public void count(int num);
    // 아이디와 비밀번호에 해당하는 사용자가 있는지 처리
    public Member login(Member vo);
    // 답글의 bseq를 모두+1하기
    public void replyUpdate(Board parent);
    // 답글 저장하기
    public void replyInsert(Board vo);
    
    // 전체게시글의 수를 구하는 메서드
    public int totalCount();
    
    public List<Customer> getMembers();
    public int insMember(Customer member);
    public int modifyMember(Customer member);
	public int deleteMember(String id);
	public Customer detailMember(String id);
}





