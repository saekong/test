package com.parkinseoul.dao;

import java.util.List;
import java.util.Map;
import com.parkinseoul.dto.MemberDto;

public interface MemberDao {

  List<MemberDto> selectMember();

  MemberDto infoMember(String id);

  int getSeq(MemberDto memberDto);
  
  void insertMember(MemberDto memberDto);
  
  void insertUsers(MemberDto memberDto);
  
  void insertAuthorities(MemberDto memberDto);

  void updateMember(MemberDto memberDto);

  void deleteMember(int seq);
  
  void deleteAuthorities(int seq);
  
  void deleteUsers(int seq);
  
  int idcheck(String id);

  List<MemberDto> searchMember(MemberDto memberDto);
  
}
