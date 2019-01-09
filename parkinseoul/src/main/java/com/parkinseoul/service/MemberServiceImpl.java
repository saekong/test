package com.parkinseoul.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.parkinseoul.dao.MemberDao;
import com.parkinseoul.dto.MemberDto;


@Service
public class MemberServiceImpl implements MemberService {
  
  @Autowired
  SqlSession sqlSession;

  @Override
  public MemberDto infoMember(String id) {
    return sqlSession.getMapper(MemberDao.class).infoMember(id);
  }

}
