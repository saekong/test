package com.parkinseoul.service;

import java.util.Map;
import com.parkinseoul.dto.MemberDto;

public interface MemberRestService {
  
  String selectMember();

  String infoMember(String id);

  void insertMember(MemberDto memberDto);

  void updateMember(MemberDto memberDto);

  void deleteMember(MemberDto memberDto);
  
  int idcheck(String id);

  String searchMember(MemberDto memberDto);
  
}
