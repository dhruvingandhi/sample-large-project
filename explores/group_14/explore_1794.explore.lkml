# Explore: explore_1794
# Auto-generated LookML Explore File

include: "/views/domain_33/view_05383.view.lkml"
include: "/views/domain_35/view_05385.view.lkml"
include: "/views/domain_36/view_05386.view.lkml"
include: "/views/domain_37/view_05387.view.lkml"

explore: explore_1794 {
  label: "Explore Explore 1794"
  description: "Comprehensive analytics explore joining base view_05383 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05383
  
  always_filter: {
    filters: [view_05383.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05383.created_at_date: "7 days"]
    unless: [view_05383.id, view_05383.status]
  }

  join: view_05385 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05383.user_id} = ${view_05385.id} ;;
    required_joins: []
  }

  join: view_05386 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05383.account_id} = ${view_05386.account_id} ;;
    required_joins: [view_05385]
  }

  join: view_05387 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05383.category} = ${view_05387.category} ;;
  }

  access_filter: {
    field: view_05383.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05383.is_deleted} = false ;;
}
