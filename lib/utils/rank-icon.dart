_rankIcon(rankLabel, divisionLabel) {
  final ranks = {
    'IRON': '01_iron',
    'BRONZE': '02_bronze',
    'SILVER': '03_silver',
    'GOLD': '04_gold',
    'PLATINUM': '05_platinum',
    'DIAMOND': '06_diamond',
    'MASTER': '07_master',
    'GRANDMASTER': '08_grandmaster',
    'CHALLENGER': '09_challenger',
    'EMERALD': 'emerald',
  };

  final divisions = {
    'I': 'division1',
    'II': 'division2',
    'III': 'division3',
    'IV': 'division4',
  };

  var rank = ranks[rankLabel];
  var division = divisions[divisionLabel];

  if(rankLabel == 'EMERALD') {
    return 'https://raw.communitydragon.org/latest/game/assets/loadouts/regalia/crests/ranked/05_platinum/05_platinum_division1.png';
  } else if(rankLabel == 'MASTER' || rankLabel == 'GRANDMASTER' || rankLabel == 'CHALLENGER') {
    return 'https://raw.communitydragon.org/latest/game/assets/loadouts/regalia/crests/ranked/$rank/$rank''_division1.png';
  } else if(rankLabel == 'UNRANKED') {
    return 'https://raw.communitydragon.org/latest/game/assets/loadouts/regalia/crests/ranked/01_iron/01_iron_division4.png';
  } else {
    return 'https://raw.communitydragon.org/latest/game/assets/loadouts/regalia/crests/ranked/$rank/$rank''_$division.png';
  }
}