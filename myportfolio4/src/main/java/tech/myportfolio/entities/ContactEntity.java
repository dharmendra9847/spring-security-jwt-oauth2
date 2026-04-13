package tech.myportfolio.entities;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "contacts")
public class ContactEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(length = 30)
	private String name;
	
	@Column(length = 40, unique = true)
	private String email;
	
	@Column(length = 50)
	private String subject;
	
	@Column(length = 1000)
	private String message;
	
	
	private LocalDateTime datetime;


	public ContactEntity() {
		// TODO Auto-generated constructor stub
	}


	public ContactEntity(String name, String email, String subject, String message, LocalDateTime  datetime) {
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.datetime = datetime;
	}

	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public LocalDateTime getDatetime() {
		return datetime;
	}


	public void setDatetime(LocalDateTime  datetime) {
		this.datetime = datetime;
	}

}
