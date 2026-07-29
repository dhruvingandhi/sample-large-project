# Explore: explore_3421
# Auto-generated LookML Explore File

include: "/views/domain_14/view_10264.view.lkml"
include: "/views/domain_16/view_10266.view.lkml"
include: "/views/domain_17/view_10267.view.lkml"
include: "/views/domain_18/view_10268.view.lkml"

explore: explore_3421 {
  label: "Explore Explore 3421"
  description: "Comprehensive analytics explore joining base view_10264 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10264
  
  always_filter: {
    filters: [view_10264.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10264.created_at_date: "7 days"]
    unless: [view_10264.id, view_10264.status]
  }

  join: view_10266 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10264.user_id} = ${view_10266.id} ;;
    required_joins: []
  }

  join: view_10267 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10264.account_id} = ${view_10267.account_id} ;;
    required_joins: [view_10266]
  }

  join: view_10268 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10264.category} = ${view_10268.category} ;;
  }

  access_filter: {
    field: view_10264.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10264.is_deleted} = false ;;
}
