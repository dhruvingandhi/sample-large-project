# Update for 2000 file diff target
# Explore: explore_2139
# Auto-generated LookML Explore File

include: "/views/domain_18/view_06418.view.lkml"
include: "/views/domain_20/view_06420.view.lkml"
include: "/views/domain_21/view_06421.view.lkml"
include: "/views/domain_22/view_06422.view.lkml"

explore: explore_2139 {
  label: "Explore Explore 2139"
  description: "Comprehensive analytics explore joining base view_06418 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06418
  
  always_filter: {
    filters: [view_06418.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06418.created_at_date: "7 days"]
    unless: [view_06418.id, view_06418.status]
  }

  join: view_06420 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06418.user_id} = ${view_06420.id} ;;
    required_joins: []
  }

  join: view_06421 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06418.account_id} = ${view_06421.account_id} ;;
    required_joins: [view_06420]
  }

  join: view_06422 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06418.category} = ${view_06422.category} ;;
  }

  access_filter: {
    field: view_06418.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06418.is_deleted} = false ;;
}
