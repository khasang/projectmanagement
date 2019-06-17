package io.khasang.pm.controller;

import io.khasang.pm.dto.DocumentDto;
import io.khasang.pm.entity.Document;
import io.khasang.pm.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/doc")
public class DocumentController {

    private DocumentService documentService;

    @RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Document addDocument(@RequestBody Document document) {
        return documentService.add(document);
    }

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public DocumentDto getById(@PathVariable("id") long id) {
        return documentService.getById(id);
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    @ResponseBody
    public List<DocumentDto> getAll() {
        return documentService.getAll();
    }

    @RequestMapping(value = "/update", method = RequestMethod.PUT, produces = "application/json;charset=utf-8")
    @ResponseBody
    public DocumentDto update(@RequestBody Document document){
        return documentService.update(document);
    }

    @RequestMapping(value = "/del/{id}", method = RequestMethod.DELETE, produces = "application/json;charset=utf-8")
    @ResponseBody
    public DocumentDto delete(@PathVariable("id") long id){
        return documentService.delete(id);
    }

    @Autowired
    public void setDocumentService(DocumentService documentService) {
        this.documentService = documentService;
    }
}
