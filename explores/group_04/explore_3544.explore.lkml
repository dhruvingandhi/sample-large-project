# Explore: explore_3544
# Auto-generated LookML Explore File

include: "/views/domain_33/view_10633.view.lkml"
include: "/views/domain_35/view_10635.view.lkml"
include: "/views/domain_36/view_10636.view.lkml"
include: "/views/domain_37/view_10637.view.lkml"

explore: explore_3544 {
  label: "Explore Explore 3544"
  description: "Comprehensive analytics explore joining base view_10633 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10633
  
  always_filter: {
    filters: [view_10633.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10633.created_at_date: "7 days"]
    unless: [view_10633.id, view_10633.status]
  }

  join: view_10635 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10633.user_id} = ${view_10635.id} ;;
    required_joins: []
  }

  join: view_10636 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10633.account_id} = ${view_10636.account_id} ;;
    required_joins: [view_10635]
  }

  join: view_10637 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10633.category} = ${view_10637.category} ;;
  }

  access_filter: {
    field: view_10633.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10633.is_deleted} = false ;;
}
