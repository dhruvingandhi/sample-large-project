# Update for 2000 file diff target
# Explore: explore_1139
# Auto-generated LookML Explore File

include: "/views/domain_18/view_03418.view.lkml"
include: "/views/domain_20/view_03420.view.lkml"
include: "/views/domain_21/view_03421.view.lkml"
include: "/views/domain_22/view_03422.view.lkml"

explore: explore_1139 {
  label: "Explore Explore 1139"
  description: "Comprehensive analytics explore joining base view_03418 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03418
  
  always_filter: {
    filters: [view_03418.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03418.created_at_date: "7 days"]
    unless: [view_03418.id, view_03418.status]
  }

  join: view_03420 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03418.user_id} = ${view_03420.id} ;;
    required_joins: []
  }

  join: view_03421 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03418.account_id} = ${view_03421.account_id} ;;
    required_joins: [view_03420]
  }

  join: view_03422 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03418.category} = ${view_03422.category} ;;
  }

  access_filter: {
    field: view_03418.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03418.is_deleted} = false ;;
}
