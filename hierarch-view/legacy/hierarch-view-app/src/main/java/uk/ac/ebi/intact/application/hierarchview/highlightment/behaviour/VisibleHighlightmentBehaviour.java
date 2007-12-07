/*
Copyright (c) 2002 The European Bioinformatics Institute, and others.
All rights reserved. Please see the file LICENSE
in the root directory of this distribution.
*/
package uk.ac.ebi.intact.application.hierarchview.highlightment.behaviour;

import uk.ac.ebi.intact.application.hierarchview.business.Constants;
import uk.ac.ebi.intact.application.hierarchview.business.graph.Network;
import uk.ac.ebi.intact.service.graph.Node;

import java.util.Collection;
import java.util.List;

/**
 * Behaviour allowing to display only highlighted protein and hide all others.
 *
 * @author Samuel Kerrien (skerrien@ebi.ac.uk)
 * @version $Id$
 */

public class VisibleHighlightmentBehaviour extends HighlightmentBehaviour {

    /**
     * Select all the graph's protein which are not in the given collection.<br>
     * The aim of that behaviour is to display only se selected protein, so we
     * have to set the VISIBLE flag of all other proteins to false.
     *
     * @param proteins the list of protein to highlight
     * @param aGraph   the current interaction network
     * @return the new collection of protein to highlight
     */
    public Collection<Node> modifyCollection( Collection proteins, Network aGraph ) {

        /* Get the list of proteins in the current Network */
        List<Node> listAllProteins = aGraph.getNodes();

        /* Make a clone of the list */
        Collection newList = listAllProteins;

        /* Remove all proteins of the collection "proteins" */
        newList.removeAll( proteins );

        return newList;
    }


    /**
     * Apply the implemented behaviour to the specific Node of the graph.
     * Here, we change the visibility to false for the given node.
     *
     * @param aProtein the node on which we want to apply the behaviour
     */
    public void applyBehaviour( Node aProtein, Network aGraph ) {
        aGraph.getNodeAttributes( aProtein ).put( Constants.ATTRIBUTE_VISIBLE, Boolean.FALSE );
        //aProtein.put(Constants.ATTRIBUTE_VISIBLE, Boolean.FALSE);
    }
}









