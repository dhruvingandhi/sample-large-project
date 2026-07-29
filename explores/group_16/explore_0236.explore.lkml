# Explore: explore_0236
# Auto-generated LookML Explore File

include: "/views/domain_09/view_00709.view.lkml"
include: "/views/domain_11/view_00711.view.lkml"
include: "/views/domain_12/view_00712.view.lkml"
include: "/views/domain_13/view_00713.view.lkml"

explore: explore_0236 {
  label: "Explore Explore 0236"
  description: "Comprehensive analytics explore joining base view_00709 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00709
  
  always_filter: {
    filters: [view_00709.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00709.created_at_date: "7 days"]
    unless: [view_00709.id, view_00709.status]
  }

  join: view_00711 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00709.user_id} = ${view_00711.id} ;;
    required_joins: []
  }

  join: view_00712 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00709.account_id} = ${view_00712.account_id} ;;
    required_joins: [view_00711]
  }

  join: view_00713 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00709.category} = ${view_00713.category} ;;
  }

  access_filter: {
    field: view_00709.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00709.is_deleted} = false ;;
}
