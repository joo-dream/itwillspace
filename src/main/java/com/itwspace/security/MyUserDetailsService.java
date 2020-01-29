package com.itwspace.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.itwspace.mapper.MemberMapper;
import com.itwspace.model.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class MyUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + userName);

		// userName means userid
		MemberVO vo = memberMapper.findByUserId(userName);

		log.warn("queried by member mapper: " + vo);

		List<GrantedAuthority> auth = new ArrayList<>();
		auth.add(new SimpleGrantedAuthority(vo.getAuth()));
		return vo == null ? null : new User(vo.getUserId(), vo.getUserPw(), auth );		
	} 
	
//회원 정보 수정시 authority 정보 재설정(member or host)	
	public void resetAuthentication(String userId){
	
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO vo = memberMapper.findByUserId(userId);
		List<GrantedAuthority> updatedAuthorities = new ArrayList<>(auth.getAuthorities());

		for(GrantedAuthority authority : updatedAuthorities) {
			log.warn(authority);
		}
		//updatedAuthorities.add(new SimpleGrantedAuthority(vo.getAuth())); 
		updatedAuthorities.set(0, new SimpleGrantedAuthority(vo.getAuth()));

		Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(), updatedAuthorities);

		SecurityContextHolder.getContext().setAuthentication(newAuth);
	}
}
