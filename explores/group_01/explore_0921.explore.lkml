# Explore: explore_0921
# Auto-generated LookML Explore File

include: "/views/domain_14/view_02764.view.lkml"
include: "/views/domain_16/view_02766.view.lkml"
include: "/views/domain_17/view_02767.view.lkml"
include: "/views/domain_18/view_02768.view.lkml"

explore: explore_0921 {
  label: "Explore Explore 0921"
  description: "Comprehensive analytics explore joining base view_02764 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02764
  
  always_filter: {
    filters: [view_02764.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02764.created_at_date: "7 days"]
    unless: [view_02764.id, view_02764.status]
  }

  join: view_02766 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02764.user_id} = ${view_02766.id} ;;
    required_joins: []
  }

  join: view_02767 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02764.account_id} = ${view_02767.account_id} ;;
    required_joins: [view_02766]
  }

  join: view_02768 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02764.category} = ${view_02768.category} ;;
  }

  access_filter: {
    field: view_02764.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02764.is_deleted} = false ;;
}
