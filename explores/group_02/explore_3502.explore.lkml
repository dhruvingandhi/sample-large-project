# Explore: explore_3502
# Auto-generated LookML Explore File

include: "/views/domain_07/view_10507.view.lkml"
include: "/views/domain_09/view_10509.view.lkml"
include: "/views/domain_10/view_10510.view.lkml"
include: "/views/domain_11/view_10511.view.lkml"

explore: explore_3502 {
  label: "Explore Explore 3502"
  description: "Comprehensive analytics explore joining base view_10507 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10507
  
  always_filter: {
    filters: [view_10507.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10507.created_at_date: "7 days"]
    unless: [view_10507.id, view_10507.status]
  }

  join: view_10509 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10507.user_id} = ${view_10509.id} ;;
    required_joins: []
  }

  join: view_10510 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10507.account_id} = ${view_10510.account_id} ;;
    required_joins: [view_10509]
  }

  join: view_10511 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10507.category} = ${view_10511.category} ;;
  }

  access_filter: {
    field: view_10507.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10507.is_deleted} = false ;;
}
