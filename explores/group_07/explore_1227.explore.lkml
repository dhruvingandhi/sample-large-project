# Explore: explore_1227
# Auto-generated LookML Explore File

include: "/views/domain_32/view_03682.view.lkml"
include: "/views/domain_34/view_03684.view.lkml"
include: "/views/domain_35/view_03685.view.lkml"
include: "/views/domain_36/view_03686.view.lkml"

explore: explore_1227 {
  label: "Explore Explore 1227"
  description: "Comprehensive analytics explore joining base view_03682 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03682
  
  always_filter: {
    filters: [view_03682.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03682.created_at_date: "7 days"]
    unless: [view_03682.id, view_03682.status]
  }

  join: view_03684 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03682.user_id} = ${view_03684.id} ;;
    required_joins: []
  }

  join: view_03685 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03682.account_id} = ${view_03685.account_id} ;;
    required_joins: [view_03684]
  }

  join: view_03686 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03682.category} = ${view_03686.category} ;;
  }

  access_filter: {
    field: view_03682.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03682.is_deleted} = false ;;
}
