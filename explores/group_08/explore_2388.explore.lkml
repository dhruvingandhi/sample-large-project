# Explore: explore_2388
# Auto-generated LookML Explore File

include: "/views/domain_15/view_07165.view.lkml"
include: "/views/domain_17/view_07167.view.lkml"
include: "/views/domain_18/view_07168.view.lkml"
include: "/views/domain_19/view_07169.view.lkml"

explore: explore_2388 {
  label: "Explore Explore 2388"
  description: "Comprehensive analytics explore joining base view_07165 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07165
  
  always_filter: {
    filters: [view_07165.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07165.created_at_date: "7 days"]
    unless: [view_07165.id, view_07165.status]
  }

  join: view_07167 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07165.user_id} = ${view_07167.id} ;;
    required_joins: []
  }

  join: view_07168 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07165.account_id} = ${view_07168.account_id} ;;
    required_joins: [view_07167]
  }

  join: view_07169 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07165.category} = ${view_07169.category} ;;
  }

  access_filter: {
    field: view_07165.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07165.is_deleted} = false ;;
}
