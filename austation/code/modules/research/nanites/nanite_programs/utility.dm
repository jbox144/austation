/datum/nanite_program/signaller
	name = "Signaller"
	desc = "Nanites receive and relay common signaller signals."
	rogue_types = list(/datum/nanite_program/toxic)

	var/datum/radio_frequency/radio_connection

/obj/item/assembly/signaler/Initialize()
	. = ..()
	set_frequency(frequency)

/datum/nanite_program/relay/register_extra_settings()
	extra_settings[NES_COMM_CODE] = new /datum/nanite_extra_setting/number(1, MIN_FREQ, MAX_FREQ)
	extra_settings[NES_SENT_CODE] = new /datum/nanite_extra_setting/number(1, 1, 100)


/datum/nanite_program/relay/enable_passive_effect()
	. = ..()
	SSnanites.nanite_relays |= src

/datum/nanite_program/relay/disable_passive_effect()
	. = ..()
	SSnanites.nanite_relays -= src

/datum/nanite_program/relay/proc/relay_signal(code, relay_code, source)
	if(!activated)
		return
	if(!host_mob)
		return
	var/datum/nanite_extra_setting/NS = extra_settings[NES_RELAY_CHANNEL]
	if(relay_code != NS.get_value())
		return
	SEND_SIGNAL(host_mob, COMSIG_NANITE_SIGNAL, code, source)

/datum/nanite_program/relay/proc/relay_comm_signal(comm_code, relay_code, comm_message)
	if(!activated)
		return
	if(!host_mob)
		return
	var/datum/nanite_extra_setting/NS = extra_settings[NES_RELAY_CHANNEL]
	if(relay_code != NS.get_value())
		return
	SEND_SIGNAL(host_mob, COMSIG_NANITE_COMM_SIGNAL, comm_code, comm_message)

/obj/item/assembly/signaler/proc/set_frequency(new_frequency)
	SSradio.remove_object(src, frequency)
	frequency = new_frequency
	radio_connection = SSradio.add_object(src, frequency, RADIO_SIGNALER)
	return