# from os import error
import os
import asp
import subprocess
import re

def mkdir(path):
    if not os.path.exists(path):
        os.makedirs(path)

class Popper:
    ilasp=''
    xhail='xhail/xhail_mod.jar'
    name='popper'
    clasp='xhail/clasp-3.1.0-x86_64-linux'
    gringo='xhail/gringo3-linux'

    def __init__(self):
        pass


    def parse_train(self,datafile,outpath,game,target):
        for (bias,background,examples,subtarget) in self.parse(datafile,game,target):
            sub_outpath = outpath + subtarget + '/'
            mkdir(sub_outpath)
            with open('{}/bias.pl'.format(sub_outpath),'w') as f:
                f.write(bias)
            with open('{}/bk.pl'.format(sub_outpath),'w') as f:
                f.write(background)
            with open('{}/exs.pl'.format(sub_outpath),'w') as f:
                f.write(examples)


    def parse_test(self,datafile,outpath,game,target):
        for (bias,background,examples,subtarget) in self.parse(datafile,game,target):
            sub_outpath = outpath + subtarget + '/'
            mkdir(sub_outpath)
            with open('{}/bias.pl'.format(sub_outpath),'w') as f:
                f.write(bias)
            with open('{}/bk.pl'.format(sub_outpath),'w') as f:
                f.write(background)
            with open('{}/exs.pl'.format(sub_outpath),'w') as f:
                f.write(examples)


    # - inpath is the path for the game files (e.g. exp/aleph/train/minimal_decay/)
    # - outfile is the file to which to write the hypothesis (e.g. programs/aleph/minimal_decay/next_value.pl)
    # - target is the sub-target (e.g. next_value)
    # def train(self,inpath,outfile,target):
    #     infile = '{}{}.ilasp'.format(inpath,target)
    #     with open(outfile,'w') as f:
    #         cmd="java -jar {} -c {} -g {} {} -i 100".format(self.ilasp,self.clasp,self.gringo,infile)
    #         print(cmd)
    #         try:
    #             subprocess.run(cmd.split(' '),timeout=cfg.learning_timeout,stdout=f)
    #         except subprocess.TimeoutExpired:
    #             pass

    # - datapath is the name of the file with the test data (e.g. exp/aleph/test/minimal_decay)
    # - programf is the name of the file with the hypothesis (e.g. programs/aleph/minimal_decay/next_value.pl)
    # - outf is the name of the file to write the results (e.g. results/aleph/minimal_decay/next_value.pl)
    # the results file should be a csv where each line represents an example and is of the form prediction,label
    # for instance, the following 5 lines denote 3 positive examples and 2 negative examples (the second column), the learner misclassified the third example (predicted 0 when it should have been 1)
    # 1,1
    # 1,1
    # 0,1
    # 0,0
    # 0,0


    def do_test(self,dataf,programf,outf):
        pass


    def parse(self,filename,game,target):
        # print('HELLO')

        for sub_predicate in asp.get_subpredicate(game,target):
            print(sub_predicate)
            type_modes = {}
            head_preds = {}
            body_preds = {}

            constant_modes = []
            modes = ""
            background = ""
            examples = ""
            bias = "max_clauses(4).\nmax_vars(7).\nmax_body(6).\n"

            func_decs = []
            type_decs = []

            types = open('types/' + game + '.typ').read()
            for type_dec in re.finditer('([^\\.\\n]*)\\.', types):
                match = re.search('(.*[^ ]) *:: *([^ ].*)', type_dec.group(1))
                if match:
                    lhs = match.group(1).split(",")
                    rhs = match.group(2).split(" -> ")
                    if rhs[-1] != "bool":
                        if len(rhs) == 1:
                            for pred in lhs:
                                pred = pred.replace(" ", "")
                                type_decs.append({ "type": rhs[-1], "name": pred})
                                background += rhs[0] + '(' + pred + ').\n'
                                constant_modes.append(rhs[0] + "_" + pred + "(" + pred + ").\n")
                                # constant_modes.append("constant(" + rhs[0] + "_" + pred + ", " + rhs[0] + ").\n")
                                bias += "constant(" + rhs[0] + "_" + pred + ", " + rhs[0] + ").\n"

                            body_preds[rhs[0]] = "1"
                        else:
                            for pred in lhs:
                                pred = pred.replace(" ", "")
                                func_decs.append({ "type": rhs[-1], "name": pred, "body": rhs[:-1]})

            for type_dec in re.finditer('([^\\.\\n]*)\\.', types):
                match = re.search('(.*[^ ]) *:: *([^ ].*)', type_dec.group(1))
                if match:
                    lhs = match.group(1).split(", ")
                    rhs = match.group(2).split(" -> ")
                    if rhs[-1] == 'bool':
                        for pred in lhs:
                            if len(rhs) == 1:
                                if pred == sub_predicate:
                                    type_modes[pred]=("ex")
                                    head_preds[pred]="1"
                                # elif pred not in ["next", "terminal", "goal", "legal"]:
                                #     raise Exception("Not sure what this is")
                            else:
                                mds = self.fill_in_fns(rhs[:-1], func_decs, type_decs)
                                for md in mds:
                                    if pred + md["name"] == sub_predicate:
                                        #generate type
                                        # t = rhs[0]
                                        # for tp in rhs[1:-1]:
                                        #     t += "," + tp
                                        type_modes[sub_predicate] = "ex," + md["body"][:-1]

                                        m = str(len(md["body"][:-1].split(","))+1)
                                        head_preds[sub_predicate] = m
                                    elif pred not in ["next", "terminal", "goal", "legal"]:  
                                        #generate type
                                        # t = rhs[0]             
                                        # for tp in rhs[1:-1]:
                                        #     t += "," + tp
                                        type_modes[pred + md["name"]] = md["body"][:-1]

                                        m = str(len(md["body"][:-1].split(",")))
                                        body_preds[pred+md["name"]] = m

            herbrand_domain = []
            sets = open(filename).read().split("---")

            ctx = ""
            example_number = 0
            fixed_type = {}
            modes_we_care_about = set()

            max_examples_to_parse = 500

            for s in sets:
                splt = re.findall('[a-z][a-zA-Z0-9_\\(\\) ,]*', s)
                if splt != []:
                    if splt[0] == 'atoms':
                        herbrand_domain = splt[1:]
                    elif splt[0] == 'background':
                        example_number+=1
                        if(example_number > max_examples_to_parse):
                            break
                        ctx = ""
                        for a in splt[1:]:
                            split_a = a.split("(")

                            #mark the mode as one we care about
                            modes_we_care_about.add(split_a[0])

                            #try to fix type by adding example number
                            if split_a[0] not in fixed_type and split_a[0] not in head_preds:
                                if split_a[0] in type_modes:
                                    type_modes[split_a[0]] = "ex," + type_modes[split_a[0]]
                                if split_a[0] in body_preds:
                                    body_preds[split_a[0]] = str(int(body_preds[split_a[0]])+1)
                                fixed_type[split_a[0]] = True
                            if len(split_a) == 1:
                                ctx += a + '.\n'
                            else:
                                if split_a[1] != ')':
                                    ctx += split_a[0] + '(' + str(example_number) + ',' + split_a[1] + '.\n'
                                else:
                                    ctx += split_a[0] + '(' + str(example_number) + split_a[1] + '.\n'
                    elif splt[0] == 'positives':
                        incs = []
                        excs = []
                        for a in herbrand_domain:
                            split_a = a.split("(")
                            
                            #mark the mode as one we care about
                            modes_we_care_about.add(split_a[0])

                            #try to fix type by adding example number
                            if split_a[0] not in fixed_type and split_a[0] not in head_preds:
                                if split_a[0] in type_modes:
                                    type_modes[split_a[0]] = "ex," + type_modes[split_a[0]]
                                if split_a[0] in body_preds:
                                    body_preds[split_a[0]] = str(int(body_preds[split_a[0]])+1)
                                fixed_type[split_a[0]] = True
                                
                            if split_a[0] == sub_predicate:
                                if '()' in a or len(split_a) == 1:
                                    if a not in splt[1:]:
                                        excs.append("neg(" + split_a[0] + '('+ str(example_number) + ")).")
                                    else:
                                        incs.append("pos(" + split_a[0] + '('+ str(example_number) + ")).")
                                else:
                                    if a not in splt[1:]:
                                        excs.append("neg(" + split_a[0] + '('+ str(example_number) + ',' + split_a[1] + ").")
                                    else:
                                        incs.append("pos(" + split_a[0] + '('+ str(example_number) + ',' + split_a[1] + ").")
                        examples += "\n".join(incs) + '\n' + "\n".join(excs) + "\n"
                        background += ctx
                    elif splt[0] == 'statics':
                        for a in splt[1:]:
                            split_a = a.split("(")
                            modes_we_care_about.add(split_a[0])
                            if len(split_a) == 1:
                                background += a + '.\n'
                            else:
                                background += split_a[0] + '(' + split_a[1] + '.\n'

            for headPreds in head_preds:
                if headPreds in modes_we_care_about:
                    bias += "head_pred(" + headPreds + "," + head_preds[headPreds] + ").\n"
            for bodyPreds in body_preds:
                if bodyPreds in modes_we_care_about:
                    bias += "body_pred(" +  bodyPreds + "," + body_preds[bodyPreds] + ").\n"
            for typeMode in type_modes:
                if typeMode in modes_we_care_about:
                    check_for_coma = type_modes[typeMode].split(",")
                    if(len(check_for_coma) == 1):
                        type_modes[typeMode] += ","
                    bias += "type(" + typeMode + ",(" + type_modes[typeMode] + ")).\n"
            for constantMode in constant_modes:
                background += constantMode

            bias += "\n:-\n\tclause(C),\n\t#count{V : clause_var(C,V),var_type(C,V,ex)} != 1.\n"
            bias += "\nbody_pred(P,1):-\n\tconstant(P,_).\n\ntype(P,(T,)):-\n\tconstant(P,T).\n"

            # To avoid prolog warnings, group predicates together
            examples = '\n'.join(sorted(examples.split('\n')))
            background = '\n'.join(sorted(background.split('\n')))

            # Remove starting \n
            for i in range(0, len(examples)):
                if examples[i] != '\n':
                    examples = examples[i:]
                    break
            
            yield (bias,background,examples,sub_predicate)

    def fill_in_fns(self, arg_list, func_decs, type_decs):
        mds = [{"name": "", "body": ""}]
        for arg in arg_list:
            new_mds = []
            if any(td["type"] == arg for td in type_decs):
                for md in mds:
                    new_mds.append({"name": md["name"], "body": (md["body"] + arg + ",")})
            for fd in func_decs:
                if fd["type"] == arg:
                    fd_proc = self.fill_in_fns(fd["body"], func_decs, type_decs)
                    for md in mds:
                        for body in fd_proc:
                            new_mds.append({"name": md["name"] + "_" + fd["name"] + body["name"], "body": (md["body"] + body["body"])})
            mds = new_mds
        return mds
