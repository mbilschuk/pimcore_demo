<?php

/**
 * Pimcore
 *
 * This source file is available under two different licenses:
 * - GNU General Public License version 3 (GPLv3)
 * - Pimcore Enterprise License (PEL)
 * Full copyright and license information is available in
 * LICENSE.md which is distributed with this source code.
 *
 *  @copyright  Copyright (c) Pimcore GmbH (http://www.pimcore.org)
 *  @license    http://www.pimcore.org/license     GPLv3 and PEL
 */

namespace App\Controller;

use Pimcore\Model\Asset;
use Pimcore\Model\Exception\NotFoundException;
use Symfony\Component\HttpFoundation\Request;
use Pimcore\Model\Asset\Image;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class DropImageController extends BaseController {

    /**
     * Return sha256 fingerprint of image
     *
     * @param Image $image
     * @return string
     */
    private function getSha256Value(Image $image ): string
    {
        $fullPath = PIMCORE_WEB_ROOT . '/var/assets' . $image->getRealFullPath();
        return hash('sha256', file_get_contents($fullPath));
    }

    /**
     * @Template
     *
     * @param Request $request
     * @return array
     */
    public function imageAction(Request $request): array
    {
        if ('asset' === $request->get('type')) {
            $asset = Asset::getById($request->get('id'));
            if ($asset instanceof  Asset\Image) {
                return [
                    'sha256value' => $this->getSha256Value($asset),
                    'image' => $asset,
                ];
            }
        }
        throw new NotFoundException('Not a image or image not found');
    }
}
