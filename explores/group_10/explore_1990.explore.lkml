# Explore: explore_1990
# Auto-generated LookML Explore File

include: "/views/domain_21/view_05971.view.lkml"
include: "/views/domain_23/view_05973.view.lkml"
include: "/views/domain_24/view_05974.view.lkml"
include: "/views/domain_25/view_05975.view.lkml"

explore: explore_1990 {
  label: "Explore Explore 1990"
  description: "Comprehensive analytics explore joining base view_05971 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05971
  
  always_filter: {
    filters: [view_05971.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05971.created_at_date: "7 days"]
    unless: [view_05971.id, view_05971.status]
  }

  join: view_05973 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05971.user_id} = ${view_05973.id} ;;
    required_joins: []
  }

  join: view_05974 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05971.account_id} = ${view_05974.account_id} ;;
    required_joins: [view_05973]
  }

  join: view_05975 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05971.category} = ${view_05975.category} ;;
  }

  access_filter: {
    field: view_05971.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05971.is_deleted} = false ;;
}
