# Explore: explore_2203
# Auto-generated LookML Explore File

include: "/views/domain_10/view_06610.view.lkml"
include: "/views/domain_12/view_06612.view.lkml"
include: "/views/domain_13/view_06613.view.lkml"
include: "/views/domain_14/view_06614.view.lkml"

explore: explore_2203 {
  label: "Explore Explore 2203"
  description: "Comprehensive analytics explore joining base view_06610 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06610
  
  always_filter: {
    filters: [view_06610.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06610.created_at_date: "7 days"]
    unless: [view_06610.id, view_06610.status]
  }

  join: view_06612 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06610.user_id} = ${view_06612.id} ;;
    required_joins: []
  }

  join: view_06613 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06610.account_id} = ${view_06613.account_id} ;;
    required_joins: [view_06612]
  }

  join: view_06614 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06610.category} = ${view_06614.category} ;;
  }

  access_filter: {
    field: view_06610.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06610.is_deleted} = false ;;
}
