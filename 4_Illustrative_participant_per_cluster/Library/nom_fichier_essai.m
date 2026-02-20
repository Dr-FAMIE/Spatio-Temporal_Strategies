function [ filename ] = nom_fichier_essai( categorie, sujet, serie, essai )

%UNTITLED2 Summary of this function goes here



if categorie == 'A';
    if serie == 1;
    filename = [categorie,'_sujet',sujet, '_25_alu_0_s1','_E',essai, '.mat'];
    elseif serie == 2;
    filename = [categorie,'_sujet',sujet, '_25_alu_m10_s2','_E',essai, '.mat'];
    elseif serie == 3;
    filename = [categorie,'_sujet',sujet, '_25_alu_p10_s3','_E',essai, '.mat'];
    elseif serie == 4;
    filename = [categorie,'_sujet',sujet, '_25_balsa_0_s4','_E',essai, '.mat'];
    elseif serie == 5;
    filename = [categorie,'_sujet',sujet, '_25_balsa_m10_s5','_E',essai, '.mat'];
    elseif serie == 6;
    filename = [categorie,'_sujet',sujet, '_25_balsa_p10_s6','_E',essai, '.mat'];
    elseif serie == 7;
    filename = [categorie,'_sujet',sujet, '_50_alu_0_s7','_E',essai, '.mat'];
    elseif serie == 8;
    filename = [categorie,'_sujet',sujet, '_50_alu_m10_s8','_E',essai, '.mat'];
    elseif serie == 9;
    filename = [categorie,'_sujet',sujet, '_50_alu_p10_s9','_E',essai, '.mat'];
    elseif serie == 10;
    filename = [categorie,'_sujet',sujet, '_50_balsa_0_s10','_E',essai, '.mat'];
    elseif serie == 11;
    filename = [categorie,'_sujet',sujet, '_50_balsa_m10_s11','_E',essai, '.mat'];
    elseif serie == 12;
    filename = [categorie,'_sujet',sujet, '_50_balsa_p10_s12','_E',essai, '.mat'];
    end

elseif categorie == 'B'
    if serie == 1;
    filename = [categorie,'_sujet',sujet, '_25_alu_0_s1','_E',essai, '.mat'];
    elseif serie == 2;
    filename = [categorie,'_sujet',sujet, '_25_alu_p10_s2','_E',essai, '.mat'];
    elseif serie == 3;
    filename = [categorie,'_sujet',sujet, '_25_alu_m10_s3','_E',essai, '.mat'];
    elseif serie == 4;
    filename = [categorie,'_sujet',sujet, '_25_balsa_0_s4','_E',essai, '.mat'];
    elseif serie == 5;
    filename = [categorie,'_sujet',sujet, '_25_balsa_p10_s5','_E',essai, '.mat'];
    elseif serie == 6;
    filename = [categorie,'_sujet',sujet, '_25_balsa_m10_s6','_E',essai, '.mat'];
    elseif serie == 7;
    filename = [categorie,'_sujet',sujet, '_50_alu_0_s7','_E',essai, '.mat'];
    elseif serie == 8;
    filename = [categorie,'_sujet',sujet, '_50_alu_p10_s8','_E',essai, '.mat'];
    elseif serie == 9;
    filename = [categorie,'_sujet',sujet, '_50_alu_m10_s9','_E',essai, '.mat'];
    elseif serie == 10;
    filename = [categorie,'_sujet',sujet, '_50_balsa_0_s10','_E',essai, '.mat'];
    elseif serie == 11;
    filename = [categorie,'_sujet',sujet, '_50_balsa_p10_s11','_E',essai, '.mat'];
    elseif serie == 12;
    filename = [categorie,'_sujet',sujet, '_50_balsa_m10_s12','_E',essai, '.mat'];
    end

elseif categorie == 'C'
    if serie == 1;
    filename = [categorie,'_sujet',sujet, '_25_balsa_0_s1','_E',essai, '.mat'];
    elseif serie == 2;
    filename = [categorie,'_sujet',sujet, '_25_balsa_m10_s2','_E',essai, '.mat'];
    elseif serie == 3;
    filename = [categorie,'_sujet',sujet, '_25_balsa_p10_s3','_E',essai, '.mat'];
    elseif serie == 4;
    filename = [categorie,'_sujet',sujet, '_25_alu_0_s4','_E',essai, '.mat'];
    elseif serie == 5;
    filename = [categorie,'_sujet',sujet, '_25_alu_m10_s5','_E',essai, '.mat'];
    elseif serie == 6;
    filename = [categorie,'_sujet',sujet, '_25_alu_p10_s6','_E',essai, '.mat'];
    elseif serie == 7;
    filename = [categorie,'_sujet',sujet, '_50_balsa_0_s7','_E',essai, '.mat'];
    elseif serie == 8;
    filename = [categorie,'_sujet',sujet, '_50_balsa_m10_s8','_E',essai, '.mat'];
    elseif serie == 9;
    filename = [categorie,'_sujet',sujet, '_50_balsa_p10_s9','_E',essai, '.mat'];
    elseif serie == 10;
    filename = [categorie,'_sujet',sujet, '_50_alu_0_s10','_E',essai, '.mat'];
    elseif serie == 11;
    filename = [categorie,'_sujet',sujet, '_50_alu_m10_s11','_E',essai, '.mat'];
    elseif serie == 12;
    filename = [categorie,'_sujet',sujet, '_50_alu_p10_s12','_E',essai, '.mat'];
    end

elseif categorie == 'D'
    if serie == 1;
    filename = [categorie,'_sujet',sujet, '_25_balsa_0_s1','_E',essai, '.mat'];
    elseif serie == 2;
    filename = [categorie,'_sujet',sujet, '_25_balsa_p10_s2','_E',essai, '.mat'];
    elseif serie == 3;
    filename = [categorie,'_sujet',sujet, '_25_balsa_m10_s3','_E',essai, '.mat'];
    elseif serie == 4;
    filename = [categorie,'_sujet',sujet, '_25_alu_0_s4','_E',essai, '.mat'];
    elseif serie == 5;
    filename = [categorie,'_sujet',sujet, '_25_alu_p10_s5','_E',essai, '.mat'];
    elseif serie == 6;
    filename = [categorie,'_sujet',sujet, '_25_alu_m10_s6','_E',essai, '.mat'];
    elseif serie == 7;
    filename = [categorie,'_sujet',sujet, '_50_balsa_0_s7','_E',essai, '.mat'];
    elseif serie == 8;
    filename = [categorie,'_sujet',sujet, '_50_balsa_p10_s8','_E',essai, '.mat'];
    elseif serie == 9;
    filename = [categorie,'_sujet',sujet, '_50_balsa_m10_s9','_E',essai, '.mat'];
    elseif serie == 10;
    filename = [categorie,'_sujet',sujet, '_50_alu_0_s10','_E',essai, '.mat'];
    elseif serie == 11;
    filename = [categorie,'_sujet',sujet, '_50_alu_p10_s11','_E',essai, '.mat'];
    elseif serie == 12;
    filename = [categorie,'_sujet',sujet, '_50_alu_m10_s12','_E',essai, '.mat'];
    end
end


end

