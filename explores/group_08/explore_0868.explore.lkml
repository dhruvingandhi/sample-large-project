# Explore: explore_0868
# Auto-generated LookML Explore File

include: "/views/domain_05/view_02605.view.lkml"
include: "/views/domain_07/view_02607.view.lkml"
include: "/views/domain_08/view_02608.view.lkml"
include: "/views/domain_09/view_02609.view.lkml"

explore: explore_0868 {
  label: "Explore Explore 0868"
  description: "Comprehensive analytics explore joining base view_02605 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02605
  
  always_filter: {
    filters: [view_02605.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02605.created_at_date: "7 days"]
    unless: [view_02605.id, view_02605.status]
  }

  join: view_02607 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02605.user_id} = ${view_02607.id} ;;
    required_joins: []
  }

  join: view_02608 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02605.account_id} = ${view_02608.account_id} ;;
    required_joins: [view_02607]
  }

  join: view_02609 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02605.category} = ${view_02609.category} ;;
  }

  access_filter: {
    field: view_02605.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02605.is_deleted} = false ;;
}
