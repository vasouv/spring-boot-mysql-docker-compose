package vs.springbootmysqldockercompose;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("developers")
public class DeveloperController {

    private final DeveloperRepository developerRepository;

    @GetMapping
    public List<Developer> findAll() {
        return developerRepository.findAll();
    }

}
