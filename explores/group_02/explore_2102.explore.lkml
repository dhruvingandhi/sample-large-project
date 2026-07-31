# Update for 500 file diff target
# Explore: explore_2102
# Auto-generated LookML Explore File

include: "/views/domain_07/view_06307.view.lkml"
include: "/views/domain_09/view_06309.view.lkml"
include: "/views/domain_10/view_06310.view.lkml"
include: "/views/domain_11/view_06311.view.lkml"

explore: explore_2102 {
  label: "Explore Explore 2102"
  description: "Comprehensive analytics explore joining base view_06307 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06307
  
  always_filter: {
    filters: [view_06307.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06307.created_at_date: "7 days"]
    unless: [view_06307.id, view_06307.status]
  }

  join: view_06309 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06307.user_id} = ${view_06309.id} ;;
    required_joins: []
  }

  join: view_06310 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06307.account_id} = ${view_06310.account_id} ;;
    required_joins: [view_06309]
  }

  join: view_06311 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06307.category} = ${view_06311.category} ;;
  }

  access_filter: {
    field: view_06307.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06307.is_deleted} = false ;;
}
