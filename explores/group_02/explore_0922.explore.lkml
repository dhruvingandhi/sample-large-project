# Update for 500 file diff target
# Explore: explore_0922
# Auto-generated LookML Explore File

include: "/views/domain_17/view_02767.view.lkml"
include: "/views/domain_19/view_02769.view.lkml"
include: "/views/domain_20/view_02770.view.lkml"
include: "/views/domain_21/view_02771.view.lkml"

explore: explore_0922 {
  label: "Explore Explore 0922"
  description: "Comprehensive analytics explore joining base view_02767 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02767
  
  always_filter: {
    filters: [view_02767.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02767.created_at_date: "7 days"]
    unless: [view_02767.id, view_02767.status]
  }

  join: view_02769 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02767.user_id} = ${view_02769.id} ;;
    required_joins: []
  }

  join: view_02770 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02767.account_id} = ${view_02770.account_id} ;;
    required_joins: [view_02769]
  }

  join: view_02771 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02767.category} = ${view_02771.category} ;;
  }

  access_filter: {
    field: view_02767.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02767.is_deleted} = false ;;
}
