# Explore: explore_3445
# Auto-generated LookML Explore File

include: "/views/domain_36/view_10336.view.lkml"
include: "/views/domain_38/view_10338.view.lkml"
include: "/views/domain_39/view_10339.view.lkml"
include: "/views/domain_40/view_10340.view.lkml"

explore: explore_3445 {
  label: "Explore Explore 3445"
  description: "Comprehensive analytics explore joining base view_10336 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10336
  
  always_filter: {
    filters: [view_10336.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10336.created_at_date: "7 days"]
    unless: [view_10336.id, view_10336.status]
  }

  join: view_10338 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10336.user_id} = ${view_10338.id} ;;
    required_joins: []
  }

  join: view_10339 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10336.account_id} = ${view_10339.account_id} ;;
    required_joins: [view_10338]
  }

  join: view_10340 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10336.category} = ${view_10340.category} ;;
  }

  access_filter: {
    field: view_10336.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10336.is_deleted} = false ;;
}
