package com.utunan.pojo.util;

import com.utunan.pojo.community.Quiz;
import com.utunan.pojo.community.Tag;
import com.utunan.pojo.user.User;

import java.util.List;

/**
 * @author 孙程程
 * @description: TODO
 * @date 2018/11/22 14:26
 */
public class BigQuiz {
	private Quiz quiz;
	private Long commentNumber;
	private List<Tag> tagList;

	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}
	public Long getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(Long commentNumber) {
		this.commentNumber = commentNumber;
	}

	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}
}
