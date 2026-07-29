# Explore: explore_3689
# Auto-generated LookML Explore File

include: "/views/domain_18/view_11068.view.lkml"
include: "/views/domain_20/view_11070.view.lkml"
include: "/views/domain_21/view_11071.view.lkml"
include: "/views/domain_22/view_11072.view.lkml"

explore: explore_3689 {
  label: "Explore Explore 3689"
  description: "Comprehensive analytics explore joining base view_11068 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11068
  
  always_filter: {
    filters: [view_11068.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11068.created_at_date: "7 days"]
    unless: [view_11068.id, view_11068.status]
  }

  join: view_11070 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11068.user_id} = ${view_11070.id} ;;
    required_joins: []
  }

  join: view_11071 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11068.account_id} = ${view_11071.account_id} ;;
    required_joins: [view_11070]
  }

  join: view_11072 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11068.category} = ${view_11072.category} ;;
  }

  access_filter: {
    field: view_11068.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11068.is_deleted} = false ;;
}
