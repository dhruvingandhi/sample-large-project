# Explore: explore_3812
# Auto-generated LookML Explore File

include: "/views/domain_37/view_11437.view.lkml"
include: "/views/domain_39/view_11439.view.lkml"
include: "/views/domain_40/view_11440.view.lkml"
include: "/views/domain_41/view_11441.view.lkml"

explore: explore_3812 {
  label: "Explore Explore 3812"
  description: "Comprehensive analytics explore joining base view_11437 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11437
  
  always_filter: {
    filters: [view_11437.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11437.created_at_date: "7 days"]
    unless: [view_11437.id, view_11437.status]
  }

  join: view_11439 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11437.user_id} = ${view_11439.id} ;;
    required_joins: []
  }

  join: view_11440 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11437.account_id} = ${view_11440.account_id} ;;
    required_joins: [view_11439]
  }

  join: view_11441 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11437.category} = ${view_11441.category} ;;
  }

  access_filter: {
    field: view_11437.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11437.is_deleted} = false ;;
}
