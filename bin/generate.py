import argparse

from berlinonline.jinjardf.site_generator import SiteGenerator

default_config_path = 'config.yml'

parser = argparse.ArgumentParser(
    description="Create a static site from an RDF graph.")
parser.add_argument('--config',
                    help=f"Path to the Jinja-RDF config file. Default: {default_config_path}",
                    type=str,
                    default=default_config_path,
                    )
parser.add_argument('--site_url',
                    help="""Specify a URL for serving the site. This will override the site_url from 
                    the config file. If no site_url is given either here or in the config file, site_url
                    will be the same as the base_url. Useful if you want to serve the site locally for
                    testing purposes.""",
                    type=str,
                    )
parser.add_argument("--serve",
                    action="store_true", 
					help="Boolean. Serve the site locally at http://localhost:8000. Off by default."
                    )
args = parser.parse_args()

generator = SiteGenerator(config_path=args.config, cli_site_url=args.site_url)
resources = generator.extract_resources()
generator.clear_site()
generator.generate_site(resources)
if args.serve:
    generator.serve_site()
