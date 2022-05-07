require "csv"

DetailService.destroy_all
TintService.destroy_all
ClearBraService.destroy_all
ProductionVehicle.destroy_all

create(:user, ENV["CREATE_USER"])
puts "user created"

DetailService.create([
  {
    name: "Interior Detail",
    base_price: 210,
    description: "Our Interior Detail package includes an in depth cleaning of the following; seats, console, headliners, inside door panels, carpet, dressing (give it a shine), vacuum, shampoo. Excludes trunks unless requested (must be empty). Remove all personal items and trash before detail. Cost could increase upon inspection."
  },
  {
    name: "Exterior Detail",
    base_price: 210,
    description: "Our Exterior Detail package includes an in depth cleaning of the following; the engine bay, an ultra foam shampoo exterior wash, spraying off tires and rims plus tire dressing, minor paint correction, door jams, windows outside, exterior trim revitalization, Polish and butter wax finish."
  },
  {
    name: "Full Detail",
    base_price: 320,
    description: "With our Full Detail package you will recieve both an Interior and Exterior detail."
  },
  {
    name: "Executive Full Detail",
    base_price: 370,
    description: "With our Executive Full Detail package you receive everything that comes with the Full Detail package, alonge with a premium carnuba wax sealant. This longer lasting sealant, protects your clear coat from the elements."
  },
  {
    name: "Presidential Full Detail",
    base_price: 420,
    description: "With our Presidential Full Detail package you receive everything that comes with the Full Detail Package, alonge with a ultra-premium patriot wax sealant. This longer lasting sealant, protects the clear coat from the elements. Finalized with a Brilliant Glaze, adding amazing depth and shine."
  },
  {
    name: "High-End Wash/Wax Revitalization",
    base_price: 130,
    description: "Our High-End Wash/Wax Revitalization package includes an ultra foam shampoo exterior wash, spraying off tires and rims plus tire dressing, a revitalization hand polish, and then finished off with Adams detail spray high gloss finish."
  },
  {
    name: "High-End WWR and Vac",
    base_price: 175,
    description: "Our High-End Wash/Wax Revitalization package includes an ultra foam shampoo exterior wash, spraying off tires and rims plus tire dressing, a revitalization hand polish, and then finished off with Adams detail spray high gloss finish. Vacuum floors and seats. (DOG HAIR REMOVAL NOT INCLUDED. NO INTERIOR WIPE DOWNS)."
  },
  {
    name: "Touch Up Scratch and Buff",
    base_price: 50,
    description: "Wet sanding and buffing. If the scratch is to deep, paint blending would be required in order to remove scratch, which will be extra. An evaluation of scratches is needed to assess appropriate pricing. Adjustments based on size of vehicle and number of areas being worked on will increase the price."
  },
  {
    name: "Scratch and Buff Panel Webbing",
    base_price: 800,
    description: "Includes standard scratch and buff but also focus on webbing removal across full panel. Can discuss single panel work. Please bring up when you call or if an appointment inquiry is made via the website."
  },
  {
    name: "Hazardous Waste Management",
    base_price: 135,
    description: "Hazardous waste can be dangerous and requires a special removal process. Our goal is ensure proper removal, decontamination, and sanitizing of hazard. This makes the environment safe for consumers. Below are a list of items considered hazardous:
    Urine (animal or human),
    Feces (animal or human),
    Mold,
    Blood,
    Vomit

    Please note excessive hazardous waste will have an up charge."
  },
  {
    name: "Odor Bomb",
    base_price: 95,
    description: "Used in interior to kill germs, bacteria, mold/mildew, and viruses. Eliminates odors (smoke, pets, and many others). This product is industrial strength incorporates Chlorine Dioxide used for 50 yrs in various industries incl. surgical equipment sterilization."
  },
  {
    name: "Odor & Disinfection Bomb",
    base_price: 130,
    description: "Used in interior to kill germs, bacteria, mold/mildew, and viruses. Eliminates odors (smoke, pets, and many others). This product is industrial strength incorporates Chlorine Dioxide used for 50 yrs in various industries incl. surgical equipment sterilization.

    Available in a details with interiors for $95 dollars
    Recommend one uses the bomb with an interior detail to ensure all smells disappear / safety measures take hold
    Recommend one uses w/ steam cleaning service to double the protection"
  },
  {
    name: "Head-Light Restoration",
    base_price: 85,
    description: "Two stage wet sanding and polish seal."
  },
  {
    name: "Tail-Light Restoration",
    base_price: 85,
    description: "Two stage wet sanding and polish seal"
  },
  {
    name: "Steam Engine Cleaning",
    base_price: 85,
    description: "Steam cleaned, using an high quality all purpose eco degreasing agent"
  },
  {
    name: "Shampoo Service",
    base_price: 85,
    description: "High-end Shampoo Service cost determined upon inspection. Using a carpet upholstery cleaner that knocks the worst soil and stains.  We can shampoo the seats, floors, and mats. Each area is an addition charge. Excessive staining could result in increased cost."
  },
  {
    name: "Dirt, Dog Hair, or Sand Removal - No Detail Basic",
    base_price: 120,
    description: "This service is for if an interior detail is not wanted but dirt, dog hair, or sand removal is required. Please note excessive amount of any dirt, dog hair, or sand is an upcharge."
  },
  {
    name: "Excessive Dirt, Hair, or Sand Removal",
    base_price: 79,
    description: "Excessive Dirt, Hair, or Sand Removal cost may increase based amount of dirt, hair, or sand inside vehicle."
  },
  {
    name: "Ceramic Body Protection Package",
    base_price: 700,
    description: "Includes excellent exterior protection that shows great scratch resilience and unbeatable water beading properties. This service does require 1 to 3 days depending on the number of years coating protection being requested. Can see adjustments based on size and condition of vehicle paint.  Must be inspected in person. Does not include major scratch removal or repair."
  },
  {
    name: "Exterior Car Wash",
    base_price: 20,
    description: "A quick hand wash after a rain or snow storm.
    Includes for all vehicle types:
    Hand wash with our high-end shampoo that includes a wax coating
    Dry off exterior
    Not available with this package:
    Interior work
    Tire dressing
    Windows
    Upgrade to a high-end wash / vac, full detail, or exterior detail for more service options"
  },
  {
    name: "Steam Cleaning",
    base_price: 75,
    description: "Steamer is used inorder to sterilize interior panels, steering wheel, front dash, leather seats, exterior. All surface areas that can withstand 175 to 250 degrees heat."
  },
  {
    name: "Steam Cleaning Disinfection",
    base_price: 110,
    description: "Used on interior panels, steering wheel, front dash, leather seats, exterior. All surface areas that can withstand 175 to 250 degrees heat. Only heat of 175 or greater can kill bacteria and viruses based on CDC guidance.

    Available in details with interiors for $75 dollars, stand alone service price above.
    Recommend all stream cleaning services have an interior detail to ensure all safety measures take hold.
    Steam cleaning does not guarantee removal of all dirt."
  }
])
puts "Added #{DetailService.all.count} Detail Services"

TintService.create([
  {
    name: "Full Tint",
    tint_manufacturer: "Lexen",
    vehicle_type: "sedan",
    price: 190,
    description: "Lexon window tint applied to four doors and the back window."
  },
  {
    name: "Full Tint",
    tint_manufacturer: "3M",
    vehicle_type: "sedan",
    price: 260,
    description: "3M window tint applied to four doors and the back window."
  },
  {
    name: "Full Tint",
    tint_manufacturer: "Lexen",
    vehicle_type: "Larger SUVs and MiniVans",
    price: 290,
    description: "Lexon window tint applied to four doors and the back window."
  },
  {
    name: "Full Tint",
    tint_manufacturer: "3M",
    vehicle_type: "Larger SUVs and MiniVans",
    price: 380,
    description: "3M window tint applied to four doors and the back window."
  },
  {
    name: "One Door Window",
    tint_manufacturer: "Lexen",
    vehicle_type: "any",
    price: 55,
    description: "Lexon window tint applied to one door window."
  },
  {
    name: "One Door Window",
    tint_manufacturer: "3M",
    vehicle_type: "any",
    price: 75,
    description: "3M window tint applied to one door window."
  },
  {
    name: "Back Window",
    tint_manufacturer: "Lexen",
    vehicle_type: "any",
    price: 105,
    description: "Lexon window tint applied to a large back window"
  },
  {
    name: "Back Window",
    tint_manufacturer: "3M",
    vehicle_type: "any",
    price: 140,
    description: "3M window tint applied to a large back window"
  },
  {
    name: "Two Windows",
    tint_manufacturer: "Lexen",
    vehicle_type: "any",
    price: 110,
    description: "Lexon window tint applied to two full size door windows"
  },
  {
    name: "Two Windows",
    tint_manufacturer: "3M",
    vehicle_type: "any",
    price: 150,
    description: "3M window tint applied to two full size door windows"
  },
  {
    name: "Full Windshield",
    tint_manufacturer: "Lexen",
    vehicle_type: "any",
    price: 120,
    description: "Lexon window tint applied to the front windshield."
  },
  {
    name: "Full Windshield",
    tint_manufacturer: "3M",
    vehicle_type: "any",
    price: 160,
    description: "3M window tint applied to the front windshield."
  },
  {
    name: "Visor Windshield",
    tint_manufacturer: "Lexen",
    vehicle_type: "any",
    price: 40,
    description: "Lexon window tint applied to the top of the windshield to ensure you block the sun at the visor level, which is within the legal guidelines."
  },
  {
    name: "Visor Windshield",
    tint_manufacturer: "3M",
    vehicle_type: "any",
    price: 50,
    description: "3M window tint applied to the top of the windshield to ensure you block the sun at the visor level, which is within the legal guidelines."
  },
  {
    name: "Tint Removal",
    tint_manufacturer: "none",
    vehicle_type: "any",
    price: 150,
    description: "Removal of tint. (Bubble Tint Removal) Some tint removal requires more time due to the quality of tint being removed and if bubbling has occurred.  An increase in time could occur to ensure no residue remains, which could impact future tint installation. Contact us to bring car in for evaluation."
  }
])
puts "Added #{TintService.all.count} Tint Services"

ClearBraService.create([
  {
    name: "Partial Mask",
    price: 520,
    description: "Includes (1/2 hood, fender, back of mirrors)"
  },
  {
    name: "Full Mask",
    price: 800,
    description: "Includes (1/2 hood, fender, back of mirror, front bumper)"
  },
  {
    name: "Complete Full Front End",
    price: 990,
    description: "Includes (full hood, fender, back of the mirrors, front bumper)"
  },
  {
    name: "Rocker Panel",
    price: 100,
    description: "Under lower side panels"
  },
  {
    name: "Rear Bumper Sliver",
    price: 20,
    description: "Covers the bumper next to the trunk opening to help protect the bumper paint from scratches created by pull and pushing things into the trunk."
  },
  {
    name: "Full Rear Bumper",
    price: 450,
    description: "Goal is to protect the rear bumper paint from other vehicles and parking impacts resulting in cross paint contamination."
  },
  {
    name: "Full Front Bumper",
    price: 450,
    description: "Goal is to protect the front bumper paint from other vehicles and parking impacts resulting in cross paint contamination."
  },
  {
    name: "Both Bumpers Full Coverage",
    price: 860,
    description: "Goal is to protect the both bumpers paint from other vehicles and parking impacts resulting in cross paint contamination."
  },
  {
    name: "Door Handles - 2",
    price: 15,
    description: "Underside of door handles."
  },
  {
    name: "Door Handles - 4",
    price: 30,
    description: "Underside of door handles."
  },
  {
    name: "Hatch Handle",
    price: 15,
    description: "Underside of the back door hatch"
  },
  {
    name: "Headlights",
    price: 40,
    description: "Helps to reduce damage that occurs over time due to rocks and oxidation."
  },
  {
    name: "Fog Lights",
    price: 25,
    description: "Helps to reduce damage that occurs over time due to rocks and oxidation."
  },
  {
    name: "Door Edges",
    price: 50,
    description: "Protects paint while a person transition in and out of the car."
  },
  {
    name: "Clearbra Removal",
    price: 150,
    description: "Removal of old clearbra.  Prices could change if more than a full mask removal is required."
  }
])
puts "Added #{ClearBraService.all.count} Clear Bra Services"

CSV.foreach("./lib/vehicle_list.csv", headers: true) do |row|
  stating_year = row.to_h["production_starting_year"].to_i
  ending_year = row.to_h["production_ending_year"]
  if ending_year == "-"
    ending_year = Time.now.year
    ending_year
  end
  (stating_year..ending_year.to_i).each do |year|
    ProductionVehicle.create(
      make: row.to_h["make"],
      model: row.to_h["model"],
      production_year: year.to_s,
      vehicle_size: row.to_h["vehicle_size"],
      vehicle_type: row.to_h["vehicle_type"],
      vehicle_class: row.to_h["vehicle_class"]
    )
  end
end
puts "Added #{ProductionVehicle.all.count} Vehicles"
