# Explore: explore_2867
# Auto-generated LookML Explore File

include: "/views/domain_02/view_08602.view.lkml"
include: "/views/domain_04/view_08604.view.lkml"
include: "/views/domain_05/view_08605.view.lkml"
include: "/views/domain_06/view_08606.view.lkml"

explore: explore_2867 {
  label: "Explore Explore 2867"
  description: "Comprehensive analytics explore joining base view_08602 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08602
  
  always_filter: {
    filters: [view_08602.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08602.created_at_date: "7 days"]
    unless: [view_08602.id, view_08602.status]
  }

  join: view_08604 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08602.user_id} = ${view_08604.id} ;;
    required_joins: []
  }

  join: view_08605 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08602.account_id} = ${view_08605.account_id} ;;
    required_joins: [view_08604]
  }

  join: view_08606 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08602.category} = ${view_08606.category} ;;
  }

  access_filter: {
    field: view_08602.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08602.is_deleted} = false ;;
}
