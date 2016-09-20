package com.user.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.user.mapper.UserMapper;
import com.user.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userDao;
	

	@Override
	public Map<String, Object> checkUser(Map<String, Object> param) {
		List<Map<String, Object>> list = null;
		String type = param.get("type")==null?null:param.get("type").toString();
		if(type==null){
			if("proxyAdmin".equals(param.get("username"))&&"password".equals(param.get("password"))){
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("name", "管理员");
				return map;
			}
		}else{
			if("patient".equals(type)){
				list = userDao.checkUser(param);
			}else if("doctor".equals(type)){
				list = userDao.checkDoctor(param);
			}
			if(list.size()>0){
				return list.get(0);
			}
		}
		return null;
	}

	/**
	 *   <p>【添加用户】</p>
	 *
	 * @author 林军雄  2014年12月2日 
	 *
	 * @param param
	 * @return
	 */
	@Override
	public String saveUser(Map<String, Object> param) {
		Date now = new Date();
		param.put("registerDate", now);
		userDao.saveUser(param);
		return "1";
	}

	@Override
	public Map<String, Object> showUserInfo(Map<String, Object> param) {
		return userDao.showUserInfo(param);
	}
	
	@Override
	public List<Map<String, Object>> getDoctorList(Map<String, Object> param) {
		List<Map<String, Object>> list = userDao.getDoctor(param);
		for(int i=0; i<list.size(); i++){
					String state = (String)list.get(i).get("state");
					if("1".equals(state)){
						list.get(i).put("state","未审核");
					}else if("2".equals(state)){
						list.get(i).put("state","审核通过");
					}else if("3".equals(state)){
						list.get(i).put("state","审核不通过");
					}
					
		}
		return list;
	}
	
	@Override
	public Map<String, Object> showDoctorInfo(Map<String, Object> param) {
		return userDao.showDoctorInfo(param);
	}
	
	@Override
	public String saveDoctorInfo(Map<String, Object> param) {
		if(userDao.checkDoctorById(param)>0){
			userDao.updateDoctorInfo(param);
		}else{
			userDao.saveDoctorInfo(param);
		}
		
		return "1";
	}
	
	@Override
	public String updateDoctorState(Map<String, Object> param) {
		userDao.updateDoctorState(param);
		return "1";
	}

	@Override
	public int countDoctorTotal() {
		return userDao.countDoctorTotal();
	}
	
	@Override
	public int countPatientTotal() {
		return userDao.countPatientTotal();
	}
	
	@Override
	public List<Map<String, Object>> getPatientList(Map<String, Object> map) {
		return userDao.getPatientList(map);
	}
	
	@Override
	public String deletePatientInfo(Map<String, Object> param) {
		userDao.deletePatientInfo(param);
		return "1";
	}
	
	@Override
	public int countPatientTotalWithState(Map<String, Object> map) {
		return userDao.countPatientTotalWithState(map);
	}
	
	@Override
	public List<Map<String, Object>> getPatientListWithState(
			Map<String, Object> map) {
		return userDao.getPatientListWithState(map);
	}
	
	@Override
	public String updatePatientState(Map<String, Object> param) {
		userDao.updatePatientState(param);
		return "1";
	}
	
	@Override
	public List<Map<String, Object>> getDoctorList() {
		return userDao.getDoctorList();
	}
	
	@Override
	public String updateUser(Map<String, Object> map) {
		userDao.updateUser(map);
		return "1";
	}
	@Override
	public String saveAdvice(Map<String, Object> param) {
		userDao.saveAdvice(param);
		return "1";
	}

}
