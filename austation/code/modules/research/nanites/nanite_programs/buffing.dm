/datum/nanite_program/preservation
	name = "Organ Preservation"
	desc = "Nanites produce preservative chemicals, preventing organ rot. Causes toxin damage if used within a living subject."
	use_rate = 0.20
	rogue_types = list(/datum/nanite_program/toxic)

/datum/nanite_program/preservation/enable_passive_effect()
	. = ..()
	for(var/obj/item/organ/O in host_mob.internal_organs)
		O = O | ORGAN_FROZEN // You tell me if there's a better way of doing this

/datum/nanite_program/preservation/disable_passive_effect()
	. = ..()
	for(var/obj/item/organ/O in host_mob.internal_organs)
		O = O | !ORGAN_FROZEN

/datum/nanite_program/preservation/active_effect()
	if(host_mob.stat != DEAD && host_mob.getToxLoss() < 80) // If we're not dead, we take toxin damage. Won't go above 80, so noob nanite users don't end up killing everyone. Could be useful for slimepeople I guess.
		host_mob.adjustToxLoss(0.1)