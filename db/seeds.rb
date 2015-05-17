# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

s1 = Sim.create(image: "/assets/PolarizationSnip.PNG", name: "Polarizing Filters", link: "/assets/new_physics_sim.pde", description: "This simulation demonstrates how light is affected by polarizing filters. The green lines represent the component of the light that passes through the filter whereas the red lines are absorbed. The magnitude of the polarzation vectors is proportional to the amplitude of light which is also apparent in the brightness of the beam. Press the button in the top right to reveal how much total light gets through.")

s2 = Sim.create(image: "/assets/CyclotronSnip.PNG", name: "Particle Accelerator", link: "/assets/cyclotron_pde.pde", description: "This simulation shows how cyclotrons accelerate particles using varying electric fields. The magnetic field holds the ion in while the electric field slowly accelerates it. When the ion reaches the top, the electron is stripped off which frees it from the two fields.")

s3 = Sim.create(image: "/assets/ElectronSnip.PNG", name: "Electron Ray Gun", link: "/assets/electron.pde", description: "This simulation demonstrates how electrons are deflected by passing through parallel plates. When the electron is launched through the plates, it experiences a force and thus acceleration from the electric field. This deflects the electron and accelrates it slightly. The field strength can be changed by adjusting the voltage and the electron's initial speed can be changed using the slider.")

s4 = Sim.create(image: "/assets/RocketSnip.PNG", name: "Rocket Simulator", link: "/assets/rocketFinal.pde", description: "This simulation demonstrates all of the key ideas in one dimesional kinematics. Simply set the weight of the rocket, the strength of the fuel and the amount of time the fuel burns for, then watch it go!")
