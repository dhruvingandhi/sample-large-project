# Explore: explore_1922
# Auto-generated LookML Explore File

include: "/views/domain_17/view_05767.view.lkml"
include: "/views/domain_19/view_05769.view.lkml"
include: "/views/domain_20/view_05770.view.lkml"
include: "/views/domain_21/view_05771.view.lkml"

explore: explore_1922 {
  label: "Explore Explore 1922"
  description: "Comprehensive analytics explore joining base view_05767 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05767
  
  always_filter: {
    filters: [view_05767.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05767.created_at_date: "7 days"]
    unless: [view_05767.id, view_05767.status]
  }

  join: view_05769 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05767.user_id} = ${view_05769.id} ;;
    required_joins: []
  }

  join: view_05770 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05767.account_id} = ${view_05770.account_id} ;;
    required_joins: [view_05769]
  }

  join: view_05771 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05767.category} = ${view_05771.category} ;;
  }

  access_filter: {
    field: view_05767.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05767.is_deleted} = false ;;
}
