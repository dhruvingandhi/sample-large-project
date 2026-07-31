# Update for 2000 file diff target
# Explore: explore_1780
# Auto-generated LookML Explore File

include: "/views/domain_41/view_05341.view.lkml"
include: "/views/domain_43/view_05343.view.lkml"
include: "/views/domain_44/view_05344.view.lkml"
include: "/views/domain_45/view_05345.view.lkml"

explore: explore_1780 {
  label: "Explore Explore 1780"
  description: "Comprehensive analytics explore joining base view_05341 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05341
  
  always_filter: {
    filters: [view_05341.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05341.created_at_date: "7 days"]
    unless: [view_05341.id, view_05341.status]
  }

  join: view_05343 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05341.user_id} = ${view_05343.id} ;;
    required_joins: []
  }

  join: view_05344 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05341.account_id} = ${view_05344.account_id} ;;
    required_joins: [view_05343]
  }

  join: view_05345 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05341.category} = ${view_05345.category} ;;
  }

  access_filter: {
    field: view_05341.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05341.is_deleted} = false ;;
}
