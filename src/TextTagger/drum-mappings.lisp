;;;; ontology mappings from DRUM-specific ontologies to TRIPS ontology
;;;; in DeepSemLex lisp format

;;; ChEBI (Chemical Entities of Biological Interest)
(concept CHEBI::33250 ; atom
  (inherit ONT::molecule)) ; sort of...
(concept CHEBI::59999 ; chemical substance
  (inherit ONT::chemical))
(concept CHEBI::24433 ; group
  (inherit ONT::molecule)) ; sort of...
(concept CHEBI::23367 ; molecular entity
  (inherit ONT::molecule))
(concept CHEBI::24870 ; ion
  (inherit ONT::molecule)) ; would have this mapping anyway, but this way we can check whether it's an ion later
(concept CHEBI::24431 ; chemical entity
  (inherit ONT::chemical))
(concept CHEBI::15986 ; polynucleotide
  (inherit ONT::cell-part))
(concept CHEBI::33699 ; messenger RNA
  (inherit ONT::mrna))
(concept CHEBI::50906 ; role
  (inherit ONT::chemical))
; these two are under "role" above in newer ChEBI, but in the older one that
; CRAFT uses the above term doesn't exist yet, so we map these too
(concept CHEBI::24432 ; biological role
  (inherit ONT::chemical))
(concept CHEBI::33232 ; application
  (inherit ONT::chemical))
; At the top of ChEBI there's also "subatomic particle" ; (36342), which I'm
; not sure how to map yet.

;;; Cell Ontology
(concept CO::0000000 ; cell
  (inherit ONT::cell))

;;; Gene Ontology
(concept GO::0097659 ; nucleic acid-templated transcription
  (inherit ONT::gene-transcription))
(concept GO::0006412 ; translation
  (inherit ONT::gene-translation))
(concept GO::0010467 ; gene expression
  (inherit ONT::gene-translation))
(concept GO::0008150 ; biological process
  (inherit ONT::biological-process))
(concept GO::0044848 ; biological phase
  (inherit ONT::time-span))
(concept GO::0007165 ; signaling
  (inherit ONT::signaling-pathway))
(concept GO::0005575 ; cellular component
  (inherit ONT::cell-part))
(concept GO::0005623 ; cell
  (inherit ONT::cell))
(concept GO::0032991 ; macromolecular complex
  (inherit ONT::macromolecular-complex))
(concept GO::0003674 ; molecular function
  (inherit ONT::biological-process))
; oddly, the Gene Ontology doesn't have a concept for just "gene"

;;; PSI-MI (Molecular Interactions)
(concept MI::0190 ; interaction type
  (inherit ONT::event-of-change))
(concept MI::0313 ; interactor type
  (inherit ONT::molecule))
(concept MI::0314 ; complex
  (inherit ONT::macromolecular-complex))
(concept MI::0326 ; protein
  (inherit ONT::protein))
(concept MI::0250 ; gene
  (inherit ONT::gene)) ; maybe even alias?
(concept MI::0640 ; parameter type
  (inherit ONT::ordered-domain))
(concept MI::0647 ; parameter unit
  (inherit ONT::measure-unit))
(concept MI::0659 ; experimental feature detection
  ; this is also under "feature detection method" but others under there are less clearly mappable
  (inherit ONT::event-of-change))
(concept MI::0002 ; participant identification method
  (inherit ONT::event-of-change))
(concept MI::0500 ; biological role
  (inherit ONT::biological-role))
; Many others at the top of PSI-MI that we either don't want to use at all or
; we don't know how to map, including:
; MI::0346 ; experimental preparation
; MI::0116 ; feature type
; MI::0001 ; interaction detection method
;  It's tempting to map the above to ONT::event-of-change, but a lot of things
;  under it are "technology".

;;; Sequence Ontology
;;; (non-noun mappings are commented out for now)
;(concept SO::0000733 ; feature_attribute
;  (inherit ONT::property-val))
(concept SO::0000443 ; polymer_attribute (polymer named by attribute)
  (inherit ONT::molecule))
;(concept SO::0000986 ; topology_attribute (...except this one)
;  (inherit ONT::spatial))
(concept SO::0000735 ; sequence_location (sequence by location)
  (inherit ONT::molecule)) ; ont::gene? ont::sequence?
(concept SO::0001260 ; sequence_collection
  (inherit ONT::group-object))
(concept SO::0000110 ; sequence_feature
  (inherit ONT::molecular-part))
(concept SO::0001059 ; sequence_alteration
  (inherit ONT::mutation))
;(concept SO::0000041 ; sequence_operation
;  (inherit ONT::change))
(concept SO::0001060 ; sequence_variant
  (inherit ONT::kind))
(concept SO::1000132 ; sequence_variant_effect (variant by effect)
  (inherit ONT::kind))
;; not mapped: chromosome_variation, sequence_replication_mode

;;; Experimental Factor Ontology
(concept EFO::0000322 ; cell line
  (inherit ONT::cell-line))
(concept EFO::0000408 ; disease
  (inherit ONT::medical-disorders-and-conditions))
(concept EFO::0000546 ; injury
  (inherit ONT::injury))
(concept EFO::0000651 ; phenotype
  (inherit ONT::physical-condition)) ; maybe? lots of "abnormality"s under ph.
(concept EFO::0004446 ; biological macromolecule
  (inherit ONT::molecule))
(concept EFO::0000324 ; cell type
  (inherit ONT::cell))
(concept EFO::0000548 ; instrument
  (inherit ONT::medical-instrument))
(concept EFO::0000786 ; anatomy basic component
  (inherit ONT::body-part))
(concept EFO::0004542 ; planned process
  (inherit ONT::process))
;;; (non-noun mappings are commented out for now)
; (concept EFO::0001648 ; geometric modifier
;   (inherit ONT::location-val)) ; (anatomical location)
; (concept EFO::0000323 ; cell property
;   (inherit ONT::property-val))
; ...

;;; Units of Measurement Ontology (included in and extended by EFO)
(concept UO::0000000
  (inherit ONT::measure-unit))
(concept UO::0000121 ; angle unit
  (inherit ONT::angle-unit))
(concept UO::0000001 ; length unit
  (inherit ONT::length-unit))
; NOTE: ONT::luminosity-unit has candela, which is not the same thing as any of
; UO's light-related unit types
(concept UO::0000002 ; mass unit
  (inherit ONT::weight-unit)) ; ick
(concept UO::0000005 ; temperature unit
  (inherit ONT::temperature-unit))
(concept UO::0000003 ; time unit
  (inherit ONT::time-unit))
(concept UO::0000047 ; area unit
  (inherit ONT::area-unit))
(concept UO::0004418 ; unit of flow rate
  (inherit ONT::rate-unit))
(concept UO::0000095 ; volume unit
  (inherit ONT::volume-unit))

;;; BRENDA Tissue Ontology
(concept BTO::0000000 ; tissues, cell types and enzyme sources
  (inherit ONT::internal-body-part))
(concept BTO::0001490 ; other source
  (inherit ONT::referential-sem)) ; block this subtree, except those below
;(concept BTO::0000214 ; cell culture
;  (inherit ONT:: )) ; TODO
(concept BTO::0003809 ; soil
  (inherit ONT::substance))
;; everything ending in " cell line" with no is_a
(concept BTO::0000003 (inherit ONT::cell-line))
(concept BTO::0000067 (inherit ONT::cell-line))
(concept BTO::0000070 (inherit ONT::cell-line))
(concept BTO::0000096 (inherit ONT::cell-line))
(concept BTO::0000104 (inherit ONT::cell-line))
(concept BTO::0000110 (inherit ONT::cell-line))
(concept BTO::0000183 (inherit ONT::cell-line))
(concept BTO::0000201 (inherit ONT::cell-line))
(concept BTO::0000224 (inherit ONT::cell-line))
(concept BTO::0000255 (inherit ONT::cell-line))
(concept BTO::0000256 (inherit ONT::cell-line))
(concept BTO::0000264 (inherit ONT::cell-line))
(concept BTO::0000353 (inherit ONT::cell-line))
(concept BTO::0000374 (inherit ONT::cell-line))
(concept BTO::0000375 (inherit ONT::cell-line))
(concept BTO::0000400 (inherit ONT::cell-line))
(concept BTO::0000403 (inherit ONT::cell-line))
(concept BTO::0000427 (inherit ONT::cell-line))
(concept BTO::0000453 (inherit ONT::cell-line))
(concept BTO::0000578 (inherit ONT::cell-line))
(concept BTO::0000669 (inherit ONT::cell-line))
(concept BTO::0000716 (inherit ONT::cell-line))
(concept BTO::0000743 (inherit ONT::cell-line))
(concept BTO::0000773 (inherit ONT::cell-line))
(concept BTO::0000807 (inherit ONT::cell-line))
(concept BTO::0000816 (inherit ONT::cell-line))
(concept BTO::0000819 (inherit ONT::cell-line))
(concept BTO::0000849 (inherit ONT::cell-line))
(concept BTO::0000851 (inherit ONT::cell-line))
(concept BTO::0000872 (inherit ONT::cell-line))
(concept BTO::0000885 (inherit ONT::cell-line))
(concept BTO::0000906 (inherit ONT::cell-line))
(concept BTO::0000932 (inherit ONT::cell-line))
(concept BTO::0000947 (inherit ONT::cell-line))
(concept BTO::0000955 (inherit ONT::cell-line))
(concept BTO::0000977 (inherit ONT::cell-line))
(concept BTO::0001019 (inherit ONT::cell-line))
(concept BTO::0001035 (inherit ONT::cell-line))
(concept BTO::0001088 (inherit ONT::cell-line))
(concept BTO::0001120 (inherit ONT::cell-line))
(concept BTO::0001216 (inherit ONT::cell-line))
(concept BTO::0001242 (inherit ONT::cell-line))
(concept BTO::0001510 (inherit ONT::cell-line))
(concept BTO::0001522 (inherit ONT::cell-line))
(concept BTO::0001526 (inherit ONT::cell-line))
(concept BTO::0001549 (inherit ONT::cell-line))
(concept BTO::0001586 (inherit ONT::cell-line))
(concept BTO::0001614 (inherit ONT::cell-line))
(concept BTO::0001668 (inherit ONT::cell-line))
(concept BTO::0001876 (inherit ONT::cell-line))
(concept BTO::0001897 (inherit ONT::cell-line))
(concept BTO::0001926 (inherit ONT::cell-line))
(concept BTO::0001963 (inherit ONT::cell-line))
(concept BTO::0001966 (inherit ONT::cell-line))
(concept BTO::0001971 (inherit ONT::cell-line))
(concept BTO::0001975 (inherit ONT::cell-line))
(concept BTO::0001996 (inherit ONT::cell-line))
(concept BTO::0002024 (inherit ONT::cell-line))
(concept BTO::0002027 (inherit ONT::cell-line))
(concept BTO::0002030 (inherit ONT::cell-line))
(concept BTO::0002052 (inherit ONT::cell-line))
(concept BTO::0002145 (inherit ONT::cell-line))
(concept BTO::0002195 (inherit ONT::cell-line))
(concept BTO::0002225 (inherit ONT::cell-line))
(concept BTO::0002290 (inherit ONT::cell-line))
(concept BTO::0002334 (inherit ONT::cell-line))
(concept BTO::0002424 (inherit ONT::cell-line))
(concept BTO::0002629 (inherit ONT::cell-line))
(concept BTO::0002632 (inherit ONT::cell-line))
(concept BTO::0002637 (inherit ONT::cell-line))
(concept BTO::0002652 (inherit ONT::cell-line))
(concept BTO::0002658 (inherit ONT::cell-line))
(concept BTO::0002662 (inherit ONT::cell-line))
(concept BTO::0002820 (inherit ONT::cell-line))
(concept BTO::0002886 (inherit ONT::cell-line))
(concept BTO::0002888 (inherit ONT::cell-line))
(concept BTO::0002891 (inherit ONT::cell-line))
(concept BTO::0002901 (inherit ONT::cell-line))
(concept BTO::0002904 (inherit ONT::cell-line))
(concept BTO::0002913 (inherit ONT::cell-line))
(concept BTO::0002928 (inherit ONT::cell-line))
(concept BTO::0002932 (inherit ONT::cell-line))
(concept BTO::0002936 (inherit ONT::cell-line))
(concept BTO::0002980 (inherit ONT::cell-line))
(concept BTO::0003036 (inherit ONT::cell-line))
(concept BTO::0003061 (inherit ONT::cell-line))
(concept BTO::0003103 (inherit ONT::cell-line))
(concept BTO::0003150 (inherit ONT::cell-line))
(concept BTO::0003183 (inherit ONT::cell-line))
(concept BTO::0003192 (inherit ONT::cell-line))
(concept BTO::0003205 (inherit ONT::cell-line))
(concept BTO::0003221 (inherit ONT::cell-line))
(concept BTO::0003225 (inherit ONT::cell-line))
(concept BTO::0003235 (inherit ONT::cell-line))
(concept BTO::0003250 (inherit ONT::cell-line))
(concept BTO::0003252 (inherit ONT::cell-line))
(concept BTO::0003265 (inherit ONT::cell-line))
(concept BTO::0003274 (inherit ONT::cell-line))
(concept BTO::0003296 (inherit ONT::cell-line))
(concept BTO::0003337 (inherit ONT::cell-line))
(concept BTO::0003349 (inherit ONT::cell-line))
(concept BTO::0003420 (inherit ONT::cell-line))
(concept BTO::0003436 (inherit ONT::cell-line))
(concept BTO::0003452 (inherit ONT::cell-line))
(concept BTO::0003483 (inherit ONT::cell-line))
(concept BTO::0003507 (inherit ONT::cell-line))
(concept BTO::0003578 (inherit ONT::cell-line))
(concept BTO::0003581 (inherit ONT::cell-line))
(concept BTO::0003583 (inherit ONT::cell-line))
(concept BTO::0003640 (inherit ONT::cell-line))
(concept BTO::0003694 (inherit ONT::cell-line))
(concept BTO::0003765 (inherit ONT::cell-line))
(concept BTO::0003858 (inherit ONT::cell-line))
(concept BTO::0003894 (inherit ONT::cell-line))
(concept BTO::0003907 (inherit ONT::cell-line))
(concept BTO::0003909 (inherit ONT::cell-line))
(concept BTO::0004114 (inherit ONT::cell-line))
(concept BTO::0004229 (inherit ONT::cell-line))
(concept BTO::0004237 (inherit ONT::cell-line))
(concept BTO::0004243 (inherit ONT::cell-line))
(concept BTO::0004259 (inherit ONT::cell-line))
(concept BTO::0004268 (inherit ONT::cell-line))
(concept BTO::0004272 (inherit ONT::cell-line))
(concept BTO::0004324 (inherit ONT::cell-line))
(concept BTO::0004389 (inherit ONT::cell-line))
(concept BTO::0004398 (inherit ONT::cell-line))
(concept BTO::0004431 (inherit ONT::cell-line))
(concept BTO::0004509 (inherit ONT::cell-line))
(concept BTO::0004590 (inherit ONT::cell-line))
(concept BTO::0004610 (inherit ONT::cell-line))
(concept BTO::0004641 (inherit ONT::cell-line))
(concept BTO::0004663 (inherit ONT::cell-line))
(concept BTO::0004780 (inherit ONT::cell-line))
(concept BTO::0004830 (inherit ONT::cell-line))
(concept BTO::0004861 (inherit ONT::cell-line))
(concept BTO::0004975 (inherit ONT::cell-line))
(concept BTO::0005117 (inherit ONT::cell-line))
(concept BTO::0005261 (inherit ONT::cell-line))
(concept BTO::0005375 (inherit ONT::cell-line))
(concept BTO::0005488 (inherit ONT::cell-line))
(concept BTO::0005497 (inherit ONT::cell-line))
(concept BTO::0005623 (inherit ONT::cell-line))
;; everything ending in " cell" with no is_a
(concept BTO::0000011 (inherit ONT::cell))
(concept BTO::0000094 (inherit ONT::cell))
(concept BTO::0000103 (inherit ONT::cell))
(concept BTO::0000112 (inherit ONT::cell))
(concept BTO::0000125 (inherit ONT::cell))
(concept BTO::0000154 (inherit ONT::cell))
(concept BTO::0000171 (inherit ONT::cell))
(concept BTO::0000180 (inherit ONT::cell))
(concept BTO::0000193 (inherit ONT::cell))
(concept BTO::0000196 (inherit ONT::cell))
(concept BTO::0000225 (inherit ONT::cell))
(concept BTO::0000257 (inherit ONT::cell))
(concept BTO::0000259 (inherit ONT::cell))
(concept BTO::0000279 (inherit ONT::cell))
(concept BTO::0000309 (inherit ONT::cell))
(concept BTO::0000335 (inherit ONT::cell))
(concept BTO::0000362 (inherit ONT::cell))
(concept BTO::0000372 (inherit ONT::cell))
(concept BTO::0000392 (inherit ONT::cell))
(concept BTO::0000395 (inherit ONT::cell))
(concept BTO::0000414 (inherit ONT::cell))
(concept BTO::0000415 (inherit ONT::cell))
(concept BTO::0000429 (inherit ONT::cell))
(concept BTO::0000433 (inherit ONT::cell))
(concept BTO::0000457 (inherit ONT::cell))
(concept BTO::0000498 (inherit ONT::cell))
(concept BTO::0000526 (inherit ONT::cell))
(concept BTO::0000535 (inherit ONT::cell))
(concept BTO::0000540 (inherit ONT::cell))
(concept BTO::0000542 (inherit ONT::cell))
(concept BTO::0000544 (inherit ONT::cell))
(concept BTO::0000551 (inherit ONT::cell))
(concept BTO::0000560 (inherit ONT::cell))
(concept BTO::0000566 (inherit ONT::cell))
(concept BTO::0000568 (inherit ONT::cell))
(concept BTO::0000574 (inherit ONT::cell))
(concept BTO::0000579 (inherit ONT::cell))
(concept BTO::0000580 (inherit ONT::cell))
(concept BTO::0000581 (inherit ONT::cell))
(concept BTO::0000583 (inherit ONT::cell))
(concept BTO::0000592 (inherit ONT::cell))
(concept BTO::0000594 (inherit ONT::cell))
(concept BTO::0000610 (inherit ONT::cell))
(concept BTO::0000638 (inherit ONT::cell))
(concept BTO::0000665 (inherit ONT::cell))
(concept BTO::0000680 (inherit ONT::cell))
(concept BTO::0000774 (inherit ONT::cell))
(concept BTO::0000783 (inherit ONT::cell))
(concept BTO::0000793 (inherit ONT::cell))
(concept BTO::0000803 (inherit ONT::cell))
(concept BTO::0000805 (inherit ONT::cell))
(concept BTO::0000809 (inherit ONT::cell))
(concept BTO::0000832 (inherit ONT::cell))
(concept BTO::0000853 (inherit ONT::cell))
(concept BTO::0000908 (inherit ONT::cell))
(concept BTO::0000931 (inherit ONT::cell))
(concept BTO::0000946 (inherit ONT::cell))
(concept BTO::0000953 (inherit ONT::cell))
(concept BTO::0000963 (inherit ONT::cell))
(concept BTO::0000990 (inherit ONT::cell))
(concept BTO::0000993 (inherit ONT::cell))
(concept BTO::0001005 (inherit ONT::cell))
(concept BTO::0001023 (inherit ONT::cell))
(concept BTO::0001032 (inherit ONT::cell))
(concept BTO::0001039 (inherit ONT::cell))
(concept BTO::0001055 (inherit ONT::cell))
(concept BTO::0001076 (inherit ONT::cell))
(concept BTO::0001086 (inherit ONT::cell))
(concept BTO::0001096 (inherit ONT::cell))
(concept BTO::0001112 (inherit ONT::cell))
(concept BTO::0001130 (inherit ONT::cell))
(concept BTO::0001176 (inherit ONT::cell))
(concept BTO::0001211 (inherit ONT::cell))
(concept BTO::0001220 (inherit ONT::cell))
(concept BTO::0001240 (inherit ONT::cell))
(concept BTO::0001248 (inherit ONT::cell))
(concept BTO::0001283 (inherit ONT::cell))
(concept BTO::0001286 (inherit ONT::cell))
(concept BTO::0001289 (inherit ONT::cell))
(concept BTO::0001326 (inherit ONT::cell))
(concept BTO::0001342 (inherit ONT::cell))
(concept BTO::0001405 (inherit ONT::cell))
(concept BTO::0001460 (inherit ONT::cell))
(concept BTO::0001470 (inherit ONT::cell))
(concept BTO::0001474 (inherit ONT::cell))
(concept BTO::0001524 (inherit ONT::cell))
(concept BTO::0001525 (inherit ONT::cell))
(concept BTO::0001533 (inherit ONT::cell))
(concept BTO::0001565 (inherit ONT::cell))
(concept BTO::0001566 (inherit ONT::cell))
(concept BTO::0001573 (inherit ONT::cell))
(concept BTO::0001576 (inherit ONT::cell))
(concept BTO::0001577 (inherit ONT::cell))
(concept BTO::0001615 (inherit ONT::cell))
(concept BTO::0001622 (inherit ONT::cell))
(concept BTO::0001625 (inherit ONT::cell))
(concept BTO::0001676 (inherit ONT::cell))
(concept BTO::0001683 (inherit ONT::cell))
(concept BTO::0001736 (inherit ONT::cell))
(concept BTO::0001737 (inherit ONT::cell))
(concept BTO::0001774 (inherit ONT::cell))
(concept BTO::0001780 (inherit ONT::cell))
(concept BTO::0001781 (inherit ONT::cell))
(concept BTO::0001800 (inherit ONT::cell))
(concept BTO::0001801 (inherit ONT::cell))
(concept BTO::0001891 (inherit ONT::cell))
(concept BTO::0001892 (inherit ONT::cell))
(concept BTO::0001895 (inherit ONT::cell))
(concept BTO::0001935 (inherit ONT::cell))
(concept BTO::0001948 (inherit ONT::cell))
(concept BTO::0001983 (inherit ONT::cell))
(concept BTO::0001995 (inherit ONT::cell))
(concept BTO::0002015 (inherit ONT::cell))
(concept BTO::0002029 (inherit ONT::cell))
(concept BTO::0002039 (inherit ONT::cell))
(concept BTO::0002040 (inherit ONT::cell))
(concept BTO::0002042 (inherit ONT::cell))
(concept BTO::0002050 (inherit ONT::cell))
(concept BTO::0002064 (inherit ONT::cell))
(concept BTO::0002076 (inherit ONT::cell))
(concept BTO::0002104 (inherit ONT::cell))
(concept BTO::0002158 (inherit ONT::cell))
(concept BTO::0002174 (inherit ONT::cell))
(concept BTO::0002176 (inherit ONT::cell))
(concept BTO::0002179 (inherit ONT::cell))
(concept BTO::0002180 (inherit ONT::cell))
(concept BTO::0002218 (inherit ONT::cell))
(concept BTO::0002219 (inherit ONT::cell))
(concept BTO::0002242 (inherit ONT::cell))
(concept BTO::0002280 (inherit ONT::cell))
(concept BTO::0002363 (inherit ONT::cell))
(concept BTO::0002365 (inherit ONT::cell))
(concept BTO::0002372 (inherit ONT::cell))
(concept BTO::0002386 (inherit ONT::cell))
(concept BTO::0002387 (inherit ONT::cell))
(concept BTO::0002388 (inherit ONT::cell))
(concept BTO::0002391 (inherit ONT::cell))
(concept BTO::0002395 (inherit ONT::cell))
(concept BTO::0002396 (inherit ONT::cell))
(concept BTO::0002408 (inherit ONT::cell))
(concept BTO::0002409 (inherit ONT::cell))
(concept BTO::0002413 (inherit ONT::cell))
(concept BTO::0002414 (inherit ONT::cell))
(concept BTO::0002415 (inherit ONT::cell))
(concept BTO::0002423 (inherit ONT::cell))
(concept BTO::0002426 (inherit ONT::cell))
(concept BTO::0002430 (inherit ONT::cell))
(concept BTO::0002440 (inherit ONT::cell))
(concept BTO::0002478 (inherit ONT::cell))
(concept BTO::0002499 (inherit ONT::cell))
(concept BTO::0002509 (inherit ONT::cell))
(concept BTO::0002524 (inherit ONT::cell))
(concept BTO::0002538 (inherit ONT::cell))
(concept BTO::0002554 (inherit ONT::cell))
(concept BTO::0002574 (inherit ONT::cell))
(concept BTO::0002579 (inherit ONT::cell))
(concept BTO::0002584 (inherit ONT::cell))
(concept BTO::0002585 (inherit ONT::cell))
(concept BTO::0002587 (inherit ONT::cell))
(concept BTO::0002588 (inherit ONT::cell))
(concept BTO::0002591 (inherit ONT::cell))
(concept BTO::0002592 (inherit ONT::cell))
(concept BTO::0002593 (inherit ONT::cell))
(concept BTO::0002603 (inherit ONT::cell))
(concept BTO::0002606 (inherit ONT::cell))
(concept BTO::0002625 (inherit ONT::cell))
(concept BTO::0002640 (inherit ONT::cell))
(concept BTO::0002641 (inherit ONT::cell))
(concept BTO::0002642 (inherit ONT::cell))
(concept BTO::0002653 (inherit ONT::cell))
(concept BTO::0002663 (inherit ONT::cell))
(concept BTO::0002666 (inherit ONT::cell))
(concept BTO::0002688 (inherit ONT::cell))
(concept BTO::0002694 (inherit ONT::cell))
(concept BTO::0002732 (inherit ONT::cell))
(concept BTO::0002751 (inherit ONT::cell))
(concept BTO::0002752 (inherit ONT::cell))
(concept BTO::0002753 (inherit ONT::cell))
(concept BTO::0002754 (inherit ONT::cell))
(concept BTO::0002755 (inherit ONT::cell))
(concept BTO::0002756 (inherit ONT::cell))
(concept BTO::0002757 (inherit ONT::cell))
(concept BTO::0002758 (inherit ONT::cell))
(concept BTO::0002759 (inherit ONT::cell))
(concept BTO::0002760 (inherit ONT::cell))
(concept BTO::0002761 (inherit ONT::cell))
(concept BTO::0002762 (inherit ONT::cell))
(concept BTO::0002763 (inherit ONT::cell))
(concept BTO::0002764 (inherit ONT::cell))
(concept BTO::0002765 (inherit ONT::cell))
(concept BTO::0002766 (inherit ONT::cell))
(concept BTO::0002770 (inherit ONT::cell))
(concept BTO::0002773 (inherit ONT::cell))
(concept BTO::0002790 (inherit ONT::cell))
(concept BTO::0002808 (inherit ONT::cell))
(concept BTO::0002836 (inherit ONT::cell))
(concept BTO::0002838 (inherit ONT::cell))
(concept BTO::0002850 (inherit ONT::cell))
(concept BTO::0002875 (inherit ONT::cell))
(concept BTO::0002876 (inherit ONT::cell))
(concept BTO::0002883 (inherit ONT::cell))
(concept BTO::0002887 (inherit ONT::cell))
(concept BTO::0002906 (inherit ONT::cell))
(concept BTO::0002908 (inherit ONT::cell))
(concept BTO::0002911 (inherit ONT::cell))
(concept BTO::0002922 (inherit ONT::cell))
(concept BTO::0002927 (inherit ONT::cell))
(concept BTO::0002939 (inherit ONT::cell))
(concept BTO::0002974 (inherit ONT::cell))
(concept BTO::0002988 (inherit ONT::cell))
(concept BTO::0002998 (inherit ONT::cell))
(concept BTO::0002999 (inherit ONT::cell))
(concept BTO::0003032 (inherit ONT::cell))
(concept BTO::0003033 (inherit ONT::cell))
(concept BTO::0003038 (inherit ONT::cell))
(concept BTO::0003039 (inherit ONT::cell))
(concept BTO::0003045 (inherit ONT::cell))
(concept BTO::0003055 (inherit ONT::cell))
(concept BTO::0003057 (inherit ONT::cell))
(concept BTO::0003058 (inherit ONT::cell))
(concept BTO::0003060 (inherit ONT::cell))
(concept BTO::0003064 (inherit ONT::cell))
(concept BTO::0003065 (inherit ONT::cell))
(concept BTO::0003066 (inherit ONT::cell))
(concept BTO::0003077 (inherit ONT::cell))
(concept BTO::0003079 (inherit ONT::cell))
(concept BTO::0003085 (inherit ONT::cell))
(concept BTO::0003107 (inherit ONT::cell))
(concept BTO::0003142 (inherit ONT::cell))
(concept BTO::0003180 (inherit ONT::cell))
(concept BTO::0003207 (inherit ONT::cell))
(concept BTO::0003211 (inherit ONT::cell))
(concept BTO::0003216 (inherit ONT::cell))
(concept BTO::0003220 (inherit ONT::cell))
(concept BTO::0003237 (inherit ONT::cell))
(concept BTO::0003263 (inherit ONT::cell))
(concept BTO::0003282 (inherit ONT::cell))
(concept BTO::0003294 (inherit ONT::cell))
(concept BTO::0003300 (inherit ONT::cell))
(concept BTO::0003314 (inherit ONT::cell))
(concept BTO::0003318 (inherit ONT::cell))
(concept BTO::0003336 (inherit ONT::cell))
(concept BTO::0003341 (inherit ONT::cell))
(concept BTO::0003342 (inherit ONT::cell))
(concept BTO::0003343 (inherit ONT::cell))
(concept BTO::0003344 (inherit ONT::cell))
(concept BTO::0003355 (inherit ONT::cell))
(concept BTO::0003423 (inherit ONT::cell))
(concept BTO::0003431 (inherit ONT::cell))
(concept BTO::0003450 (inherit ONT::cell))
(concept BTO::0003457 (inherit ONT::cell))
(concept BTO::0003465 (inherit ONT::cell))
(concept BTO::0003466 (inherit ONT::cell))
(concept BTO::0003468 (inherit ONT::cell))
(concept BTO::0003469 (inherit ONT::cell))
(concept BTO::0003494 (inherit ONT::cell))
(concept BTO::0003537 (inherit ONT::cell))
(concept BTO::0003538 (inherit ONT::cell))
(concept BTO::0003539 (inherit ONT::cell))
(concept BTO::0003557 (inherit ONT::cell))
(concept BTO::0003571 (inherit ONT::cell))
(concept BTO::0003572 (inherit ONT::cell))
(concept BTO::0003573 (inherit ONT::cell))
(concept BTO::0003586 (inherit ONT::cell))
(concept BTO::0003587 (inherit ONT::cell))
(concept BTO::0003588 (inherit ONT::cell))
(concept BTO::0003600 (inherit ONT::cell))
(concept BTO::0003602 (inherit ONT::cell))
(concept BTO::0003615 (inherit ONT::cell))
(concept BTO::0003631 (inherit ONT::cell))
(concept BTO::0003652 (inherit ONT::cell))
(concept BTO::0003666 (inherit ONT::cell))
(concept BTO::0003667 (inherit ONT::cell))
(concept BTO::0003672 (inherit ONT::cell))
(concept BTO::0003683 (inherit ONT::cell))
(concept BTO::0003687 (inherit ONT::cell))
(concept BTO::0003689 (inherit ONT::cell))
(concept BTO::0003692 (inherit ONT::cell))
(concept BTO::0003696 (inherit ONT::cell))
(concept BTO::0003700 (inherit ONT::cell))
(concept BTO::0003716 (inherit ONT::cell))
(concept BTO::0003796 (inherit ONT::cell))
(concept BTO::0003845 (inherit ONT::cell))
(concept BTO::0003851 (inherit ONT::cell))
(concept BTO::0003866 (inherit ONT::cell))
(concept BTO::0003902 (inherit ONT::cell))
(concept BTO::0003917 (inherit ONT::cell))
(concept BTO::0003918 (inherit ONT::cell))
(concept BTO::0003919 (inherit ONT::cell))
(concept BTO::0003922 (inherit ONT::cell))
(concept BTO::0003923 (inherit ONT::cell))
(concept BTO::0003924 (inherit ONT::cell))
(concept BTO::0003929 (inherit ONT::cell))
(concept BTO::0003933 (inherit ONT::cell))
(concept BTO::0003935 (inherit ONT::cell))
(concept BTO::0003939 (inherit ONT::cell))
(concept BTO::0003941 (inherit ONT::cell))
(concept BTO::0003945 (inherit ONT::cell))
(concept BTO::0003958 (inherit ONT::cell))
(concept BTO::0003984 (inherit ONT::cell))
(concept BTO::0003985 (inherit ONT::cell))
(concept BTO::0003989 (inherit ONT::cell))
(concept BTO::0003993 (inherit ONT::cell))
(concept BTO::0004015 (inherit ONT::cell))
(concept BTO::0004038 (inherit ONT::cell))
(concept BTO::0004054 (inherit ONT::cell))
(concept BTO::0004055 (inherit ONT::cell))
(concept BTO::0004061 (inherit ONT::cell))
(concept BTO::0004065 (inherit ONT::cell))
(concept BTO::0004066 (inherit ONT::cell))
(concept BTO::0004067 (inherit ONT::cell))
(concept BTO::0004068 (inherit ONT::cell))
(concept BTO::0004069 (inherit ONT::cell))
(concept BTO::0004075 (inherit ONT::cell))
(concept BTO::0004087 (inherit ONT::cell))
(concept BTO::0004097 (inherit ONT::cell))
(concept BTO::0004098 (inherit ONT::cell))
(concept BTO::0004099 (inherit ONT::cell))
(concept BTO::0004100 (inherit ONT::cell))
(concept BTO::0004108 (inherit ONT::cell))
(concept BTO::0004119 (inherit ONT::cell))
(concept BTO::0004126 (inherit ONT::cell))
(concept BTO::0004164 (inherit ONT::cell))
(concept BTO::0004169 (inherit ONT::cell))
(concept BTO::0004170 (inherit ONT::cell))
(concept BTO::0004181 (inherit ONT::cell))
(concept BTO::0004187 (inherit ONT::cell))
(concept BTO::0004189 (inherit ONT::cell))
(concept BTO::0004190 (inherit ONT::cell))
(concept BTO::0004191 (inherit ONT::cell))
(concept BTO::0004232 (inherit ONT::cell))
(concept BTO::0004236 (inherit ONT::cell))
(concept BTO::0004245 (inherit ONT::cell))
(concept BTO::0004251 (inherit ONT::cell))
(concept BTO::0004252 (inherit ONT::cell))
(concept BTO::0004254 (inherit ONT::cell))
(concept BTO::0004263 (inherit ONT::cell))
(concept BTO::0004264 (inherit ONT::cell))
(concept BTO::0004267 (inherit ONT::cell))
(concept BTO::0004297 (inherit ONT::cell))
(concept BTO::0004298 (inherit ONT::cell))
(concept BTO::0004299 (inherit ONT::cell))
(concept BTO::0004300 (inherit ONT::cell))
(concept BTO::0004301 (inherit ONT::cell))
(concept BTO::0004322 (inherit ONT::cell))
(concept BTO::0004323 (inherit ONT::cell))
(concept BTO::0004339 (inherit ONT::cell))
(concept BTO::0004365 (inherit ONT::cell))
(concept BTO::0004384 (inherit ONT::cell))
(concept BTO::0004390 (inherit ONT::cell))
(concept BTO::0004392 (inherit ONT::cell))
(concept BTO::0004402 (inherit ONT::cell))
(concept BTO::0004403 (inherit ONT::cell))
(concept BTO::0004420 (inherit ONT::cell))
(concept BTO::0004446 (inherit ONT::cell))
(concept BTO::0004447 (inherit ONT::cell))
(concept BTO::0004462 (inherit ONT::cell))
(concept BTO::0004466 (inherit ONT::cell))
(concept BTO::0004473 (inherit ONT::cell))
(concept BTO::0004476 (inherit ONT::cell))
(concept BTO::0004484 (inherit ONT::cell))
(concept BTO::0004492 (inherit ONT::cell))
(concept BTO::0004508 (inherit ONT::cell))
(concept BTO::0004519 (inherit ONT::cell))
(concept BTO::0004533 (inherit ONT::cell))
(concept BTO::0004535 (inherit ONT::cell))
(concept BTO::0004537 (inherit ONT::cell))
(concept BTO::0004541 (inherit ONT::cell))
(concept BTO::0004542 (inherit ONT::cell))
(concept BTO::0004543 (inherit ONT::cell))
(concept BTO::0004561 (inherit ONT::cell))
(concept BTO::0004572 (inherit ONT::cell))
(concept BTO::0004576 (inherit ONT::cell))
(concept BTO::0004578 (inherit ONT::cell))
(concept BTO::0004606 (inherit ONT::cell))
(concept BTO::0004607 (inherit ONT::cell))
(concept BTO::0004627 (inherit ONT::cell))
(concept BTO::0004632 (inherit ONT::cell))
(concept BTO::0004637 (inherit ONT::cell))
(concept BTO::0004662 (inherit ONT::cell))
(concept BTO::0004712 (inherit ONT::cell))
(concept BTO::0004720 (inherit ONT::cell))
(concept BTO::0004730 (inherit ONT::cell))
(concept BTO::0004731 (inherit ONT::cell))
(concept BTO::0004744 (inherit ONT::cell))
(concept BTO::0004754 (inherit ONT::cell))
(concept BTO::0004755 (inherit ONT::cell))
(concept BTO::0004761 (inherit ONT::cell))
(concept BTO::0004774 (inherit ONT::cell))
(concept BTO::0004782 (inherit ONT::cell))
(concept BTO::0004799 (inherit ONT::cell))
(concept BTO::0004804 (inherit ONT::cell))
(concept BTO::0004806 (inherit ONT::cell))
(concept BTO::0004807 (inherit ONT::cell))
(concept BTO::0004808 (inherit ONT::cell))
(concept BTO::0004809 (inherit ONT::cell))
(concept BTO::0004810 (inherit ONT::cell))
(concept BTO::0004811 (inherit ONT::cell))
(concept BTO::0004812 (inherit ONT::cell))
(concept BTO::0004816 (inherit ONT::cell))
(concept BTO::0004837 (inherit ONT::cell))
(concept BTO::0004843 (inherit ONT::cell))
(concept BTO::0004850 (inherit ONT::cell))
(concept BTO::0004851 (inherit ONT::cell))
(concept BTO::0004853 (inherit ONT::cell))
(concept BTO::0004863 (inherit ONT::cell))
(concept BTO::0004867 (inherit ONT::cell))
(concept BTO::0004874 (inherit ONT::cell))
(concept BTO::0004877 (inherit ONT::cell))
(concept BTO::0004881 (inherit ONT::cell))
(concept BTO::0004893 (inherit ONT::cell))
(concept BTO::0004894 (inherit ONT::cell))
(concept BTO::0004897 (inherit ONT::cell))
(concept BTO::0004898 (inherit ONT::cell))
(concept BTO::0004901 (inherit ONT::cell))
(concept BTO::0004905 (inherit ONT::cell))
(concept BTO::0004910 (inherit ONT::cell))
(concept BTO::0004911 (inherit ONT::cell))
(concept BTO::0004916 (inherit ONT::cell))
(concept BTO::0004917 (inherit ONT::cell))
(concept BTO::0004918 (inherit ONT::cell))
(concept BTO::0004920 (inherit ONT::cell))
(concept BTO::0004956 (inherit ONT::cell))
(concept BTO::0004959 (inherit ONT::cell))
(concept BTO::0004966 (inherit ONT::cell))
(concept BTO::0004967 (inherit ONT::cell))
(concept BTO::0004976 (inherit ONT::cell))
(concept BTO::0005006 (inherit ONT::cell))
(concept BTO::0005011 (inherit ONT::cell))
(concept BTO::0005013 (inherit ONT::cell))
(concept BTO::0005025 (inherit ONT::cell))
(concept BTO::0005026 (inherit ONT::cell))
(concept BTO::0005029 (inherit ONT::cell))
(concept BTO::0005030 (inherit ONT::cell))
(concept BTO::0005034 (inherit ONT::cell))
(concept BTO::0005038 (inherit ONT::cell))
(concept BTO::0005044 (inherit ONT::cell))
(concept BTO::0005045 (inherit ONT::cell))
(concept BTO::0005054 (inherit ONT::cell))
(concept BTO::0005059 (inherit ONT::cell))
(concept BTO::0005061 (inherit ONT::cell))
(concept BTO::0005066 (inherit ONT::cell))
(concept BTO::0005069 (inherit ONT::cell))
(concept BTO::0005070 (inherit ONT::cell))
(concept BTO::0005071 (inherit ONT::cell))
(concept BTO::0005075 (inherit ONT::cell))
(concept BTO::0005076 (inherit ONT::cell))
(concept BTO::0005083 (inherit ONT::cell))
(concept BTO::0005092 (inherit ONT::cell))
(concept BTO::0005093 (inherit ONT::cell))
(concept BTO::0005095 (inherit ONT::cell))
(concept BTO::0005101 (inherit ONT::cell))
(concept BTO::0005109 (inherit ONT::cell))
(concept BTO::0005110 (inherit ONT::cell))
(concept BTO::0005111 (inherit ONT::cell))
(concept BTO::0005120 (inherit ONT::cell))
(concept BTO::0005121 (inherit ONT::cell))
(concept BTO::0005127 (inherit ONT::cell))
(concept BTO::0005129 (inherit ONT::cell))
(concept BTO::0005130 (inherit ONT::cell))
(concept BTO::0005134 (inherit ONT::cell))
(concept BTO::0005137 (inherit ONT::cell))
(concept BTO::0005140 (inherit ONT::cell))
(concept BTO::0005141 (inherit ONT::cell))
(concept BTO::0005152 (inherit ONT::cell))
(concept BTO::0005158 (inherit ONT::cell))
(concept BTO::0005159 (inherit ONT::cell))
(concept BTO::0005172 (inherit ONT::cell))
(concept BTO::0005173 (inherit ONT::cell))
(concept BTO::0005185 (inherit ONT::cell))
(concept BTO::0005186 (inherit ONT::cell))
(concept BTO::0005193 (inherit ONT::cell))
(concept BTO::0005195 (inherit ONT::cell))
(concept BTO::0005196 (inherit ONT::cell))
(concept BTO::0005201 (inherit ONT::cell))
(concept BTO::0005212 (inherit ONT::cell))
(concept BTO::0005215 (inherit ONT::cell))
(concept BTO::0005220 (inherit ONT::cell))
(concept BTO::0005221 (inherit ONT::cell))
(concept BTO::0005222 (inherit ONT::cell))
(concept BTO::0005225 (inherit ONT::cell))
(concept BTO::0005238 (inherit ONT::cell))
(concept BTO::0005248 (inherit ONT::cell))
(concept BTO::0005258 (inherit ONT::cell))
(concept BTO::0005262 (inherit ONT::cell))
(concept BTO::0005263 (inherit ONT::cell))
(concept BTO::0005265 (inherit ONT::cell))
(concept BTO::0005267 (inherit ONT::cell))
(concept BTO::0005282 (inherit ONT::cell))
(concept BTO::0005283 (inherit ONT::cell))
(concept BTO::0005296 (inherit ONT::cell))
(concept BTO::0005297 (inherit ONT::cell))
(concept BTO::0005314 (inherit ONT::cell))
(concept BTO::0005320 (inherit ONT::cell))
(concept BTO::0005362 (inherit ONT::cell))
(concept BTO::0005372 (inherit ONT::cell))
(concept BTO::0005397 (inherit ONT::cell))
(concept BTO::0005403 (inherit ONT::cell))
(concept BTO::0005414 (inherit ONT::cell))
(concept BTO::0005416 (inherit ONT::cell))
(concept BTO::0005423 (inherit ONT::cell))
(concept BTO::0005429 (inherit ONT::cell))
(concept BTO::0005437 (inherit ONT::cell))
(concept BTO::0005463 (inherit ONT::cell))
(concept BTO::0005473 (inherit ONT::cell))
(concept BTO::0005484 (inherit ONT::cell))
(concept BTO::0005495 (inherit ONT::cell))
(concept BTO::0005502 (inherit ONT::cell))
(concept BTO::0005511 (inherit ONT::cell))
(concept BTO::0005522 (inherit ONT::cell))
(concept BTO::0005543 (inherit ONT::cell))
(concept BTO::0005545 (inherit ONT::cell))
(concept BTO::0005548 (inherit ONT::cell))
(concept BTO::0005549 (inherit ONT::cell))
(concept BTO::0005555 (inherit ONT::cell))
(concept BTO::0005556 (inherit ONT::cell))
(concept BTO::0005575 (inherit ONT::cell))
(concept BTO::0005586 (inherit ONT::cell))
(concept BTO::0005587 (inherit ONT::cell))
(concept BTO::0005588 (inherit ONT::cell))
(concept BTO::0005589 (inherit ONT::cell))
(concept BTO::0005596 (inherit ONT::cell))
(concept BTO::0005598 (inherit ONT::cell))
(concept BTO::0005599 (inherit ONT::cell))
(concept BTO::0005621 (inherit ONT::cell))
(concept BTO::0005626 (inherit ONT::cell))
(concept BTO::0005657 (inherit ONT::cell))
(concept BTO::0005658 (inherit ONT::cell))
(concept BTO::0005659 (inherit ONT::cell))

