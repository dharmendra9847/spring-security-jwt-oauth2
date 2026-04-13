package tech.restapiproject.services;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class MyService {
	
	public Map<Integer, Integer> readSales() {
		
		Map<Integer, Integer> map = new LinkedHashMap<>();
		map.put(1991, 2000);
		map.put(1992, 2005);
		map.put(1993, 2010);
		map.put(1994, 1900);
		map.put(1995, 2003);
		map.put(1996, 2500);
		map.put(1997, 2000);
		
		return map;
	}
}
