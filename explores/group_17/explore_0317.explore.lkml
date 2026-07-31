# Update for 2000 file diff target
# Explore: explore_0317
# Auto-generated LookML Explore File

include: "/views/domain_02/view_00952.view.lkml"
include: "/views/domain_04/view_00954.view.lkml"
include: "/views/domain_05/view_00955.view.lkml"
include: "/views/domain_06/view_00956.view.lkml"

explore: explore_0317 {
  label: "Explore Explore 0317"
  description: "Comprehensive analytics explore joining base view_00952 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00952
  
  always_filter: {
    filters: [view_00952.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00952.created_at_date: "7 days"]
    unless: [view_00952.id, view_00952.status]
  }

  join: view_00954 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00952.user_id} = ${view_00954.id} ;;
    required_joins: []
  }

  join: view_00955 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00952.account_id} = ${view_00955.account_id} ;;
    required_joins: [view_00954]
  }

  join: view_00956 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00952.category} = ${view_00956.category} ;;
  }

  access_filter: {
    field: view_00952.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00952.is_deleted} = false ;;
}
