//
//  D&D.swift
//  DnD Handbook
//
//  Created by Екатерина Теляубердина on 19.09.2023.
//

import Foundation

struct DnD: Decodable {
    let abilityScores: URL
    let alignments: URL
    let backgrounds: URL
    let classes: URL
    let conditions: URL
    let damageTypes: URL
    let equipment: URL
    let equipmentCategories: URL
    let feats: URL
    let features: URL
    let languages: URL
    let magicItems: URL
    let magicSchools: URL
    let monsters: URL
    let proficiencies: URL
    let races: URL
    let ruleSections: URL
    let rules: URL
    let skills: URL
    let spells: URL
    let subclasses: URL
    let subraces: URL
    let traits: URL
    let weaponProperties: URL
    
    enum CodingKeys: String, CodingKey {
        case abilityScores = "ability-scores"
        case alignments, backgrounds, classes, conditions
        case damageTypes = "damage-types"
        case equipment
        case equipmentCategories = "equipment-categories"
        case feats, features, languages
        case magicItems = "magic-items"
        case magicSchools = "magic-schools"
        case monsters, proficiencies, races
        case ruleSections = "rule-sections"
        case rules, skills, spells, subclasses, subraces, traits
        case weaponProperties = "weapon-properties"
    }
}

enum DnDAPI {
    case baseURL
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://www.dnd5eapi.co/api")!
        }
    }
}

enum DnDTitles: CaseIterable {
    case abilityScores
    case alignments
    case backgrounds
    case classes
    case conditions
    case damageTypes
    case equipment
    case equipmentCategories
    case feats
    case features
    case languages
    case magicItems
    case magicSchools
    case monsters
    case proficiencies
    case races
    case ruleSections
    case rules
    case skills
    case spells
    case subclasses
    case subraces
    case traits
    case weaponProperties
    
    var title: String {
        switch self {
        case .abilityScores:
            return "Ability Scores"
        case .alignments:
            return "Alignments"
        case .backgrounds:
            return "Backgrounds"
        case .classes:
            return "Classes"
        case .conditions:
            return "Conditions"
        case .damageTypes:
            return "Damage Types"
        case .equipment:
            return "Equipment"
        case .equipmentCategories:
            return "Equipment Categories"
        case .feats:
            return "Feats"
        case .features:
            return "Features"
        case .languages:
            return "Languages"
        case .magicItems:
            return "Magic Items"
        case .magicSchools:
            return "Magic Schools"
        case .monsters:
            return "Monsters"
        case .proficiencies:
            return "Proficiencies"
        case .races:
            return "Races"
        case .ruleSections:
            return "Rule Sections"
        case .rules:
            return "Rules"
        case .skills:
            return "Skills"
        case .spells:
            return "Spells"
        case .subclasses:
            return "Subclasses"
        case .subraces:
            return "Subraces"
        case .traits:
            return "Traits"
        case .weaponProperties:
            return "Weapon Properties"
        }
    }
}
