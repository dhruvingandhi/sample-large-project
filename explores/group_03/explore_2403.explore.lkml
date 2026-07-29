# Explore: explore_2403
# Auto-generated LookML Explore File

include: "/views/domain_10/view_07210.view.lkml"
include: "/views/domain_12/view_07212.view.lkml"
include: "/views/domain_13/view_07213.view.lkml"
include: "/views/domain_14/view_07214.view.lkml"

explore: explore_2403 {
  label: "Explore Explore 2403"
  description: "Comprehensive analytics explore joining base view_07210 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07210
  
  always_filter: {
    filters: [view_07210.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07210.created_at_date: "7 days"]
    unless: [view_07210.id, view_07210.status]
  }

  join: view_07212 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07210.user_id} = ${view_07212.id} ;;
    required_joins: []
  }

  join: view_07213 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07210.account_id} = ${view_07213.account_id} ;;
    required_joins: [view_07212]
  }

  join: view_07214 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07210.category} = ${view_07214.category} ;;
  }

  access_filter: {
    field: view_07210.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07210.is_deleted} = false ;;
}
