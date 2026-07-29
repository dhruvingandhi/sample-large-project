# Explore: explore_0518
# Auto-generated LookML Explore File

include: "/views/domain_05/view_01555.view.lkml"
include: "/views/domain_07/view_01557.view.lkml"
include: "/views/domain_08/view_01558.view.lkml"
include: "/views/domain_09/view_01559.view.lkml"

explore: explore_0518 {
  label: "Explore Explore 0518"
  description: "Comprehensive analytics explore joining base view_01555 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01555
  
  always_filter: {
    filters: [view_01555.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01555.created_at_date: "7 days"]
    unless: [view_01555.id, view_01555.status]
  }

  join: view_01557 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01555.user_id} = ${view_01557.id} ;;
    required_joins: []
  }

  join: view_01558 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01555.account_id} = ${view_01558.account_id} ;;
    required_joins: [view_01557]
  }

  join: view_01559 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01555.category} = ${view_01559.category} ;;
  }

  access_filter: {
    field: view_01555.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01555.is_deleted} = false ;;
}
