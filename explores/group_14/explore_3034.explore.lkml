# Explore: explore_3034
# Auto-generated LookML Explore File

include: "/views/domain_03/view_09103.view.lkml"
include: "/views/domain_05/view_09105.view.lkml"
include: "/views/domain_06/view_09106.view.lkml"
include: "/views/domain_07/view_09107.view.lkml"

explore: explore_3034 {
  label: "Explore Explore 3034"
  description: "Comprehensive analytics explore joining base view_09103 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09103
  
  always_filter: {
    filters: [view_09103.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09103.created_at_date: "7 days"]
    unless: [view_09103.id, view_09103.status]
  }

  join: view_09105 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09103.user_id} = ${view_09105.id} ;;
    required_joins: []
  }

  join: view_09106 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09103.account_id} = ${view_09106.account_id} ;;
    required_joins: [view_09105]
  }

  join: view_09107 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09103.category} = ${view_09107.category} ;;
  }

  access_filter: {
    field: view_09103.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09103.is_deleted} = false ;;
}
