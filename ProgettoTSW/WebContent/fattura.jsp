<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*" import="java.util.List" import="java.util.Iterator" import="java.math.RoundingMode"
	import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fattura</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="./Css/fattura.css" >
    <script src="./JS/fattura.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

</head>

<body>
	<% OrdineBean ordine = (OrdineBean) request.getAttribute("ordine");
	UtenteBean cliente = (UtenteBean) request.getAttribute("cliente");
	List<ComposizioneOrdineBean> listaComposizioneOrdine = (List<ComposizioneOrdineBean>) request.getAttribute("listaComposizioneOrdine");
	MetodoDiPagamentoBean metodoPagamento = (MetodoDiPagamentoBean) request.getAttribute("metodoPagamento");
	IndirizzoBean indirizzo = (IndirizzoBean) request.getAttribute("indirizzo");
	Double totNetto = 0.0;
	Double costoNetto;
	DecimalFormat df = new DecimalFormat("0.00");
	%>
    <div class="container d-flex justify-content-center mt-50 mb-50">
        <div class="row">
            <div class="col-md-12 text-right mb-3">
                <button class="btn btn-primary" id="download"> download pdf</button>
            </div>
            <div class="col-md-12">
                <div class="card" id="invoice">
                    <div class="card-header bg-transparent header-elements-inline">
                        <h6 class="card-title text-primary">Fattura</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="mb-4 pull-left">

                                    <ul class="list list-unstyled mb-0 text-left">
                                        <li>Via Roma, 10</li>
                                        <li>Fisciano (SA), Italia</li>
                                        <li>089-1234765</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="mb-4 ">
                                    <div class="text-sm-right">
                                        <h4 class="invoice-color mb-2 mt-md-2">Fattura #<% out.println(ordine.getNumOrdineProgressivo()); %></h4>
                                        <ul class="list list-unstyled mb-0">
                                            <li>Data: <span class="font-weight-semibold"><% out.println(ordine.getDataAcquisto()); %></span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-md-flex flex-md-wrap">
                            <div class="mb-4 mb-md-2 text-left"> <span class="text-muted">Cliente:</span>
                                <ul class="list list-unstyled mb-0">
                                    <li>
                                        <h5 class="my-2"><% out.println(cliente.getNome() + " " + cliente.getCognome()); %></h5>
                                    </li>
                                    <li><span class="font-weight-semibold"><% out.println(ordine.getVia() + ", " + ordine.getCivico()); %></span></li>
                                    <li><% out.println(ordine.getCitta() + ", " + ordine.getCAP()); %></li>
                                    <li><% out.println(ordine.getProvincia()); %></li>
                                    <li><% out.println(ordine.getNazione()); %></li>
                                    <li><a href="#" data-abc="true"><% out.print(cliente.getEmail()); %></a></li>
                                </ul>
                            </div>
                            <div class="mb-2 ml-auto"> <span class="text-muted">Dettagli pagamento:</span>
                                <div class="d-flex flex-wrap wmin-md-400">
                                    <ul class="list list-unstyled mb-0 text-left">
                                    	<li>Tipo pagamento:</li>
                                    <% if(ordine.getTipoPagamento().equals("carta")) { %>
                                        <li>Num. carta:</li>
                                    <% } else  {%>
                                        <li>IBAN:</li>
                                    <% } %>
                                    </ul>
                                    <ul class="list list-unstyled text-right mb-0 ml-auto">
                                        <% if(ordine.getTipoPagamento().equals("carta")) { %>
                                        <li>Carta</li>
                                        <li><% out.println(ordine.getNumCarta()); %></li>
                                    <% } else  {%>
                                    	<li>IBAN</li>
                                        <li><% out.println(ordine.getIBAN()); %></li>
                                    <% } %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-lg">
                            <thead>
                                <tr>
                                	<th>Codice Seriale</th>
                                    <th>Nome prodotto</th>
                                    <th>Quantita</th>
                                    <th>Totale netto</th>
                                    <th>IVA</th>
                                    <th>Totale</th>
                                </tr>
                            </thead>
                            <% Iterator<ComposizioneOrdineBean> iterComposizione = listaComposizioneOrdine.iterator();
                    			ComposizioneOrdineBean composizione = new ComposizioneOrdineBean();
                    			List<ProdottoBean> listaProdotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
                    			List<DettaglioProdottoBean> listaDettagli = (List<DettaglioProdottoBean>) request.getSession().getAttribute("dettagliProdotti");
                    			Iterator<DettaglioProdottoBean> iterDettagli = null;
                    			Iterator<ProdottoBean> iterProdotto = null;
                    			ProdottoBean prodotto = new ProdottoBean();
                    			DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
                    		%>
                            <tbody>
                            <% while(iterComposizione.hasNext()){
                            	composizione = iterComposizione.next();	
                            	iterProdotto = listaProdotti.iterator();
                            	while(iterProdotto.hasNext()){
                            		prodotto = iterProdotto.next();
                            		if(prodotto.getCodiceSeriale().equals(composizione.getProdotto())) break;
                            	}
                            	
                            	iterDettagli = listaDettagli.iterator();
                            	while(iterDettagli.hasNext()){
                            		dettagli = iterDettagli.next();
                            		if(dettagli.getProdotto().equals(prodotto.getCodiceSeriale())) break;
                            	}
                            	
                            	costoNetto = ((composizione.getCostoUnitario().doubleValue() * composizione.getQuantitaProdotto()) * 100) / (100 + dettagli.getIVA());
                            	totNetto += costoNetto;
                            	%>
                                <tr>
                                    <td><% out.println(composizione.getProdotto()); %></td>
                                    <td><% out.println(prodotto.getNome()); %></td>
                                    <td><% out.println(composizione.getQuantitaProdotto()); %></td>
                                    <td><% out.println(df.format(costoNetto)); %> &euro;</td>
                                    <td><% out.println(dettagli.getIVA()); %></td>
                                    <td><span class="font-weight-semibold"><% out.println(df.format(composizione.getQuantitaProdotto() * composizione.getCostoUnitario().doubleValue())); %> &euro;</span></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-body">
                        <div class="d-md-flex flex-md-wrap">
                            <div class="pt-2 mb-3 wmin-md-400 ml-auto">
                                <h6 class="mb-3 text-left">Importo</h6>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                        	<tr>
                                                <th class="text-left">Totale netto:</th>
                                                <td class="text-right"><% out.println(df.format(totNetto)); %> &euro;</td>
                                            </tr>
                                            <tr>
                                                <th class="text-left">Totale:</th>
                                                <td class="text-right text-primary">
                                                    <h5 class="font-weight-semibold"><% out.println(ordine.getCostoTotale()); %> &euro;</h5>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>
                    <div class="card-footer"> <span class="text-muted">Snackz &copy; 2022</span> </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>

</html>
