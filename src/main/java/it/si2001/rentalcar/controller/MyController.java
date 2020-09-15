package it.si2001.rentalcar.controller;


import it.si2001.rentalcar.model.*;
import it.si2001.rentalcar.service.MezzoService;
import it.si2001.rentalcar.service.PrenotazioneService;
import it.si2001.rentalcar.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.time.LocalDate;
import java.time.Period;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class MyController {




    @Autowired
    private UserService userService;

    @Autowired
    private MezzoService mezzoService;

    @Autowired
    private PrenotazioneService prenotazioneService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;




    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String login (Model model, @RequestParam(value = "logout", required = false) String logout) {
        String errorMessge = null;
        if(logout != null) {
            errorMessge = "You have been successfully logged out !!";
        }
        model.addAttribute("errorMessge", errorMessge);
        return "login";
    }

    @RequestMapping(value = "/access_Denied")
    public ModelAndView login_errato (RedirectAttributes attributes){

        ModelAndView modelAndView = new ModelAndView("redirect:/");
        attributes.addFlashAttribute("credenziali","credenziali errate");


        return modelAndView;

    }

    @RequestMapping(value ="/homepage" ,method= RequestMethod.GET)
    public ModelAndView homepage (Principal principal, HttpSession session) {
        ModelAndView model = new ModelAndView("homepage");

        if (principal == null){
            return new ModelAndView("login").addObject("identifcazione","identificazione");
        }


        String email = principal.getName();
        User loggato = userService.getUserByEmail(email);
        List<User> allCustomers = userService.listAll(email);

        
        List<Prenotazione> allPrenotazioni = prenotazioneService.checkPrenotazioneByUser(loggato.getIdUtente());
        session.setAttribute("loggato",loggato);


        if (loggato.getPrivilegi()==1) {
            model.addObject("allUsers", allCustomers);
        }else
        {
            model.addObject("allPrenotazioni", allPrenotazioni);
        }
        return model;
    }

    @RequestMapping(value = "/profiloUtente", method = RequestMethod.GET)
    public ModelAndView myProfile (HttpSession session)
    {


        User utente = (User) session.getAttribute("loggato");

        System.out.println("Nome che sta andando a vedere il suo profilo: "+utente.getNome());


        ModelAndView modelAndView = new ModelAndView("profiloUtente");
        modelAndView.addObject("utente",utente);

        return  modelAndView;


    }

    @RequestMapping("/elimina")
    public String deleteCustomerForm(@RequestParam("idUtente") long id, Model model) {
        userService.delete(id);
        model.addAttribute("eliminato","Utente eliminato");
        return "redirect:/homepage";
    }

    @RequestMapping(value = "/modificaUtente", method = RequestMethod.GET)
    public ModelAndView editCustomerForm(@RequestParam("idUtenteElenco") long id, HttpSession session) {

        ModelAndView modelAndView = new ModelAndView("modificaUtente");
        User customer = userService.get(id);
        session.setAttribute("utente_da_modificare",customer);
        modelAndView.addObject("customer", customer);

        return  modelAndView;

    }

    @RequestMapping(value = "/modifica", method = RequestMethod.POST)
    public String modifyCustomer (@RequestParam("idUtenteElenco") long idUtente, RedirectAttributes attributes, HttpServletRequest request)
    {


        String email = request.getParameter("email_utente");
        String password = request.getParameter("password_utente");
        String nome = request.getParameter("nome_utente");
        String cognome = request.getParameter("cognome_utente");
        LocalDate birthday = LocalDate.parse(request.getParameter("data_utente"));

        User nuovo = userService.get(idUtente);
        String password_nuova = passwordEncoder.encode(password);

        nuovo.setNome(nome);
        nuovo.setCognome(cognome);
        nuovo.setEmail(email);
        nuovo.setPassword(password_nuova);
        nuovo.setPrivilegi(nuovo.getPrivilegi());

        userService.save(nuovo);
        attributes.addFlashAttribute("utente_modificato","Utente modificato con successo");

        return "redirect:/homepage";

    }


    @RequestMapping("/nuovoUtente")
    public String newUserForm(Map<String, Object> model) {
        User utente = new User();
        model.put("user", utente);
        return "nuovoUtente";
    }


    @RequestMapping(value = "/salvaUtente", method = RequestMethod.POST)
    public ModelAndView nuovoUtente (@ModelAttribute("user") User utente, RedirectAttributes attributes) {

        String password = passwordEncoder.encode(utente.getPassword());
        utente.setPassword(password);
        utente.setPrivilegi((short) 0);

        userService.save(utente);

        ModelAndView modelAndView = new ModelAndView("redirect:/homepage");
        attributes.addFlashAttribute("utente_creato","Utente creato con successo");

        return  modelAndView;


    }


    @RequestMapping(value ="/parcoAuto" ,method= RequestMethod.GET)
    public ModelAndView parcoAuto(HttpSession session, Principal principal, @ModelAttribute("mezzo")Mezzo veicolo){

        ModelAndView modelAndView = new ModelAndView("parcoAuto");
        String email = principal.getName();
        User loggato = userService.getUserByEmail(email);


        List<Mezzo> allVeicles = null;
        try {
            allVeicles = mezzoService.getAllVeicles();
            session.setAttribute("utente",loggato);
            modelAndView.addObject("elenco_mezzi",allVeicles);
        }catch (Exception ex){

            modelAndView = new ModelAndView("parcoAuto");
            modelAndView.addObject("errorMessage","Non ci sono veicoli");
        } finally {
            return modelAndView;
        }

    }


    @RequestMapping(value = "/aggiungiVeicolo", method = RequestMethod.POST)
    public ModelAndView aggiungiAuto (HttpServletRequest request,  RedirectAttributes attributes) {


        String casa = request.getParameter("casa_costruttrice");
        String modello = request.getParameter("modello_mezzo");
        String targa = request.getParameter("targa_mezzo");
        LocalDate data_immatricolazione =LocalDate.parse( request.getParameter("data_immatricolazione"));
        String tipologia = request.getParameter("tipologia_veicolo");
        System.out.println("tipologia dal form: "+tipologia);
        Converter converter = new Converter ();
        Tipologia.Tipologia_veicolo tipologia_veicolo = converter.convertToEntityAttribute(tipologia);

        Mezzo veicolo = new Mezzo(targa,casa,modello,data_immatricolazione,tipologia_veicolo);


        ModelAndView modelAndView = new ModelAndView("redirect:/parcoAuto");

        mezzoService.saveMezzo(veicolo);
        attributes.addFlashAttribute("mezzo_creato","Mezzo creato con successo");

        return  modelAndView;


    }

    @RequestMapping(value = "/eliminaVeicolo")
    public ModelAndView deleteCustomerForm(@RequestParam("targa") String targa, RedirectAttributes attributes) {

        ModelAndView modelAndView = new ModelAndView("redirect:/parcoAuto");
        mezzoService.deleteMezzo(targa);
        attributes.addFlashAttribute("eliminato","Mezzo eliminato con successo");



        return modelAndView;
    }

    @RequestMapping(value = "/modificaVeicolo", method = RequestMethod.GET)
    public ModelAndView modificaVeicoloForm(@RequestParam("targa") String targa, HttpSession session) {

        ModelAndView modelAndView = new ModelAndView("modificaVeicolo");
        Mezzo veicolo = mezzoService.get(targa);
        session.setAttribute("veicolo",veicolo);
        modelAndView.addObject("veicolo", veicolo);

        return  modelAndView;

    }

    @RequestMapping(value = "/modificaMezzo", method = RequestMethod.POST)
    public ModelAndView modificaVeicolo (@RequestParam("targa")String targa, RedirectAttributes attributes, HttpServletRequest request) {


        String casa = request.getParameter("casa_costruttrice1");
        String modello = request.getParameter("modello_mezzo1");
        String targa_nuova = request.getParameter("targa_mezzo1");
        LocalDate immatricolazione = LocalDate.parse(request.getParameter("data_immatricolazione1"));
        String tipologia = request.getParameter("tipologia_veicolo1");
        Converter converter = new Converter ();
        Tipologia.Tipologia_veicolo tipologia_veicolo = converter.convertToEntityAttribute(tipologia);



        ModelAndView modelAndView = new ModelAndView("redirect:/parcoAuto");
        Mezzo attuale = mezzoService.get(targa);
        attuale.setCasaCostruttrice(casa);
        attuale.setTipologiaVeicolo(tipologia_veicolo);
        attuale.setAnnoImmatricolazione(immatricolazione);
        attuale.setModello(modello);
        attuale.setTarga(targa_nuova);

        mezzoService.deleteMezzo(targa);

        mezzoService.saveMezzo(attuale);

        attributes.addFlashAttribute("mezzo_modificato","Mezzo modificato con successo");

        return modelAndView;

    }


    @RequestMapping(value = "/prenotaAuto",method = RequestMethod.GET)
    public ModelAndView prenotaAuto (@RequestParam("targaAuto")String targa){

        Mezzo mezzo = mezzoService.get(targa);
        ModelAndView modelAndView = new ModelAndView("prenotaAuto");
        modelAndView.addObject("veicolo",mezzo);

        return modelAndView;


    }


    @RequestMapping(value = "/prenotaVeicolo",method = RequestMethod.POST)
    public ModelAndView prenotaVeicolo (@RequestParam("targa")String targa, HttpSession session, HttpServletRequest request, RedirectAttributes attributes){


        User loggato = (User) session.getAttribute("loggato");
        Mezzo mezzo_richiedente = mezzoService.get(targa);

        ModelAndView modelAndView = new ModelAndView("redirect:/homepage");


        LocalDate data_inizio =LocalDate.parse(request.getParameter("data_inizio"));
        LocalDate data_fine = LocalDate.parse(request.getParameter("data_fine"));


        List<Prenotazione> prenotazioni = prenotazioneService.checkPrenotazioneByMezzo(mezzo_richiedente);

        if (!prenotazioni.isEmpty()) {
            for (Prenotazione c : prenotazioni) {
                //confronta le date della nuova prenotazione con quelle di altre prenotazioni con
                //lo stesso mezzo
                if (!c.getFinePrenotazione().equals(data_inizio) && !data_inizio.equals(c.getInizioPrenotazione())) {

                    //se non ne trova cicla e non dovrebbe entrare nell'else

                } else {

                    //se ne trova anche solo una dice all'utente che l'auto è già prenotata
                    attributes.addFlashAttribute("errore_data", "In questa data l'auto è già stata prenotata");
                    return modelAndView;
                }
            }
        }


        prenotazioneService.savePrenotazione(new Prenotazione(data_inizio,data_fine,loggato.getIdUtente(),mezzo_richiedente));
        attributes.addFlashAttribute("successo_prenotazione","Prenotazione effettuata con successo");

        return  modelAndView;


    }



    @RequestMapping(value = "/eliminaPrenotazione")
    public ModelAndView eliminaPrenotazione (@RequestParam("idPrenotazione")Long idPrenotazione,RedirectAttributes attributes) {

        ModelAndView modelAndView = new ModelAndView("redirect:/homepage");

        Prenotazione da_eliminare = prenotazioneService.checkPrenotazione(idPrenotazione);
        prenotazioneService.deletePrenotazione(da_eliminare);
        attributes.addFlashAttribute("prenotazione_eliminata","Prenotazione eliminata con successo");


        return  modelAndView;
    }


    @RequestMapping(value = "/modificaPrenotazione", method = RequestMethod.GET)
    public ModelAndView modificaPrenotazione (@RequestParam("idPrenotazione")Long idPrenotazione,RedirectAttributes attributes){


        ModelAndView modelAndView = new ModelAndView("modificaPrenotazione");
        Prenotazione da_modificare = prenotazioneService.checkPrenotazione(idPrenotazione);
        LocalDate myLocal = LocalDate.now();
        Period period = Period.between(myLocal, da_modificare.getInizioPrenotazione());

        //gestione della possibilità di modificare prima di due giorni altrimenti no
        if (da_modificare.getStatus_prenotazione()==1) {
            if (period.getDays() <= 2) {

                attributes.addFlashAttribute("impossibile_modificare","Non è più possibile modificare la prenotazione.");
                return new ModelAndView("redirect:/homepage");

            }
        }

        modelAndView.addObject("da_modificare",da_modificare);

        return modelAndView;
    }


    @RequestMapping(value = "/modificaPrenot", method = RequestMethod.POST)
    public ModelAndView modificaPrenot (@RequestParam("idPrenotazione")Long idPrenotazione, HttpServletRequest request){

        ModelAndView modelAndView = new ModelAndView("redirect:/homepage");

        LocalDate data_inizio = LocalDate.parse(request.getParameter("data_inizio"));
        LocalDate data_fine = LocalDate.parse(request.getParameter("data_fine"));

        Prenotazione da_modificare = prenotazioneService.checkPrenotazione(idPrenotazione);

        return  modelAndView;
    }

    @RequestMapping(value = "/visualizzaPrenotazioni",method = RequestMethod.GET)
    public ModelAndView visualizzaPrenotazioni(@RequestParam("idUtente")Long idUtente){

        ModelAndView modelAndView = new ModelAndView("visualizzaPrenotazioni");
        List<Prenotazione> prenotazioni = prenotazioneService.checkPrenotazioneByUser(idUtente);
        User utente_selezionato = userService.getUserById(idUtente);
        modelAndView.addObject("elenco_prenotazioni_utenti",prenotazioni);
        modelAndView.addObject("utente_selezionato",utente_selezionato);

        return  modelAndView;
    }

    @RequestMapping(value = "/gestionePrenotazioni")
    public ModelAndView gestionePrenotazioni (@RequestParam("idPrenotazione")Long idPrenotazione,RedirectAttributes attributes) {

        ModelAndView modelAndView = new ModelAndView("redirect:/homepage");
        Prenotazione prenotazione = prenotazioneService.checkPrenotazione(idPrenotazione);
        prenotazione.setStatus_prenotazione(1);
        prenotazioneService.savePrenotazione(prenotazione);
        attributes.addFlashAttribute("accettata","Prenotazione utente accettata");


        return modelAndView;
    }


}
