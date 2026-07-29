# Explore: explore_1026
# Auto-generated LookML Explore File

include: "/views/domain_29/view_03079.view.lkml"
include: "/views/domain_31/view_03081.view.lkml"
include: "/views/domain_32/view_03082.view.lkml"
include: "/views/domain_33/view_03083.view.lkml"

explore: explore_1026 {
  label: "Explore Explore 1026"
  description: "Comprehensive analytics explore joining base view_03079 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03079
  
  always_filter: {
    filters: [view_03079.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03079.created_at_date: "7 days"]
    unless: [view_03079.id, view_03079.status]
  }

  join: view_03081 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03079.user_id} = ${view_03081.id} ;;
    required_joins: []
  }

  join: view_03082 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03079.account_id} = ${view_03082.account_id} ;;
    required_joins: [view_03081]
  }

  join: view_03083 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03079.category} = ${view_03083.category} ;;
  }

  access_filter: {
    field: view_03079.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03079.is_deleted} = false ;;
}
