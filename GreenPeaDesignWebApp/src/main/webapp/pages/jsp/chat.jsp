<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/card.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">

    <%@ include file="../includes/const-style.jsp" %>
    <title>Sign In</title>
</head>

<body>
<%@ include file="../includes/navigation-bar.jsp" %>

<main>
    <section class="chat-wrap">
        <div class="chat-wrap-container">
            <h1>ChatterBox</h1>
            <h2>Where Creativity Meets Conversation</h2>
            <p>
                Welcome to Chatterbox – the global crossroads of design and dialogue. Here, creators and dreamers from
                every corner of the world gather to discuss the art of logos. Whether you're sharing your latest concept
                or seeking inspiration, this is your canvas for collaboration. Join the conversation, let ideas flow,
                and watch as your designs flourish amidst the lively chatter.</p>
            <textarea id="msgField" readonly="readonly" rows="25"></textarea><br/>
            <label for="msgInput">Enter your message:</label>
            <%
                User user = (User) session.getAttribute("auth");
                if ( user != null )
                {
            %>
                <input id="msgID" type="hidden" value="<%=user.getUsername()%>"/>
            <%
                }
                else
                {
            %>
                <input id="msgID" type="hidden" value="Anonymous"/>
            <%
                }
            %>
            <input id="msgInput" type="text"/>
            <button class="send-msg-button" onclick="sendMsg();">Send</button>
        </div>
    </section>

    <script>

        document.getElementById('msgInput').addEventListener('keyup', function(event)
        {
            if (event.code === 'Enter')
            {
                event.preventDefault();
                sendMsg();
            }
        });

        const websocket = new WebSocket("ws://"+ window.location.host +"/chatterboxEndpoint");

        websocket.onmessage = function processMessage(message)
        {
            let msg = JSON.parse(message.data);
            let completeMsg = "(" + msg.username + "): " + msg.message + "\n";

            msgField.value += completeMsg + "\n";

            msgField.scrollTop = msgField.scrollHeight;
        }

        function sendMsg()
        {
            let message = {};
            message.username = document.getElementById("msgID").value;;

            if(msgInput.value.trim() === "")
            {
                return;
            }

            message.message = msgInput.value;

            websocket.send(JSON.stringify(message));
            msgInput.value = "";
        }

    </script>

</main>

<%@ include file="../includes/footer-section.jsp" %>
</body>
</html>