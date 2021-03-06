<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" trimDirectiveWhitespaces="false" session="true" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<my:pagetemplate title="Troop ${troop.name}">
    <jsp:attribute name="body">
      <c:set var="end" value="troops"/>

        <script>
            function openModal(suffix) {
                var modal = $("#modal_" + suffix);
                if (modal)
                    modal.modal('show');
            }
            

            function closeModal(suffix) {
                var modal = $("#modal_" + suffix);
                if (modal)
                    modal.modal('hide');
            }
        </script>

        <table class="table">
          <caption>Troop <c:out value="${troop.name}"/></caption>
          <thead>
          <tr>
            <th>Name</th>
            <th>Mission</th>
            <th>Number of heroes</th>
            <my:protected>
              <th>Delete</th>
              <th>Update</th>
              <th>Add hero</th>
            </my:protected>

          </tr>
          </thead>
          <tbody>
                <tr>
                  <td>
                    <my:a href="/${end}/read/${troop.id}"><c:out value="${troop.name}"/> </my:a>
                  </td>

                  <td>
                    <c:out value="${troop.mission}"/>
                  </td>
                  <td>
                    <c:out value="${troop.heroes.size()}"/>
                  </td>
                  <my:protected>

                    <td>
                      <button class="glyphicon glyphicon-trash btn" onclick=" openModal(${troop.id}) ">
                      </button>


                      <my:modal_template suffix="${troop.id}" title="Delete troop">
                          <jsp:attribute name="body">
                              <strong>Are you sure you want to delete the troop: <c:out value="${troop.name}"/></strong>
                          </jsp:attribute>
                          <jsp:attribute name="footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                      onclick="closeModal(${troop.id})">Close
                              </button>
                            <form style="float: right; margin-left: 10px" method="post"
                                  action="${pageContext.request.contextPath}/${end}/delete/${troop.id}">
                              <input type="submit" class="btn btn-primary" value="Delete"/>
                            </form>
                          </jsp:attribute>
                        </my:modal_template>

                    </td>
                    <td>
                      <button class="glyphicon glyphicon-edit btn"
                              onclick="location.href='${pageContext.request.contextPath}/${end}/edit/${troop.id}'">
                      </button>
                    </td>
                    <td>
                      <td>
                        <button class="glyphicon glyphicon-user btn"
                                onclick="location.href='${pageContext.request.contextPath}/${end}/addhero/${troop.id}'">
                        </button>
                      </td>
                    </td>
                  </my:protected>
                </tr>

          </tbody>
        </table>
        <br/>
        
        <table class="table">
            <caption>Heroes of troop <c:out value="${troop.name}"/></caption>
            <thead>
            <tr>
              <th>Name</th>
              <th>Level</th>
              <my:protected>
                <th>Remove from troop</th>
              </my:protected>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${troop.heroes}" var="hero">
                    <tr>
                      <td>
                        <my:a href="/heroes/read/${hero.id}"><c:out value="${hero.name}"/> </my:a>
                      </td>

                      <td>
                        <c:out value="${hero.level}"/>
                      </td>
                      <my:protected>
                         <td>
                           <button class="glyphicon glyphicon-trash btn" onclick=" openModal('hero'+${hero.id}) ">
                           </button>


                           <my:modal_template suffix="hero${hero.id}" title="Remove hero">
                              <jsp:attribute name="body">
                                  <strong>Are you sure you want to remove the hero: <c:out value="${hero.name}"/></strong>
                              </jsp:attribute>
                              <jsp:attribute name="footer">
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                          onclick="closeModalHero(${hero.id})">Close
                                  </button>
                                <form style="float: right; margin-left: 10px" method="post"
                                      action="${pageContext.request.contextPath}/${end}/removehero/read/${troop.id}/${hero.id}">
                                  <input type="submit" class="btn btn-primary" value="Remove"/>
                                </form>
                              </jsp:attribute>
                          </my:modal_template>
                         </td>
                      </my:protected>


                    </tr>
                </c:forEach>
            </tbody>
        </table>
      <br>

        <Br>
        <Br>
        <button class="btn"
                onclick="location.href='${pageContext.request.contextPath}/${end}'">
          Return
        </button>


    </jsp:attribute>
</my:pagetemplate>