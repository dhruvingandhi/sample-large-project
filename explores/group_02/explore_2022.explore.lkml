# Explore: explore_2022
# Auto-generated LookML Explore File

include: "/views/domain_17/view_06067.view.lkml"
include: "/views/domain_19/view_06069.view.lkml"
include: "/views/domain_20/view_06070.view.lkml"
include: "/views/domain_21/view_06071.view.lkml"

explore: explore_2022 {
  label: "Explore Explore 2022"
  description: "Comprehensive analytics explore joining base view_06067 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06067
  
  always_filter: {
    filters: [view_06067.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06067.created_at_date: "7 days"]
    unless: [view_06067.id, view_06067.status]
  }

  join: view_06069 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06067.user_id} = ${view_06069.id} ;;
    required_joins: []
  }

  join: view_06070 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06067.account_id} = ${view_06070.account_id} ;;
    required_joins: [view_06069]
  }

  join: view_06071 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06067.category} = ${view_06071.category} ;;
  }

  access_filter: {
    field: view_06067.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06067.is_deleted} = false ;;
}
