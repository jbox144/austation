////////////////////UTILITY NANITES//////////////////////////////////////

/datum/design/nanites/signaller
	name = "Signaller"
	desc = "Nanites receive and relay common signaller signals."
	id = "signaller_nanites"
	program_type = /datum/nanite_program/signaller
	category = list("Utility Nanites")

/datum/design/nanites/apc_replication
	name = "Electromagnetic conductive production"
	desc = "Uses power from adjacent APCs to power nanites, increasing regeneration rate."
	id = "apcreplication_nanites"
	program_type = /datum/nanite_program/apc_replication
	category = list("Utility Nanites")

////////////////////MEDICAL NANITES//////////////////////////////////////

/datum/design/nanites/sensor_heal
	name = "Sensory Restoration"
	desc = "Nanites tend to degradation of sensory organs, repairing damage to the eyes and ears."
	id = "sensorheal_nanites"
	program_type = /datum/nanite_program/sensor_heal
	category = list("Medical Nanites")

/datum/design/nanites/organ_heal
	name = "Organ Restoration"
	desc = "Nanites repair tissue within internal organs, repairing damage. The complexity needed to restore internal organs safely increases the cost of running this program."
	id = "organheal_nanites"
	program_type = /datum/nanite_program/organ_heal
	category = list("Medical Nanites")

/datum/design/nanites/anti_viral
	name = "Viral combat"
	desc = "Nanites actively seek and destroy harmful viruses. Inneffective against viruses with signficant stealth or resistance, or if the virus has reached stage 5."
	id = "antiviral_nanites"
	program_type = /datum/nanite_program/anti_viral
	category = list("Medical Nanites")


////////////////////AUGMENTATION NANITES//////////////////////////////////////

/datum/design/nanites/preservation
	name = "Organ Preservation"
	desc = "Nanites produce preservative chemicals, preventing organ rot. Can cause toxin damage if used within a living subject."
	id = "preservation_nanites"
	program_type = /datum/nanite_program/preservation
	category = list("Augmentation Nanites")