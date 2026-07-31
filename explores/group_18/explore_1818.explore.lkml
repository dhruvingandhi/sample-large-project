# Update for 2000 file diff target
# Explore: explore_1818
# Auto-generated LookML Explore File

include: "/views/domain_05/view_05455.view.lkml"
include: "/views/domain_07/view_05457.view.lkml"
include: "/views/domain_08/view_05458.view.lkml"
include: "/views/domain_09/view_05459.view.lkml"

explore: explore_1818 {
  label: "Explore Explore 1818"
  description: "Comprehensive analytics explore joining base view_05455 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05455
  
  always_filter: {
    filters: [view_05455.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05455.created_at_date: "7 days"]
    unless: [view_05455.id, view_05455.status]
  }

  join: view_05457 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05455.user_id} = ${view_05457.id} ;;
    required_joins: []
  }

  join: view_05458 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05455.account_id} = ${view_05458.account_id} ;;
    required_joins: [view_05457]
  }

  join: view_05459 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05455.category} = ${view_05459.category} ;;
  }

  access_filter: {
    field: view_05455.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05455.is_deleted} = false ;;
}
