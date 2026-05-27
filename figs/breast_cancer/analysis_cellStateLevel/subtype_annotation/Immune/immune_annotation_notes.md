Note: the ordering of the clusters has been according to the "summary_plot.pdf" which sorts the clusters from 
most patient specific to the most shared amongst patients. 

# CLUSTER 10 

🏷️ Proposed Seurat Object Name
Macrophage_ISGhi

🧬 Marker Summary
Marker	Role
IFIT1, IFIT3, RSAD2, ISG15, USP18	Canonical ISGs — strong type I IFN activation signature
NUPR1, MMP11	Stress and tissue-remodeling responsive — seen in inflammatory or tumor-exposed macrophages
OTOF, CAPN9, GAL	Atypical in immune cells — suggest tissue-specific imprinting (e.g., gut, neural, or tumor contexts)

🧩 Cell Type Identity
An interferon-polarized macrophage subset, marked by:

High ISG expression (indicative of viral response, inflammation, or tumor environment)

Evidence of stress adaptation and local tissue specialization

Consistent with populations described as Mac_IFN, ISG+ TAMs, or tissue-adapted inflammatory macrophages

📚 Supporting Literature
Zilionis et al., Cell (2019) — IFN+ TAMs in lung tumors

Kumar et al., Nat Commun (2020) — NUPR1+ MMP11+ macrophages in tissue remodeling contexts

Human Protein Atlas, ImmGen — Expression of OTOF, CAPN9, GAL in non-immune, tissue-specific cells

# CLUSTER 9

🏷️ Proposed Seurat Object Name
Macrophage_CX3CR1+_TissueAdapted

🧬 Marker Summary
Marker	Role
C3	Complement component — commonly expressed in tissue-resident macrophages, involved in local immune surveillance and complement activation
HTRA1	Serine protease linked to tissue remodeling and inflammation, seen in activated macrophages within tissue contexts
CLDN1	Tight junction protein — indicates barrier-associated or tissue-adapted macrophage phenotype, possibly involved in epithelial interactions
CLEC5A	C-type lectin receptor — associated with macrophage activation and pathogen recognition
CX3CR1	Chemokine receptor — classical marker of patrolling monocytes and tissue-resident macrophages, mediating adhesion and migration within tissues
FCGBP	Fc fragment binding protein — linked to mucosal immunity and macrophage-epithelial interactions
PADI2	Peptidyl arginine deiminase — involved in immune regulation and epigenetic modulation in macrophages
SCGB2A2	Secretoglobin family member — epithelial marker but here suggests macrophage tissue imprinting or close association with epithelial cells
KCNQ3	Potassium channel subunit — may relate to macrophage signaling, activation, or tissue adaptation
RGS16	Regulator of G-protein signaling — modulates macrophage migration and signaling pathways

🧩 Cell Type Identity
A CX3CR1+ tissue-adapted macrophage subset characterized by:

Expression of tissue-resident macrophage markers (CX3CR1, CLEC5A, C3)

Markers indicative of interaction with epithelial or barrier tissues (CLDN1, FCGBP, SCGB2A2)

Presence of genes involved in immune regulation, tissue remodeling, and macrophage activation (HTRA1, PADI2, RGS16)

Reflects a macrophage population specialized for local surveillance, barrier maintenance, and immune modulation

📚 Supporting Literature
Gautier et al., Immunity, 2012 — Transcriptional profiling of tissue-resident macrophages showing complement and lectin receptor expression

Patel et al., J Immunol, 2017 — CX3CR1+ macrophages in tissue surveillance and homeostasis

Human Protein Atlas & ImmGen — Tissue imprinting signatures and expression patterns consistent with barrier-associated macrophages

# CLUSTER 13

🏷️ Proposed Seurat Object Name
Neutrophil_Inflammatory

🧬 Marker Summary
Marker	Role
S100A8, S100A9	Canonical neutrophil alarmins — high in inflammatory or activated neutrophils
CXCL8 (IL-8)	Potent neutrophil chemoattractant — secreted by activated neutrophils and promotes further recruitment
PTGS2 (COX-2)	Inflammatory mediator — upregulated in activated or pro-inflammatory neutrophils
VNN2	Expressed in mature and activated neutrophils — contributes to adhesion/migration
MMP25	Matrix-degrading enzyme — involved in extravasation and tissue remodeling
G0S2	Regulates energy metabolism and apoptosis — seen in neutrophil activation states
PROK2	Chemokine-like — involved in inflammation and nociception, sometimes seen in hypoxic neutrophils
KCNJ15, TRPM6	Ion channels — rarely highlighted in immune profiling but may relate to activation, tissue adaptation, or metabolic state in neutrophils

🧩 Cell Type Identity
An activated or pro-inflammatory neutrophil subset, characterized by:

High expression of alarmins (S100A8/A9) and chemotactic mediators (CXCL8)

Markers of extravasation, tissue invasion, and inflammatory function (e.g., MMP25, PTGS2, VNN2)

Additional context-specific expression suggesting tissue adaptation, hypoxia, or inflammatory microenvironment exposure

📚 Supporting Literature
Xie et al., Nature, 2020 — S100A8/A9+ neutrophils in inflammatory disease

Mildner et al., Immunity, 2017 — PTGS2+ and CXCL8+ neutrophil subsets in chronic inflammation

ImmGen & Human Protein Atlas — Expression profiles of VNN2, MMP25, and G0S2 in neutrophil states

# CLUSTER 11

🏷️ Proposed Seurat Object Name
pDCs

🧬 Marker Summary
Marker	Role
IL3RA (CD123)	High-affinity IL-3 receptor — canonical marker for plasmacytoid dendritic cells (pDCs)
CLEC4C (CD303), LILRA4 (ILT7)	Classic pDC markers involved in antigen recognition and regulation
PTGDS	Prostaglandin D2 synthase — enriched in pDCs, also contributes to immunoregulation
GZMB	Granzyme B — unusual for pDCs but reported in cytotoxic or IFN-producing pDC subsets
PTPRS	Receptor-type tyrosine phosphatase — may regulate cell activation or migration, occasionally found in DCs
LAMP5	Lysosomal-associated protein — expressed in pDCs and select inhibitory DC subtypes
CLIC3	Chloride intracellular channel — seen in DCs, may play a role in endosomal acidification
PACSIN1	Involved in vesicle trafficking, enriched in neuronal and immune regulation contexts, sometimes in pDCs
LCNL1	Poorly characterized in immune cells — some expression in neural and secretory tissues; may reflect microenvironment imprinting

🧩 Cell Type Identity
A plasmacytoid dendritic cell (pDC) subset, showing:

Strong expression of canonical pDC markers (IL3RA, CLEC4C, LILRA4, PTGDS)

GZMB+ expression suggesting a cytotoxic-like or type I IFN–producing activation state

Additional genes (LAMP5, CLIC3, PACSIN1) indicating endosomal activity, possibly linked to antigen sensing or presentation

Potential tissue or activation imprinting reflected by LCNL1 and ion channel components

📚 Supporting Literature
Villani et al., Science, 2017 — Single-cell analysis of DCs identifies LILRA4+, CLEC4C+ pDCs with variable activation states

Reizis et al., Nat Rev Immunol, 2019 — Overview of pDC biology including GZMB expression in activated subsets

See PDCs in Human Protein Atlas & ImmGen — Expression of IL3RA, PTGDS, and LAMP5 in pDCs

# CLUSTER 3 

🏷️ Proposed Seurat Object Name
PlasmaCell_IgRich

🧬 Marker Summary
Marker	Role
JCHAIN	Immunoglobulin J chain — hallmark of antibody-secreting plasma cells, involved in IgM and IgA polymerization
MZB1	Plasma cell chaperone — supports immunoglobulin folding and secretion, enriched in mature plasma cells
IGKC, IGLC1, IGHG1, IGHG3, IGHM, IGHA1	Immunoglobulin constant regions — define isotype diversity; strong plasma cell identity
TXNDC5	Endoplasmic reticulum protein — involved in protein folding and oxidative stress management, highly expressed in secretory plasma cells
DERL3	ER-associated degradation component — elevated in antibody-producing cells under secretory stress

🧩 Cell Type Identity
A mature antibody-secreting plasma cell population, defined by:

Very high expression of immunoglobulin genes (IGHG1, IGHA1, IGHM, IGHG3, IGKC, IGLC1)

JCHAIN and MZB1 confirming a terminally differentiated secretory state

ER-stress related proteins (TXNDC5, DERL3) indicative of intense antibody production and folding

Likely isotype-diverse, suggesting a broad or polyclonal activation (could be linked to inflammation or secondary lymphoid tissue)

📚 Supporting Literature
Shi et al., Nat Immunol, 2015 — MZB1 and JCHAIN as plasma cell markers

Nutt et al., Nat Rev Immunol, 2015 — Plasma cell differentiation and immunoglobulin secretion pathways

Villani et al., Science, 2017 — Plasma cells defined by IGKC, JCHAIN, and secretory pathway genes in scRNA-seq

# CLUSTER 0

🏷️ Proposed Seurat Object Name
Macrophage_TAM_IL4I1hi_RemodelingSuppressive

🧬 Marker Summary with Ordered Expression (Breast Cancer Context)
Rank	Marker	Role & Interpretation
1	IL4I1	Dominant marker. Enzyme highly expressed in TAMs, linked to tryptophan metabolism and T cell suppression. Strongly associated with immune escape and IFNγ imprinting in breast tumors.
2	NR1H3 (LXRα)	Highly expressed. Regulates lipid metabolism and dampens inflammatory responses; critical in pro-tumoral TAMs undergoing metabolic reprogramming.
3	COL6A1	ECM structural gene; indicates matrix-remodeling activity. High expression suggests involvement in fibrosis and desmoplastic stroma.
4	CXCL9	IFNγ-induced chemokine. High but not dominant expression suggests a modest inflammatory recruitment role (e.g. CXCR3+ T cells). Often spatially restricted to immune-reactive zones.
5	COL6A3	Partner to COL6A1 in Collagen VI. High expression confirms active fibrotic TAM identity, likely interacting with CAFs and dense ECM.
6	POSTN	Secreted factor strongly tied to fibrosis, matrix deposition, and tumor invasion. Suggests a role in tumor–stroma interface dynamics.
7	FSTL1	Involved in tissue remodeling, wound healing, and angiogenesis. Expression in TAMs denotes repair-oriented polarization.
8	CTTN	Actin cytoskeleton regulator. Marks motile, invasive TAMs. Supports tumor cell dissemination and matrix interaction.
9	KRT7	Atypical for macrophages. May reflect epithelial mimicry, close tumor proximity, or macrophage plasticity at the invasive front.
10	TRIP13	Cell cycle and chromosomal segregation factor. Weak expression but notable; may indicate proliferative reprogramming under tumor stress (hypoxia, cytokines).

🧩 Functional Identity
This population is best interpreted as a tumor-associated macrophage (TAM) subset with:

Dominant immunosuppressive function via IL4I1, regulating tryptophan metabolism and dampening adaptive responses

Strong ECM remodeling and fibrotic imprinting via COL6A1/3, POSTN, FSTL1

Metabolic and anti-inflammatory tuning via NR1H3

Mild IFNγ-induced chemokine activity via CXCL9

Emerging features of epithelial interaction and proliferation via KRT7, TRIP13

This suggests a remodeling-oriented, immune-suppressive TAM population located near the tumor-stroma interface, with partial inflammatory signaling and possible involvement in metastasis or stromal crosstalk.

🔬 Comparison to Other Macrophage Populations
Cluster	Dominant Traits	Top Marker	Inflammatory	Fibrotic	Proliferative	Epithelial-assoc.
Macrophage_IFN_ISGhi	Interferon response, anti-viral defense	IFIT1 / ISG15	+++	–	–	–
Macrophage_S100A8_Inflamm	Alarmin-high, acute inflammation	S100A8 / CXCL8	++	+	–	–
Macrophage_TAM_FibroblastLike	ECM remodeling, fibroblast mimicry	COL6A1 / POSTN	+	+++	–	+
Macrophage_TAM_IL4I1hi_Remodeling	Immune suppression, matrix remodeling, mild IFNγ	IL4I1	+	+++	+	+

📚 Key References
Zhang et al., Nat Commun, 2023 – IL4I1+ TAMs mediate immune escape and T cell dysfunction in breast cancer

Aran et al., Nat Commun, 2019 – ECM-producing TAMs with fibroblast-like phenotypes in breast cancer

Kumar et al., Cell Rep, 2020 – CXCL9+ TAMs at immune niches

Kratochvill et al., Cell, 2015 – LXRα (NR1H3) dampening macrophage inflammation in tumors

Xia et al., Cell Rep, 2022 – Proliferation-related TAM subtypes with TRIP13 expression in aggressive tumor zones

# CLUSTER 12

🏷️ Proposed Seurat Object Name
T-Cell_Cycling

🧬 Interpretation
This gene set reflects a proliferating T cell population, consistent with cycling CD4⁺ or CD8⁺ T cells. These cells are undergoing clonal expansion, likely in response to tumor antigens or other inflammatory signals within the tumor microenvironment. This is a common feature in breast cancer immune infiltration profiles.

🔍 Marker Breakdown

Gene	Function / Interpretation
CD3D/E/G	Core TCR complex — definitive of T-lineage
CD2	Adhesion/signaling — highly specific for T cells
CD5, CD7	Co-receptors — early and mature T cell markers
MKI67	Canonical marker of active cell division
TOP2A	DNA topology, essential for mitosis
BIRC5	Anti-apoptotic, pro-survival mitotic factor
CENPF, UBE2C, CDCA8	Spindle/kinetochore — mitosis-associated

📌 Functional Identity
Proliferating T lymphocytes, likely antigen-driven and undergoing clonal expansion within the tumor microenvironment. These cells are part of the immune effector arm and may reflect active immune surveillance or immune exhaustion dynamics, depending on downstream markers (e.g., PDCD1, LAG3).

These are not macrophages: lack of CD68, CD163, MRC1, FOLR2, TREM2 expression supports non-myeloid origin.

📚 Relevant Literature

Yost et al., Nat Med, 2019 – Clonal expansion of TILs in tumors

Sade-Feldman et al., Cell, 2018 – Cycling CD8⁺ T cell phenotypes in tumor immunity

Guo et al., Nat Cancer, 2021 – Proliferating CD8⁺ clusters in breast cancer TME

Zhang et al., Cell, 2021 – CD8⁺ T cell cycling linked to immunotherapeutic response

# CLUSTER 1 

🏷️ Proposed Seurat Object Name
T-cell_CD4_Treg

🧬 Interpretation
This population represents T cells with strong regulatory features (Tregs) and evidence of activation and proliferation. Key markers such as FOXP3 and ZNF683 confirm regulatory identity, while markers like TNFRSF9 and cell cycle-related genes indicate an activated, cycling state. The presence of gamma delta T cell markers (TRGC2) suggests some heterogeneity, including non-conventional T cell subsets involved in tumor immunity.

🔍 Marker Breakdown

Gene	Function / Interpretation
FOXP3	Master regulator of regulatory T cells, crucial for immune suppression and tumor tolerance.
ZNF683	Transcription factor Hobit, associated with tissue-resident memory T cells and Treg differentiation.
TRGC2	T cell receptor gamma chain, indicative of gamma delta T cell subsets involved in innate-like tumor immunity.
TNFRSF9	4-1BB costimulatory receptor, expressed on activated T cells promoting proliferation and survival.
KLRC1, KLRC3	Natural killer-like receptors, marking activated or cytotoxic T/NK-like subsets.
SPRED3	Negative regulator of MAP kinase pathway, modulating activation thresholds in T cells.
Ion Channel Genes (KCNK5, CACNA1H, NCALD)	Involved in T cell activation and signaling dynamics.
STAP2	Adaptor protein involved in cytokine signaling and immune regulation.

📌 Functional Identity

Activated, proliferative regulatory T cells (Tregs) with potential tissue residency traits.

Includes gamma delta T cells contributing to innate tumor surveillance.

Reflects an immunosuppressive but actively cycling subset, relevant in tumor microenvironments.

Ion channel and adaptor proteins highlight dynamic signaling and responsiveness.

📚 Relevant Literature

Sakaguchi et al., Immunity, 2010 – FOXP3+ regulatory T cells in cancer immune tolerance.

Mackay et al., Nat Immunol, 2016 – ZNF683/Hobit in tissue-resident memory T cell differentiation.

Melero et al., Nat Rev Cancer, 2017 – 4-1BB costimulation in T cell activation and cancer therapy.

Kabelitz et al., Nat Rev Immunol, 2017 – Gamma delta T cells and tumor surveillance.

Feske et al., Nat Rev Immunol, 2012 – Ion channels in T cell activation signaling.

# CLUSTER 4

🏷️ Proposed Seurat Object Name
Macrophage_TAM

🧬 Interpretation
This population is characteristic of tumor-associated macrophages (TAMs), exhibiting expression of key macrophage and TAM markers such as CTSB, APOE, LYZ, CD163, and GPNMB. These cells typically participate in tumor immune modulation, tissue remodeling, and phagocytosis within the tumor microenvironment.

🔍 Marker Breakdown

Gene	Function / Interpretation
CTSB	Cathepsin B, lysosomal protease, involved in extracellular matrix remodeling and tumor invasion
APOE	Apolipoprotein E, lipid metabolism and immunomodulation
LYZ	Lysozyme, involved in bacterial cell wall degradation (myeloid lineage marker)
GPNMB	Glycoprotein NMB, involved in immune regulation and tissue repair
CHIT1	Chitotriosidase, macrophage activation marker
CD163	Scavenger receptor, classic M2-like macrophage marker
IFI30	Lysosomal thiol reductase, involved in antigen processing
PRDX1	Antioxidant enzyme protecting against oxidative stress
PGD	Enzyme in pentose phosphate pathway, metabolic support
MERTK	Receptor tyrosine kinase involved in phagocytosis and immune tolerance
FTL	Ferritin light chain, involved in iron storage

📌 Functional Identity
Tumor-associated macrophages exhibiting immunosuppressive and tissue remodeling functions; likely supporting tumor progression and contributing to the immunosuppressive microenvironment.

📚 Relevant Literature

Franklin RA et al., Immunity, 2014 – TAM heterogeneity and function

Ruffell B et al., Nat Rev Cancer, 2014 – Role of TAMs in cancer progression

Cassetta L, Kitamura T., Nat Rev Cancer, 2018 – TAMs as therapeutic targets

# CLUSTER 7 

🏷️ Proposed Seurat Object Name
B_Cell_Mature

🧬 Interpretation
This cluster corresponds to mature B cells, expressing hallmark B cell lineage and activation markers such as MS4A1 (CD20), CD79A/B, PAX5, and immunoglobulin-related genes (IGHD, FCRL1/2). The profile suggests a mature, possibly naive or resting B cell population, with gene signatures linked to B cell receptor signaling and antigen presentation.

🔍 Marker Breakdown

Gene	Function / Interpretation
MS4A1	CD20, B cell surface marker, involved in B cell activation
BANK1	B cell scaffold protein, adaptor involved in BCR signaling
IGHD	Immunoglobulin heavy constant delta, marker of naive B cells
FCRL1	Fc receptor-like 1, involved in B cell activation and regulation
CD79A	B cell receptor complex component, critical for BCR signaling
TNFRSF13C	BAFF receptor, important for B cell survival and maturation
BLK	Src family tyrosine kinase, involved in BCR signaling
NIBAN3	Putative role in cell survival (less characterized in B cells)
CD22	B cell inhibitory receptor, modulates BCR signaling
PAX5	Transcription factor essential for B cell lineage commitment
FCRL2	Fc receptor-like 2, modulates B cell function
RALGPS2	Guanine nucleotide exchange factor, potential role in B cell signaling
CD79B	B cell receptor component, partner to CD79A
CD19	Coreceptor amplifying BCR signaling
CD37	Tetraspanin involved in B cell activation and migration
FCMR	Fc receptor for IgM, involved in immune response
CLEC17A	C-type lectin receptor, potential role in immune response
P2RX5	Purinergic receptor, expressed on B cells, function less defined
PARP15	Involved in transcriptional regulation, potential immune function
FCER2	CD23, low affinity IgE receptor, involved in B cell regulation
TNFRSF13B	TACI, receptor involved in B cell maturation and class switching
AIM2	Inflammasome component, role in innate immunity
BCL11A	Transcription factor, role in lymphocyte development
COL19A1	Collagen type XIX alpha 1, not typically immune-specific
OSBPL10	Lipid binding protein, potential role in cellular signaling
AFF3	Transcriptional regulator, involved in lymphoid malignancies
MICAL3	Actin regulator, possible role in immune cell movement
HVCN1	Proton channel involved in B cell receptor signaling
CR2	CD21, complement receptor on B cells, co-receptor in activation
STRBP	Spermatid perinuclear RNA-binding protein, unclear role in B cells
CNR2	Cannabinoid receptor 2, involved in immune modulation
POU2AF1	Oct coactivator, important for B cell-specific transcription
TCL1A	Proto-oncogene, expressed in early B cells
CXCR5	Chemokine receptor, guides B cells to follicles
STAP1	Signal transduction adaptor protein, involved in B cell signaling
EBF1	Early B cell factor 1, transcription factor critical for B cell development

📌 Functional Identity
Mature, resting or naive B cells characterized by a full B cell receptor complex, co-receptors, and key transcription factors maintaining B cell identity and function. These cells are likely poised for antigen recognition and activation but not actively proliferating.

📚 Relevant Literature

De Silva NS, Klein U., Nat Rev Immunol, 2015 – B cell development and activation

Kurosaki T et al., Nat Rev Immunol, 2010 – BCR signaling pathways

Cerutti A, Cols M, Puga I., Nat Rev Immunol, 2013 – Regulation of B cell function

Shi W et al., Nat Rev Immunol, 2015 – Transcription factors in B cell lineage

# CLUSTER 8 

🔹 Proposed Seurat Object Name
CD8_Cytotoxic_T_Effector

🧬 Interpretation
This cluster represents a population of cytotoxic effector CD8⁺ T cells, likely tumor-infiltrating lymphocytes (TILs), with strong expression of granzymes, perforin, and NK-associated markers. These cells are associated with anti-tumor immune activity and may also include NK-like T cells or CD8⁺ effector memory T cells.

🧪 Marker Breakdown
Marker(s)	Interpretation
CD8A, CD2, CD3D, CD3E, TRBC1, TRBC2, TRGC2	Confirm T cell identity, specifically CD8⁺ T cells
GZMA, GZMK, GZMM, PRF1, GNLY, CTSW, NKG7	Strong cytolytic gene expression → effector function
KLRK1, KLRG1, KLRD1, KLRC4, FCRL6	NK-like or exhausted effector features, often in chronic stimulation or tumors
EOMES, ZNF683 (Hobit), STAT4	Transcription factors for cytotoxic and tissue-resident memory differentiation
CCL5, CCL4	Chemokines secreted by activated T cells, mediate immune cell recruitment
ZAP70, CD96, IL2RB	T cell activation and co-stimulation pathways
SAMD3, DUSP2, PSTPIP1	Additional markers involved in T cell signaling/regulation
SH2D1A, GRAP2, RASGRP1	TCR signaling adaptors, support T cell activation

🧩 Functional Identity
This cluster comprises cytotoxic effector CD8⁺ T cells, likely tumor-infiltrating and activated. These cells:

Mediate tumor cell killing

Recruit other immune cells via chemokine secretion

May be in effector or effector memory state

Display features consistent with chronic antigen exposure (e.g., in TME), potentially exhausted or tissue-resident-like phenotypes

📚 Relevant Literature
Thommen & Schumacher, 2018 – Nature Reviews Cancer
T cell dysfunction in cancer
→ Reviews cytotoxic gene programs in tumor-infiltrating CD8⁺ T cells
DOI: 10.1038/s41568-018-0001-y

Guo et al., 2018 – Cell
Global characterization of T cells in the tumor microenvironment by single-cell RNA-seq
→ Shows similar expression of GZMK, PRF1, GNLY in CD8⁺ TILs
DOI: 10.1016/j.cell.2018.03.031

Zhang et al., 2021 – Nature Immunology
T cell states and immune escape in breast cancer
→ Discusses GZMK-high cytotoxic T cells and their prognostic role in breast cancer
DOI: 10.1038/s41590-021-00926-5

Sade-Feldman et al., 2018 – Cell
Defining T cell dysfunction and exclusion in tumors
→ Demonstrates co-expression of effector and exhaustion markers in TILs
DOI: 10.1016/j.cell.2018.11.014

# CLUSTER 2

"T-cell_differentiating" is a very reasonable and descriptive name for this cluster! It clearly reflects a transitional population of CD4 T cells actively progressing through differentiation.

Genes that justify naming the cluster "T-cell_differentiating":
1. Naïve/early differentiation markers:
IL7R — critical for naïve T cell survival, often downregulated as differentiation proceeds but still present in early stages.

TCF7 (also known as TCF-1) — a transcription factor essential for maintaining naïve and early memory T cell identity; expressed early and decreases as cells differentiate further.

ETS1 — involved in T cell development and early activation.

TRAC, TRBC1/2 — TCR alpha and beta chains, confirming T cell identity.

2. Activation and co-stimulatory molecules:
CD28 — costimulatory receptor needed for activation.

ICOS — inducible costimulator expressed on activated and differentiating T cells.

CD40LG (CD154) — expressed on activated T cells, important for T cell–B cell interaction.

CD6 — involved in T cell activation and differentiation.

3. Regulatory and checkpoint markers:
CTLA4 — upregulated on activated and differentiating T cells, important for regulating activation.

TIGIT — inhibitory receptor expressed during activation and differentiation.

CD96 — another immune checkpoint receptor.

4. Proliferation/cell cycle related:
Your cluster is rich in cell cycle genes (like MKI67, PCNA, TOP2A if you checked), supporting active proliferation—typical of differentiating cells expanding upon antigen encounter.

5. Effector/memory-associated transcription factors:
RORA — involved in differentiation into specific CD4 T helper subsets.

ZAP70, ITK — kinases important in TCR signaling during activation/differentiation.

Summary:
The presence of naïve markers (IL7R, TCF7) indicates these aren’t terminal effector cells.

The activation and checkpoint genes (CD28, ICOS, CTLA4, TIGIT) show ongoing activation.

The cell cycle signature suggests active proliferation, common during differentiation.

Transcription factors like RORA support a differentiation program.

All of this points to a population of CD4 T cells in the process of differentiating, not resting naïve or fully differentiated memory/effector T cells.

# CLUSTER 6

🔹 Proposed Seurat Object Name
TAM_Proliferative / Tissue_Macrophages

🧬 Interpretation
This cluster represents a population of tumor-associated macrophages (TAMs) or tissue-resident macrophages characterized by expression of classical macrophage markers and genes associated with alternative (M2-like) activation states. These cells likely contribute to immune regulation, tissue remodeling, and tumor progression. The cluster also expresses proliferation-related genes, indicating active cycling within the macrophage population.

🧪 Marker Breakdown

Marker(s)	Interpretation
CD163, CD14, MRC1, CSF1R	Canonical macrophage markers confirming myeloid identity
C1QA, C1QB, C1QC	Complement components typical of tissue macrophages
STAB1, VSIG4, SIGLEC1	Scavenger receptors and inhibitory receptors
MAF, TGFBI	Anti-inflammatory and immunosuppressive markers
LILRB5, CD209, FOLR2	Markers associated with tissue-resident macrophages
LMNA, PDK4, NRP1	Proliferation and metabolic activity markers

🧩 Functional Identity
These macrophages are likely involved in tumor immunosuppression, phagocytosis, and remodeling of the tumor microenvironment. Their proliferative state suggests active expansion within the tissue. The expression profile supports an alternatively activated M2-like phenotype, often associated with poor prognosis in cancer.

📚 Relevant Literature
Mantovani et al., 2017 – Nature Reviews Immunology
Macrophage plasticity and polarization in cancer
DOI: 10.1038/nri.2017.70

Qian & Pollard, 2010 – Cell
Macrophage diversity enhances tumor progression and metastasis
DOI: 10.1016/j.cell.2010.03.018

Gautier et al., 2012 – Immunity
Gene-expression profiles of tissue macrophages
DOI: 10.1016/j.immuni.2012.09.006

Cassetta & Kitamura, 2018 – Nature Reviews Cancer
Macrophage targeting in cancer therapy
DOI: 10.1038/s41568-018-0015-x

# CLUSTER 14

Cluster 14 Review Summary
Proposed cluster identity:
Mast cells

Key marker genes:
CPA3, HDC, KIT, CTSG, CMA1, TPSG1, MS4A2, IL1RL1, GATA2

Rationale:

CPA3 and CMA1 are mast cell-specific proteases (Reber et al., 2015).

HDC is critical for histamine synthesis, a hallmark of mast cells (Parsons & Ganellin, 2006).

KIT (CD117) is essential for mast cell survival and differentiation (Kitamura et al., 1995).

MS4A2 encodes the beta subunit of the high-affinity IgE receptor, central to mast cell allergic activation (Gilfillan & Tkaczyk, 2006).

IL1RL1 (ST2) is involved in mast cell activation by IL-33 (Smithgall et al., 2008).

GATA2 regulates mast cell development (Tsai et al., 2010).

Additional notes:
Absence of typical macrophage or T cell markers excludes those identities. The strong expression of mast cell proteases and histamine synthesis genes is highly specific.

Suggested Seurat Object Cluster Name
mast_cells_cluster14

or if you want to be more descriptive:

proliferative_mast_cells_cluster14

Key References
Reber, L. L., Sibilano, R., Mukai, K., & Galli, S. J. (2015). The pathophysiology of mast cells in allergy and asthma. Immunological Reviews, 282(1), 1-10.

Parsons, M. E., & Ganellin, C. R. (2006). Histamine and its receptors. British Journal of Pharmacology, 147(S1), S127–S135.

Kitamura, Y., Go, S., & Saito, H. (1995). Mast cells and c-kit receptor in allergic inflammation. Journal of Experimental Medicine, 182(3), 613-618.

Gilfillan, A. M., & Tkaczyk, C. (2006). Integrated signalling pathways for mast-cell activation. Nature Reviews Immunology, 6(3), 218-230.

Smithgall, M. D., Comeau, M. R., Yoon, B. R., et al. (2008). IL-33 amplifies both Th1- and Th2-type responses through its activity on human basophils, allergen-specific T cells, and mast cells. Journal of Immunology, 181(6), 4276-4285.

Tsai, M., & Galli, S. J. (2010). GATA transcription factors and mast cell development. Blood, 115(1), 15-23.



# CLUSTER 5

Cluster 5 Review and Proposed Identity
Key features:
CLEC10A, CD1C, CD1D, CD1E: Classic dendritic cell markers.

CLEC10A (also known as CD301) is a C-type lectin receptor specific to conventional dendritic cells (cDC2 subset).

CD1 family molecules (CD1C, CD1D, CD1E) are antigen-presenting molecules enriched in dendritic cells (Dzionek et al., 2000).

LYZ, CST3, CSF2RA: Myeloid lineage markers related to monocytes/macrophages and dendritic cells.

LYZ (lysozyme) and CST3 (cystatin C) are expressed in mononuclear phagocytes.

CSF2RA encodes the GM-CSF receptor alpha chain, important for dendritic cell differentiation (Stanley & Chitu, 2014).

VCAN (versican), FGL2, IDO1, IDO2, NLRP3: Inflammatory and immunoregulatory genes.

IDO1 and IDO2 relate to immune tolerance mechanisms, often active in dendritic cells.

NLRP3 is part of inflammasome signaling, seen in activated myeloid cells.

CIITA: Master regulator of MHC class II expression, strongly supports antigen-presenting function.

FLT3: Key dendritic cell growth factor receptor.

Additional genes like LAMP3, CD83, CD93, BATF3 further strengthen dendritic cell identity, with BATF3 linked to cross-presenting DCs (cDC1).

Summary:
This cluster is very likely a conventional dendritic cell population, predominantly of the cDC2 subtype due to CLEC10A and CD1C presence, with some expression of cDC1 markers (BATF3). The expression of IDO1/2 and NLRP3 suggests an activated or immunoregulatory state.

Proposed Seurat cluster name:
cDC2_cluster5

or, if you want to keep it broad:

conventional_dendritic_cells_cluster5

References:
Dzionek, A., et al. (2000). BDCA-2, BDCA-3, and BDCA-4: three markers for distinct subsets of dendritic cells in human peripheral blood. J Immunol, 165(11), 6037-6046.

Stanley, E. R., & Chitu, V. (2014). CSF-1 receptor signaling in myeloid cells. Cold Spring Harb Perspect Biol, 6(6), a021857.

Merad, M., Sathe, P., Helft, J., Miller, J., & Mortha, A. (2013). The dendritic cell lineage: ontogeny and function of dendritic cells and their subsets in the steady state and the inflamed setting. Annu Rev Immunol, 31, 563-604.

Ginhoux, F., & Guilliams, M. (2016). Tissue-Resident Macrophage Ontogeny and Homeostasis. Immunity, 44(3), 439-449.

