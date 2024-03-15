package com.NoteTaker.Entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Notes {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int noteId;
	@Column(name = "title", nullable = false)
	private String noteTitle;

	private String noteDescription;

	private Date createDate;

	private Date modifyDate;

	public Notes(int noteId, String noteTitle, String noteDescription, Date createDate, Date modifyDate) {
		super();
		this.noteId = noteId;
		this.noteTitle = noteTitle;
		this.noteDescription = noteDescription;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
	}

	public Notes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}

	public String getNoteTitle() {
		return noteTitle;
	}

	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}

	public String getNoteDescription() {
		return noteDescription;
	}

	public void setNoteDescription(String noteDescription) {
		this.noteDescription = noteDescription;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

}
