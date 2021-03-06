/obj/item/weapon/melee/arm_blade
	name = "arm blade"
	desc = "A grotesque blade made out of bone and flesh that cleaves through people as a hot knife through butter."
	icon = 'icons/obj/changeling.dmi'
	icon_state = "arm_blade"
	item_state = "arm_blade"
	contained_sprite = 1
	w_class = 4
	force = 30
	sharp = 1
	edge = 1
	anchored = 1
	throwforce = 0 //Just to be on the safe side
	throw_range = 0
	throw_speed = 0
	can_embed = 0
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	var/mob/living/creator

/obj/item/weapon/melee/arm_blade/New()
	processing_objects |= src

/obj/item/weapon/melee/arm_blade/Destroy()
	processing_objects -= src
	..()

/obj/item/weapon/melee/arm_blade/dropped()
	visible_message("<span class='danger'>With a sickening crunch, [user] reforms their arm blade into an arm!</span>",
	"<span class='notice'>We assimilate the weapon back into our body.</span>",
	"<span class='warning'>You hear organic matter ripping and tearing!</span>")
	playsound(loc, 'sound/effects/blobattack.ogg', 30, 1)
	spawn(1) if(src) qdel(src)

/obj/item/weapon/melee/arm_blade/process()
	if(!creator || loc != creator || (creator.l_hand != src && creator.r_hand != src))
		// Tidy up a bit.
		if(istype(loc,/mob/living))
			var/mob/living/carbon/human/host = loc
			if(istype(host))
				for(var/obj/item/organ/external/organ in host.organs)
					for(var/obj/item/O in organ.implants)
						if(O == src)
							organ.implants -= src
			host.pinned -= src
			host.embedded -= src
			host.drop_from_inventory(src)
		spawn(1) if(src) qdel(src)

/obj/item/weapon/shield/riot/changeling
	name = "shield-like mass"
	desc = "A mass of tough, boney tissue. You can still see the fingers as a twisted pattern in the shield."
	icon = 'icons/obj/changeling.dmi'
	icon_state = "ling_shield"
	item_state = "ling_shield"
	contained_sprite = 1
	slot_flags = null
	anchored = 1
	throwforce = 0 //Just to be on the safe side
	throw_range = 0
	throw_speed = 0
	can_embed = 0
	var/mob/living/creator

/obj/item/weapon/shield/riot/changeling/New()
	processing_objects |= src

/obj/item/weapon/shield/riot/changeling/Destroy()
	processing_objects -= src
	..()

/obj/item/weapon/shield/riot/changeling/dropped()
	visible_message("<span class='danger'>With a sickening crunch, [user] reforms their arm blade into an arm!</span>",
	"<span class='notice'>We assimilate the weapon back into our body.</span>",
	"<span class='warning'>You hear organic matter ripping and tearing!</span>")
	playsound(loc, 'sound/effects/blobattack.ogg', 30, 1)
	spawn(1) if(src) qdel(src)

/obj/item/weapon/shield/riot/changeling/process()
	if(!creator || loc != creator || (creator.l_hand != src && creator.r_hand != src))
		// Tidy up a bit.
		if(istype(loc,/mob/living))
			var/mob/living/carbon/human/host = loc
			if(istype(host))
				for(var/obj/item/organ/external/organ in host.organs)
					for(var/obj/item/O in organ.implants)
						if(O == src)
							organ.implants -= src
			host.pinned -= src
			host.embedded -= src
			host.drop_from_inventory(src)
		spawn(1) if(src) qdel(src)