var recettes = [
    Recette(
        titre: "Poulet curry aux oignons",
        description: "Spécialité indienne assaisonnée au paprika et au curry",
        image: "poulet-curry",
        auteur: "Jane Doe",
        categories: ["Repas"],
        region: .asieDuSud,
        nbPersonnes: 4,
        difficulte: .facile,
        temps: 20,
        ingredients: [
            Ingredient(nom: "oignon", quantite: "1", unite: "", suppression: false),
            Ingredient(nom: "blanc de poulet", quantite: "500", unite: "gr", suppression: false),
            Ingredient(nom: "créme fraiche", quantite: "300", unite: "g", suppression: false),
            Ingredient(nom: "cumain", quantite: "2", unite: "cc", suppression: false),
            Ingredient(nom: "curry", quantite: "2", unite: "cc", suppression: false),
        ],
        instructions: """
        ÉTAPE 1
        
        Mettre une grande poêle à chauffer. Couper les oignons en petits morceaux, et les faire cuire à feu assez fort.

        ÉTAPE 2

        Remuer, en ajoutant du curry et du cumin.

        ÉTAPE 3

        Couper les blancs de poulet en morceaux, les ajouter dans la poêle et remettre des épices; tourner.

        ÉTAPE 4

        Baisser le feu, et ajouter 2 cuillères à soupe de crème.

        ÉTAPE 5

        Après 5 min de cuisson, remettre 2 cuillères à soupe de crème et des épices (si nécessaire).

        ÉTAPE 6
        Si le plat est fait à l'avance, remettre un peu de crème au moment de réchauffer car la sauce s'évapore.

        ÉTAPE 7
        Bon appétit
        """,
        ustensiles: "Poêle, couteau, cuillère, planche à découper"),
    
    Recette(
        titre: "Ragoût de bœuf",
        description: "Spécialité indienne assaisonnée au paprika et au curry",
        image: "ragout-boeuf",
        auteur: "Jane Doe",
        categories: ["Repas"],
        region: .asieDuSud,
        nbPersonnes: 4,
        difficulte: .facile,
        temps: 135,
        ingredients: [
            Ingredient(nom: "bœuf", quantite: "500", unite: "g", suppression: false),
            Ingredient(nom: "ail", quantite: "4", unite: "gousses", suppression: false),
            Ingredient(nom: "tomates concentré", quantite: "1", unite: "cs", suppression: false),
            Ingredient(nom: "beurre", quantite: "100", unite: "g", suppression: false),
            Ingredient(nom: "citron", quantite: "1", unite: "jus", suppression: false),
            Ingredient(nom: "paprika", quantite: "1", unite: "cc", suppression: false),
            Ingredient(nom: "curry", quantite: "1", unite: "cc", suppression: false),
            Ingredient(nom: "vin-rouge", quantite: "1", unite: "verre", suppression: false),
            Ingredient(nom: "lait de coco", quantite: "1/5", unite: "L", suppression: false),
            Ingredient(nom: "riz", quantite: "250", unite: "g", suppression: false)
        ],
        
        instructions: """
        ÉTAPE 1
        Mélangez les gousses d'ail ecrasées, le vin, le jus de citron, la moitié du curry et le concentré de tomates.

        ÉTAPE 2
        Laissez mariner la viande en morceaux dans cette préparation, 3 heures au frais.

        ÉTAPE 3
        Faites revenir la viande dans l'huile et dans 20 g de beurre.

        ÉTAPE 4
        Retirez la viande.

        ÉTAPE 5
        Ajouter le reste de beurre dans les sucs de cuisson puis faites revenir les oignons et les poivrons coupés en morceaux 5 min.

        ÉTAPE 6
        Remettez la viande, versez le lait de coco et le bouillon, ajouter le reste du curry et le piment.

        ÉTAPE 7
        Couvrez et laissez mijoter 1h30 en remuant.

        ÉTAPE 8
        Servir avec du riz parfumé.
        """,
        ustensiles: "Poêle, couteau, cuillère, planche à découper, cocotte"),

    Recette(
        titre: "Soupe à la citrouille",
        description: "Spécialité indienne assaisonnée au paprika et au curry",
        image: "soupe de butternut",
        auteur: "Jane Doe",
        categories: ["Repas"],
        region: .asieDuSud,
        nbPersonnes: 4,
        difficulte: .facile,
        temps: 20,
               ingredients: [
            Ingredient(nom: "curry", quantite: "1", unite: "cc", suppression: false),
            Ingredient(nom: "crème entière", quantite: "50", unite: "cl", suppression: false),
            Ingredient(nom: "citrouilles", quantite: "250", unite: "g", suppression: false)
        ],
        instructions: """
        ÉTAPE 1
        Faire cuire le potiron à la casserole, ajouter les pommes de terre s'il y a trop d'eau.

        ÉTAPE 2
        Mixer avec le lait pour lier le tout, ajouter un peu de crème, saler, poivrer et n'oublier pas le curry qui fera toute la différence.
        """,
        ustensiles: "Poêle, couteau, cuillère, planche à découper, mixeur, cocotte"),
    
    Recette(
        titre: "Butter chicken",
        description: "Probablement une de mes recettes coup de cœur ! Le poulet au beurre (ou butter chicken en anglais) est l’un des currys indiens les plus populaires au monde aujourd’hui. C’est un curry assez doux qui ravira tous les palais !",
        image: "butter-chicken",
        auteur: "Jane Doe",
        categories: ["Repas"],
        region: .asieDuSud,
        nbPersonnes: 6,
        difficulte: .facile,
        temps: 40,
        ingredients: [
            Ingredient(nom: "poulet", quantite: "750", unite: "g", suppression: false),
            Ingredient(nom: "ghee", quantite: "150", unite: "g", suppression: false),
            Ingredient(nom: "oignons", quantite: "2", unite: "", suppression: false),
            Ingredient(nom: "cannelle, cumin, massala", quantite: "1", unite: "càc", suppression: false),
            Ingredient(nom: "yaourt", quantite: "1", unite: "pot", suppression: false)
        ],
        instructions: """
        ÉTAPE 1
        Préparer la marinade : mélanger 1 pot de yaourt avec les massalas (tandoori et garam), cannelle, clous de girofle et cumin. Saler.

        ÉTAPE 2
        Enduire les morceaux de poulet et laisser mariner au moins 1 heure.

        ÉTAPE 3
        Préchauffer le four au maximum (un four tandoor est une vraie fournaise !) et faites-y cuire le poulet pendant 10 mn.

        ÉTAPE 4
        Retirer et laisser reposer.

        ÉTAPE 5
        Dans une cocotte, faire fondre le ghee et y faire blondir les oignons, puis ajouter la pâte ail/gingembre et laisser frire quelques minutes. Ajouter une cuillerée d'eau de temps à autre pour éviter que ça attache.

        ÉTAPE 8
        Laisser cuire jusqu'à ce que la matière grasse se sépare.

        ÉTAPE 9
        Ajouter la pâte de noix de cajou, lapoudre de piment, la purée de tomate et laisser cuire 10 min à feu doux. Ajouter le second pot de youghourt, la crème fouettée et les morceaux de poulet. Bien mélanger et laisser mijoter encore 15 à 20 mn.

        ÉTAPE 11
        Dresser sur un plat creux et parsemer de feulles de coriandre hachées. Bonne dégustation !
        """,
        ustensiles: "Poêle, couteau, cuillère, planche à découper, mixeur, pinceau, cocotte"),
    
    Recette(
        titre: "Mafé",
        description: "Spécialité africaine",
        image: "mafe",
        auteur: "Jane Doe",
        categories: ["Repas"],
        region: .afriqueCentrale,
        nbPersonnes: 4,
        difficulte: .facile,
        temps: 75,
         ingredients: [
            Ingredient(nom: "poulet", quantite: "500", unite: "g", suppression: false),
            Ingredient(nom: "netatou poudre", quantite: "3", unite: "càc", suppression: false),
            Ingredient(nom: "boîte sauce tomate", quantite: "200", unite: "g", suppression: false),    Ingredient(nom: "huile d'arachide", quantite: "4", unite: "càs", suppression: false),
            Ingredient(nom: "patates douces ", quantite: "2", unite: "", suppression: false)
        ],
        instructions: """
        ÉTAPE 1
        Faire revenir le poulet dans l'huile d'arachide bien chaude.

        ÉTAPE 2
        Les réserver (les retirer du feu).

        ÉTAPE 3
        Faire revenir les oignons et le piment oiseau jusqu'à coloration.

        ÉTAPE 4
        Rajouter ensuite la tomate concentrée et les deux gousses d'ail (ciselé). Laisser cuire 2 mn.

        ÉTAPE 5
        Rajouter l'eau, les pommes de terre et les patates douces. Laisser cuire pendant 20 mn.

        ÉTAPE 6
        Rajouter ensuite la pâte d'arachide, assaisonner (sel poivre).

        ÉTAPE 7
        Aprés 2 mn de cuisson ajouter le netatou et laisser cuire jusqu'à épaississemnt de la sauce (bien consistant).

        ÉTAPE 8
        Remettre le poulet dans la sauce avec les deux piments antillais (sans les écraser surtout !).

        ÉTAPE 9
        Laisser cuire à feu doux et à semi couvert pendant 30 mn.
        """,
        ustensiles: "Poêle, couteau, cuillère, planche à découper"),
    
    Recette(
        titre: "Tzatziki",
        description: "Spécialité grecque au concombre",
        image: "tzatziki",
        auteur: "Jane Doe",
        categories: ["entrée"],
        region: .europe,
        nbPersonnes: 4,
        difficulte: .facile,
        temps: 15,
        ingredients: [
            Ingredient(nom: "concombre", quantite: "1", unite: "", suppression: false),
            Ingredient(nom: "menthe", quantite: "1", unite: "bouquet", suppression: false), Ingredient(nom: "yoghort grec", quantite: "1", unite: "pot", suppression: false),
            Ingredient(nom: "huile d'oilive", quantite: "4", unite: "càs", suppression: false),
            Ingredient(nom: "ail", quantite: "1", unite: "gousse", suppression: false)
        ],
        instructions: """
        ÉTAPE 1
        Éplucher et râper le concombre, puis le mettre à égoutter dans une passoire (l'astuce est de saler le concombre pour le faire dégorger plus vite).

        ÉTAPE 2
        Dans un saladier, mettre les yaourts, l'huile, le vinaigre, le poivre et la gousse d'ail écrasée.

        ÉTAPE 3
        Hâcher ou couper en morceaux très fins la menthe et la rajouter dans le saladier.

        ÉTAPE 4
        "Essorer" le concombre râpé et l'ajouter à la préparation. Saler si nécessaire et mélanger.

        ÉTAPE 5
        Mettre au frais au moins 2 heures et servir.

        ÉTAPE 6
        Déguster seul, avec du pain ou en accompagnement de salades.
        """,
        ustensiles: "couteau, cuillère, planche à découper"),
    
    Recette(
        titre: "Spaghettis bolognaise",
        description: "Spécialité italienne",
        image: "bolognese",
        auteur: "Jane Doe",
        categories: ["Repas"],
        region: .europe,
        nbPersonnes: 8,
        difficulte: .facile,
        temps: 50,
        ingredients: [
            Ingredient(nom: "huile d'olive", quantite: "5", unite: "càs", suppression: false),
            Ingredient(nom: "oignons", quantite: "3", unite: "", suppression: false),
            Ingredient(nom: "boîte sauce tomate", quantite: "200", unite: "g", suppression: false),
            Ingredient(nom: "vin", quantite: "50", unite: "cl", suppression: false),
            Ingredient(nom: "boeuf haché", quantite: "400", unite: "g", suppression: false),
            Ingredient(nom: "champignons", quantite: "100", unite: "g", suppression: false)
        ],
        instructions: """
        ÉTAPE 1
        La cuisson se fait dans une sauteuse. Faire revenir dans de l'huile d'olive chaude l'oignon et les 2 gousses d'ail grossièrement hachés, à petit feu pour ne pas qu'ils brûlent. Mélanger souvent.

        ÉTAPE 2
        Quand les oignons ont blondis, rajouter les carottes et le navet coupés en petits dés et cuire à feu moyen 5 mn tout en mélangeant souvent.

        ÉTAPE 3
        Ajouter 400 g de boeuf haché et cuire en mélangeant souvent, jusqu'à ce que la viande soit un peu cuite.

        ÉTAPE 4
        Ajouter les champignons et mélanger.

        ÉTAPE 5
        Ajouter le vin et laisser mijoter à feu moyen jusqu'à ce que le vin se soit presque entièrement évaporé.

        ÉTAPE 6
        Ajouter le bocal de tomates et la boîte de concentré et mélanger. Baisser le feu.

        ÉTAPE 7
        Ajouter 4 pincées de sucre en poudre, sel et poivre (attnetion, pas de trop, il vaut mieux en rajouter par la suite), éventuelles herbes de Provence et feuilles de laurier.

        ÉTAPE 8
        Mélanger puis laisser cuire 45 mn à 1h environ, jusqu'à ce que le jus des tomates pelées soit pratiquement disparu. Mélanger de temps en temps pendant la cuisson et surtout ne pas couvrir d'un couvercle.

        ÉTAPE 9
        Oter les feuilles de laurier et servez
        """,
        ustensiles: "Poêle, couteau, cuillère, planche à découper, Casserole"),
    

    Recette(
        titre: "Houmous",
        description: "Spécialité libanaise du proche-Orient composé de pois-chiche",
        image: "houmous",
        auteur: "Jane Doe",
        categories: ["Repas"],
        region: .asieOccidentale,
        nbPersonnes: 7,
        difficulte: .facile,
        temps: 150,
        ingredients: [
            Ingredient(nom: "pois chiches", quantite: "500", unite: "g", suppression: false),
            Ingredient(nom: "eau", quantite: "2", unite: "L", suppression: false),
            Ingredient(nom: "laurier", quantite: "5", unite: "feuille", suppression: false),
            Ingredient(nom: "ail", quantite: "1", unite: "gousse", suppression: false),
            Ingredient(nom: "citron", quantite: "2", unite: "", suppression: false),
            Ingredient(nom: "olives", quantite: "5", unite: "", suppression: false),
            Ingredient(nom: "huile", quantite: "1O", unite: "cl", suppression: false),
            Ingredient(nom: "sel", quantite: "1", unite: "cc", suppression: false),
            Ingredient(nom: "poivre", quantite: "1", unite: "cc", suppression: false),
            Ingredient(nom: "piment", quantite: "1", unite: "pincée", suppression: false),
            Ingredient(nom: "pain libanais", quantite: "", unite: "", suppression: false),
        ],
        
        instructions: """
        ÉTAPE 1
        La veille, mettre à tremper les pois chiches dans de l'eau froide.

        ÉTAPE 2
        Les mettre dans 2 l d'eau froide avec le laurier et 1 gousse d'ail, porter à ébullition et laisser cuire 1 h 30 à 2 h.

        ÉTAPE 3
        Saler et poivrer à mi-cuisson.

        ÉTAPE 4
        Egoutter les pois chiches, conserver l'eau de cuisson.

        ÉTAPE 5
        Mixer les pois chiches en purée, remettre dans une casserole et chauffer à feu doux.

        ÉTAPE 6
        Incorporer 10 cl d'huile tiède en fouettant, allonger un peu de jus de cuissons et du jus de citron.

        ÉTAPE 7
        Piler l'ail au mortier avec 2 cuillerées d'huile, rajouter cela dans la casserole hors du feu, saupoudrer 1 pincée de piment.

        ÉTAPE 8
        Servir saupoudré de paprika, garni d'olives noires et accompagné de quartiers de citrons.

        ÉTAPE 9
        Sans oublier le pain grillé ou le pain libanais !
        """,
        ustensiles: "Casserole, couteau, cuillère, planche à découper"),
    
    Recette(
        titre: "Le Guacamole maison",
        description: "Préparation méxicaine à base d'avocat et de piments frais.",
        image: "guacamole",
        auteur: "Jane Doe",
        categories: ["Repas"],
        region: .ameriqueDuSud,
        nbPersonnes: 4,
        difficulte: .facile,
        temps: 10,
        ingredients: [
            Ingredient(nom: "oignone", quantite: "1", unite: "", suppression: false),
            Ingredient(nom: "coriande", quantite: "200", unite: "g", suppression: false),
            Ingredient(nom: "avocat", quantite: "1", unite: "", suppression: false),
            Ingredient(nom: "citron", quantite: "1", unite: "", suppression: false),
            Ingredient(nom: "sel", quantite: "", unite: "cc", suppression: false),
            Ingredient(nom: "poivre", quantite: "", unite: "", suppression: false),
        ],
        
        instructions: """
        ÉTAPE 1
        Emincer l'oignon frais et les feuilles de coriandre.

        ÉTAPE 2
        Ecraser l'avocat, ajouter l'oignon, la coriandre, le jus d'un (ou 2 selon les goûts) citron et salez votre goût.

        ÉTAPE 3
        Idéal avec des nachos (chips de maïs) ou encore en accompagnement de viandes grillées.
        """,
        ustensiles: "couteau, cuillère, planche à découper"),
    
    Recette(
        titre: "Pad thaï",
        description: "Plat traditionnel thaïlandais à base de nouilles de riz",
        image: "PadThai",
        auteur: "Jane Doe",
        categories: ["Repas"],
        region: .asieDuSudEst,
        nbPersonnes: 2,
        difficulte: .facile,
        temps: 20,
        ingredients: [
            Ingredient(nom: "pate - thai", quantite: "250", unite: "g", suppression: false),
            Ingredient(nom: "carotte", quantite: "2", unite: "", suppression: false),
            Ingredient(nom: "poulet", quantite: "250", unite: "g", suppression: false),
            Ingredient(nom: "oeufs", quantite: "2", unite: "", suppression: false),
            Ingredient(nom: "huile de tournesol", quantite: "2", unite: "cs", suppression: false),
            Ingredient(nom: "soja frais", quantite: "", unite: "", suppression: false),
            Ingredient(nom: "feuile d'ail", quantite: "", unite: "", suppression: false),
            Ingredient(nom: "sauce thai", quantite: "1", unite: "cs", suppression: false),
        ],
        
        instructions: """
        ÉTAPE 1
        Disposez les pâtes, les carottes et le poulet dans de l’eau bouillante non salée et faites cuire le tout pendant 1 minute.

        ÉTAPE 2
        Dans une poêle, à feu vif, faites chauffer de l’huile de tournesol, y casser les œufs, et brouillez les jusqu’à ce qu’ils soient cuits.

        ÉTAPE 3
        Après avoir égoutté les pâtes, les carottes et le poulet, versez vos ingrédients dans votre poêle chaude avec les œufs. Faites sauter le tout à feu moyen pendant 1 minute.

        ÉTAPE 4
        Ajoutez la sauce thaï et faites sauter jusqu’à absorption de la sauce.

        ÉTAPE 5
        Ajoutez les feuilles d’ail et le soja frais, faites sauter environ 1 minute.

        ÉTAPE 6
        Servez dans une assiette, et parsemez de cacahuètes.
        """,
        ustensiles: "Poêle, couteau, cuillère, planche à découper, Wok"),
    
    Recette(
        titre: "Couscous poulet merguez",
        description: "Plat berbère de semoule de blé accompagné de ses multiples légumes",
        image: "Couscous",
        auteur: "Jane Doe",
        categories: ["Repas"],
        region: .afriqueDuNord,
        nbPersonnes: 6,
        difficulte: .facile,
        temps: 65,
        ingredients: [
            Ingredient(nom: "carottes", quantite: "2", unite: "", suppression: false),
            Ingredient(nom: "navets", quantite: "1", unite: "", suppression: false),
            Ingredient(nom: "courgette", quantite: "2", unite: "", suppression: false),
            Ingredient(nom: "pois chiches", quantite: "100", unite: "g", suppression: false),
            Ingredient(nom: "tomates", quantite: "4", unite: "", suppression: false),
            Ingredient(nom: "tomates concentré", quantite: "1", unite: "cs", suppression: false),
            Ingredient(nom: "harissa", quantite: "1 a 2", unite: "cc", suppression: false),
            Ingredient(nom: "épices a couscous", quantite: "2 ", unite: "cc", suppression: false),
            Ingredient(nom: "semoule fine", quantite: "350", unite: "g", suppression: false),
            Ingredient(nom: "eau", quantite: "1", unite: "L", suppression: false),
            Ingredient(nom: "huil d'olive", quantite: "2 a 3", unite: "cs", suppression: false),
            Ingredient(nom: "cubes de bouillon de boeufs", quantite: "3", unite: "", suppression: false),
            Ingredient(nom: "pilons de poulet", quantite: "6", unite: "", suppression: false),
            Ingredient(nom: "merguez", quantite: "6", unite: "", suppression: false),
        ],
        
        instructions: """
        ÉTAPE 1
        Lavez et épluchez les carottes, les navets et les tomates et les couper en cubes.

        ÉTAPE 2
        Dans un autocuiseur, versez 3 cuillères à soupe d'huile d'olive. Mettez à chauffer et faites-y dorer les pilons de poulet. Quand ils sont dorés, versez l'équivalent d'1 litre d'eau et ajouter les cubes de bouillon de boeuf, le concentré de tomate, les carottes, navets et tomates, les épices à couscous et l'harissa.

        ÉTAPE 3
        Fermez votre autocuiseur et compter 25 mn de cuisson une fois que celui-ci est monté en pression.

        ÉTAPE 4
        En attendant, lavez et coupez les courgettes en cubes et égouttez les pois chiches.

        ÉTAPE 5
        Une fois les 25 mn écoulées, évacuez la vapeur de votre autocuiseur, ouvrez et rajouter les courgettes et les pois chiches.

        ÉTAPE 6
        Remettez au feu : comptez 10 mn de cuisson une fois votre autocuiseur sous pression.

        ÉTAPE 7
        Faites cuire vos merguez sur un grill ou à la poêle, mais pas avec les légumes.

        ÉTAPE 8
        Servez accompagné d'une semoule fine.
        """,
        ustensiles: "Poêle, couteau, cuillère, planche à découper, Cocotte minute, Cuiseur Vapeur"),
    
    Recette(
        titre: "Pasteis de nata",
        description: "Patisserie à la crême provenant du Portugal",
        image: "pasteis",
        auteur: "Jane Doe",
        categories: ["Dessert"],
        region: .europe,
        nbPersonnes: 12,
        difficulte: .facile,
        temps: 45,
        ingredients: [
            Ingredient(nom: "lait", quantite: "1", unite: "L", suppression: false),
            Ingredient(nom: "sucre", quantite: "250", unite: "g", suppression: false),
            Ingredient(nom: "maizéna", quantite: "250", unite: "g", suppression: false),
            Ingredient(nom: "pattes feuilleté", quantite: "2", unite: "", suppression: false),
            Ingredient(nom: "oeufs", quantite: "6", unite: "", suppression: false),
            Ingredient(nom: "citron", quantite: "1", unite: "zeste", suppression: false),
        ],
        
        instructions: """
        ÉTAPE 1
        Dans une casserole, mettre le lait, le sucre, la maïzéna, et l zeste de citron.

        ÉTAPE 2
        Mélanger pour bien incorporer tous les ingrédients.

        ÉTAPE 3
        Faire chauffer, à feu doux dans une casserole, en mélangeant toujours avec une cuillère en bois.

        ÉTAPE 4
        Arrêter le feu, quand le mélange s'épaissit.

        ÉTAPE 5
        Dans 2 moules à muffins, mettre des petits ronds de pâte feuilletée (les découper en prenant une tasse moyenne pour la mesure).

        ÉTAPE 6
        Puis, séparer les blancs des jaunes... Garder les blancs pour une autre utilisation, ou bien les jeter.

        ÉTAPE 7
        Enlever le zeste de citron, et incorporer les jaunes d'oeufs.

        ÉTAPE 8
        Mélanger, sur feu doux, pendant 5 min.

        ÉTAPE 9
        Verser le mélange dans la pâte feuilletée.

        ÉTAPE 10
        Enfourner à 210°C (thermostat 7), pendant 30 min... le dessus de ces petits flans va brunir, c'est normal!
        """,
        ustensiles: "Casserole, couteau, cuillère, planche à découper, four, moule")
]
