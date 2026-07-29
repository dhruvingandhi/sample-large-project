# Explore: explore_3022
# Auto-generated LookML Explore File

include: "/views/domain_17/view_09067.view.lkml"
include: "/views/domain_19/view_09069.view.lkml"
include: "/views/domain_20/view_09070.view.lkml"
include: "/views/domain_21/view_09071.view.lkml"

explore: explore_3022 {
  label: "Explore Explore 3022"
  description: "Comprehensive analytics explore joining base view_09067 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09067
  
  always_filter: {
    filters: [view_09067.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09067.created_at_date: "7 days"]
    unless: [view_09067.id, view_09067.status]
  }

  join: view_09069 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09067.user_id} = ${view_09069.id} ;;
    required_joins: []
  }

  join: view_09070 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09067.account_id} = ${view_09070.account_id} ;;
    required_joins: [view_09069]
  }

  join: view_09071 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09067.category} = ${view_09071.category} ;;
  }

  access_filter: {
    field: view_09067.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09067.is_deleted} = false ;;
}
