from  faker import Faker
from robot.api.deco import keyword

ALPHABET = ('a', 'b', 'c', 'd','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')

@keyword('Generate string')
def generate_prj_name():
    fak = Faker()
    res_str = ''.join(fak.random_choices(elements=ALPHABET, length=15))
    res_num = ''.join(fak.random_choices(elements=('0','1','2','3','4','5'), length=3))
    return res_str + res_num


@keyword('Generate description')
def generate_desc():
    fak = Faker()
    return fak.text()


@keyword('Check contain url')
def url_contain_text(url, text):
    if str(url).find(text) !=-1:
        return 'URL ({}) contain text: {}'.format(url, text)
    else:
        error_text = 'URL ({}) not contain text: {}'.format(url, text)
        raise Exception(error_text)



if __name__== '__main__':
    print(url_contain_text('http://localhost/projects/test_project_1/issues', '123123'))