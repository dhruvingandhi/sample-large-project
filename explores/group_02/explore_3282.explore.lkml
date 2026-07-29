# Explore: explore_3282
# Auto-generated LookML Explore File

include: "/views/domain_47/view_09847.view.lkml"
include: "/views/domain_49/view_09849.view.lkml"
include: "/views/domain_50/view_09850.view.lkml"
include: "/views/domain_01/view_09851.view.lkml"

explore: explore_3282 {
  label: "Explore Explore 3282"
  description: "Comprehensive analytics explore joining base view_09847 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09847
  
  always_filter: {
    filters: [view_09847.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09847.created_at_date: "7 days"]
    unless: [view_09847.id, view_09847.status]
  }

  join: view_09849 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09847.user_id} = ${view_09849.id} ;;
    required_joins: []
  }

  join: view_09850 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09847.account_id} = ${view_09850.account_id} ;;
    required_joins: [view_09849]
  }

  join: view_09851 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09847.category} = ${view_09851.category} ;;
  }

  access_filter: {
    field: view_09847.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09847.is_deleted} = false ;;
}
