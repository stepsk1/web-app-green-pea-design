<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">

    <%@ include file="../includes/const-style.jsp" %>
    <title>Help</title>
</head>

<!--
<header>	Specifies a header for a document or section
<nav>	    Defines a navigation area
<main>	    Specifies the main content of a document
<aside>	    Defines content aside from the page content
<section>	Defines a section in a document
<article>	Defines an article
<footer>	Defines a footer for a document or section
-->

<body>
<%@ include file="../includes/navigation-bar.jsp" %>

<main>
    <section class="help-wrap">
        <div>
            <h1>Uputstvo</h1>
        </div>
        <div>
            <h2>Korisnik koji nije prijavljen</h2>
            <ul>
                <li>Korisnik može da registruje nov nalog ili da se prijavi na već postojeći. Nakon uspešne registracije, biće preusmeren na stranicu za prijavu.</li>
                <li>Uslovi za registraciju novog naloga:</li>
                <ul class="help-sub-list">
                    <li>Ime mora sadržati isključivo slova i imati između 3 i 15 karaktera.</li>
                    <li>Email adresa mora biti u formatu primer@gmail.com.</li>
                    <li>Lozinka može sadržati isključivo brojeve i slova, u rasponu od 3 do 15 karaktera.</li>
                    <li>Lozinka i potvrda lozinke moraju biti identični.</li>
                </ul>
                <li>Ukoliko korisnik ne ispuni uslove za registraciju, registracija neće biti izvršena, a korisnik će biti obavešten o grešci.</li>
                <li>Korisnik ima pristup stranici prodavnice i detaljnom pregledu proizvoda, ali ne može izvršiti kupovinu niti vršiti izmene na proizvodima.</li>
                <li>Korisnik može pristupiti naslovnoj stranici, prodavnici, uputstvu i stranici za prijavu. Ostale stranice nisu dostupne korisniku.</li>
                <li>Na naslovnoj stranici, svi korisnici mogu kliknuti na odgovarajuću sekciju u navigaciji i automatski će biti preusmereni na taj deo stranice.</li>
            </ul>
        </div>
        <div>
            <h2>Prijavljeni korisnik</h2>
            <ul>
                <li>Prijavljeni korisnik može izvršiti porudžbinu proizvoda iz prodavnice putem direktne kupovine ili dodavanjem u korpu.</li>
                <li>Pred direktnu kupovinu, korisnik će dobiti obaveštenje sa opcijom da potvrdi kupovinu. Nakon potvrde, proizvod će biti premešten u listu obrađenih porudžbina.</li>
                <li>Nakon dodavanja proizvoda u korpu, korisnik će biti preusmeren na stranicu korpe gde može videti ukupnu cenu svih proizvoda, može prilagoditi količinu, te pojedinačno odustati ili obrisati sve proizvode iz korpe.
                    Kada je zadovoljan odabranim proizvodima, može pritisnuti dugme za kupovinu i svi proizvodi će biti premešteni u listu obrađenih porudžbina.</li>
                <li>Nakon pokušaja brisanja ili kupovine, korisnik će dobiti obaveštenje koje mora potvrditi kako bi nastavio.</li>
                <li>Korisnik može otvoriti detaljan pregled proizvoda radi boljeg pregleda i isto tako izvršiti direktnu kupovinu ili dodavanje u korpu.</li>
                <li>Korisnik se u svakom trenutku može odjaviti sa svog profila, što će ga vratiti na stranicu za prijavu.</li>
                <li>Broj proizvoda u korpi biće prikazan crvenom ikonicom na ekranu, kako bi korisnik uvek imao pregled trenutnog stanja korpe.</li>
                <li>Na stranici prodavnice, korisnik može filtrirati proizvode po kategorijama koje ga zanimaju.</li>
            </ul>
        </div>
        <div>
            <h2>Administrator</h2>
            <ul>
                <li>Administrator ima uvid u sve porudžbine na stranici porudžbine. Može pojedinačno brisati porudžbine ili obrisati sve zajedno.</li>
                <li>Pritiskom na dugme za novi proizvod ili karticu u navigaciji, administrator može dodati novi proizvod i biće preusmeren na stranicu za dodavanje novog proizvoda.</li>
                <li>Na stranici za dodavanje proizvoda, sva polja moraju biti popunjena, uključujući cenu u odgovarajućem formatu. Takođe, treba dodati fotografiju proizvoda.
                    Nakon toga, administrator će dobiti obaveštenje o uspešnom dodavanju ili grešci.</li>
                <li>Na stranici prodavnice, administrator može filtrirati proizvode po kategorijama i direktno brisati proizvode sa te stranice.</li>
                <li>Prilikom detaljnog pregleda ili pritiskom na dugme za izmenu proizvoda, administrator može izmeniti određene atribute proizvoda ili ga obrisati.
                    Nakon potvrde upozorenja, administrator će biti obavešten o uspešnoj ili neuspešnoj operaciji.</li>
                <li>Administrator se u svakom trenutku može odjaviti sa svog profila.</li>
            </ul>
        </div>
        <div>
            <ul>
                <li>U podnožju stranice nalaze se dva linka: jedan za pomoć i drugi za povratak na početnu stranicu.</li>
                <li>U slučaju pristupa neodgovarajućoj stranici ili dobijanja bilo kakve greške, korisnik će biti preusmeren na stranicu za obradu greške, odakle se može vratiti na početnu stranicu.</li>
            </ul>
        </div>
        <div>
            <h2>Korisnici platforme</h2>
            <ul>
                <li>(admin) Username: loki@gmail.com Password: 123</li>
                <br>
                <li>(customer) Username: perun@gmail.com Password: 123 </li>
                <li>(customer) Username: filip@gmail.com Password: 123 </li>
                <li>(customer) Username: milan@gmail.com Password: 123 </li>
                <li>(customer) Username: sonja@gmail.com Password: 123 </li>
                <li>(customer) Username: user@gmail.com Password: 123 </li>
            </ul>
        </div>
    </section>
</main>

<%@ include file="../includes/footer-section.jsp" %>
</body>
</html>