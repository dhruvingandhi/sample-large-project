# Explore: explore_2156
# Auto-generated LookML Explore File

include: "/views/domain_19/view_06469.view.lkml"
include: "/views/domain_21/view_06471.view.lkml"
include: "/views/domain_22/view_06472.view.lkml"
include: "/views/domain_23/view_06473.view.lkml"

explore: explore_2156 {
  label: "Explore Explore 2156"
  description: "Comprehensive analytics explore joining base view_06469 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06469
  
  always_filter: {
    filters: [view_06469.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06469.created_at_date: "7 days"]
    unless: [view_06469.id, view_06469.status]
  }

  join: view_06471 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06469.user_id} = ${view_06471.id} ;;
    required_joins: []
  }

  join: view_06472 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06469.account_id} = ${view_06472.account_id} ;;
    required_joins: [view_06471]
  }

  join: view_06473 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06469.category} = ${view_06473.category} ;;
  }

  access_filter: {
    field: view_06469.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06469.is_deleted} = false ;;
}
