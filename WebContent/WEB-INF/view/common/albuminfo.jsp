<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:forEach var="mp3" items="${mp3 }" begin="1" end="12" step="1">
                <div class="col-lg-33 col-sm-2">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">  		
                               <div class="project-category text-faded">
                               	 ${mp3.title }
                               </div>
                                <div class="project-name">
                                    ${mp3.artist }
                                </div>
                            </div>
                        </div>
                    
                </div>
                  </c:forEach>    