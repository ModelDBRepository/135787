These neuronal models were used for the following papers:

Shu Y, Duque A, Yu YG, McCormick DA.  Properties of action potential
initiation in neocortical pyramidal cells: evidence from whole cell
axon recordings.  Journal of Neurophysiology. 97: 746-760, (2007).

Shu Y, Hasenstaub A, Duque A, Yu Y, McCormick DA (2006) Modulation of
intracortical synaptic potentials by presynaptic somatic membrane
potential.  Nature 441: 761-765.

---

The model pyramidal cell with full dendritic tree and axon arbor is
for simulating the action potential generation process of pyramidal
cells in layer V of prefrontal cortex.

code: best_full_axon_decay.hoc
This code is used to calculate the spacial decay constant of main
axon.

code: best_full_axon_spike_init.hoc
This code is used to calculate the initiation point of action
potential in axon initial segment.

Notice:
After running code, output data file is saved in a file called
"seg.dat" which can be analysized by the matlab code 'for_decay.m',
and 'for_initiation.m'.

These model files were contributed by:
Yuguo Yu
Yale University

yuguo.yu@yale.edu

20111026 cad.mod capump.mod ih.mod release.mod updated to use
derivimplicit method.  See files for more details.
